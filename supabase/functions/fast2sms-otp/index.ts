// fast2sms-otp
// Server-side OTP generation + verification via Fast2SMS.
// Replaces the insecure client-side OTP flow in the mobile app.
//
// POST { phone, action: "send" }       → generates OTP, sends via Fast2SMS, stores server-side
// POST { phone, action: "verify", otp } → verifies the OTP
//
// Required secrets:
//   FAST2SMS_API_KEY
//   SUPABASE_URL, SUPABASE_SERVICE_ROLE_KEY (auto-provided)

import { serve } from "https://deno.land/std@0.190.0/http/server.ts";
import { createClient } from "https://esm.sh/@supabase/supabase-js@2";
import { corsHeaders, withCors } from "../_shared/cors.ts";

const FAST2SMS_API_KEY = Deno.env.get("FAST2SMS_API_KEY")!;
const FAST2SMS_BASE_URL = "https://www.fast2sms.com/dev/bulkV2";
const SUPABASE_URL = Deno.env.get("SUPABASE_URL")!;
const SERVICE_ROLE_KEY = Deno.env.get("SUPABASE_SERVICE_ROLE_KEY")!;

const OTP_LENGTH = 6;
const OTP_EXPIRY_MS = 5 * 60 * 1000; // 5 minutes
const MAX_VERIFY_ATTEMPTS = 3;
const MAX_RESEND_ATTEMPTS = 5;
const RESEND_LOCKOUT_MS = 10 * 60 * 1000; // 10 minutes

// In-memory OTP store (phone → { otp, expiresAt, attempts, resendCount, lockedUntil })
// NOTE: In production with multiple Edge Function instances, consider using
// a Supabase table or Redis for shared state. For single-instance deployments
// this in-memory approach works fine.
const otpStore: Record<
  string,
  {
    otp: string;
    expiresAt: number;
    attempts: number;
    resendCount: number;
    lockedUntil?: number;
  }
> = {};

function generateOTP(length = OTP_LENGTH): string {
  let otp = "";
  for (let i = 0; i < length; i++) {
    otp += Math.floor(Math.random() * 10).toString();
  }
  return otp;
}

function normalisePhone(phone: string): string {
  const digits = phone.replace(/[^0-9]/g, "");
  if (digits.length >= 12 && digits.startsWith("91")) return digits.slice(2);
  if (digits.length === 11 && digits.startsWith("0")) return digits.slice(1);
  if (digits.length === 10) return digits;
  return digits.slice(-10);
}

serve(async (req) => {
  if (req.method === "OPTIONS") {
    return new Response("ok", { headers: corsHeaders });
  }

  try {
    const { phone, action, otp: userOtp } = await req.json();

    if (!phone || !action) {
      return withCors({ error: "phone and action are required" }, 400);
    }

    const mobile = normalisePhone(phone);
    if (mobile.length !== 10) {
      return withCors(
        { error: "Please enter a valid 10-digit Indian mobile number" },
        400,
      );
    }

    // ─── SEND OTP ────────────────────────────────────────────────────────
    if (action === "send") {
      const existing = otpStore[mobile];

      // Lockout check
      if (existing?.lockedUntil && Date.now() < existing.lockedUntil) {
        const minsLeft = Math.ceil(
          (existing.lockedUntil - Date.now()) / 60000,
        );
        return withCors(
          {
            error: `Too many attempts. Please try again in ${minsLeft} minute(s).`,
          },
          429,
        );
      }

      const resendCount = (existing?.resendCount || 0) + 1;
      if (resendCount > MAX_RESEND_ATTEMPTS) {
        otpStore[mobile] = {
          ...existing!,
          lockedUntil: Date.now() + RESEND_LOCKOUT_MS,
          resendCount,
        };
        return withCors(
          {
            error:
              "Too many OTP requests. Please try again after 10 minutes.",
          },
          429,
        );
      }

      const otp = generateOTP();

      // Call Fast2SMS
      if (!FAST2SMS_API_KEY) {
        return withCors(
          { error: "Fast2SMS API key is not configured on the server" },
          500,
        );
      }

      const url = `${FAST2SMS_BASE_URL}?authorization=${encodeURIComponent(FAST2SMS_API_KEY)}&route=otp&variables_values=${otp}&flash=0&numbers=${mobile}`;

      const response = await fetch(url, {
        method: "GET",
        headers: { "cache-control": "no-cache" },
      });

      const data = await response.json();

      if (!response.ok || data.return === false) {
        const msg = data.message?.[0] || data.message || "Failed to send OTP";
        return withCors({ error: msg }, 502);
      }

      // Store OTP server-side
      otpStore[mobile] = {
        otp,
        expiresAt: Date.now() + OTP_EXPIRY_MS,
        attempts: 0,
        resendCount,
      };

      return withCors({ success: true, message: "OTP sent successfully" });
    }

    // ─── VERIFY OTP ──────────────────────────────────────────────────────
    if (action === "verify") {
      if (!userOtp) {
        return withCors({ error: "otp is required for verification" }, 400);
      }

      const entry = otpStore[mobile];

      if (!entry) {
        return withCors(
          {
            error:
              "No OTP was sent to this number. Please request a new OTP.",
          },
          400,
        );
      }

      // Expiry check
      if (Date.now() > entry.expiresAt) {
        delete otpStore[mobile];
        return withCors(
          { error: "OTP has expired. Please request a new code." },
          400,
        );
      }

      // Attempt limit
      if (entry.attempts >= MAX_VERIFY_ATTEMPTS) {
        delete otpStore[mobile];
        return withCors(
          {
            error:
              "Too many incorrect attempts. Please request a new OTP.",
          },
          400,
        );
      }

      entry.attempts += 1;

      if (userOtp !== entry.otp) {
        const remaining = MAX_VERIFY_ATTEMPTS - entry.attempts;
        if (remaining <= 0) {
          delete otpStore[mobile];
          return withCors(
            {
              error:
                "Too many incorrect attempts. Please request a new OTP.",
            },
            400,
          );
        }
        return withCors(
          {
            error: `Incorrect OTP. ${remaining} attempt(s) remaining.`,
          },
          400,
        );
      }

      // Success — clear store
      delete otpStore[mobile];
      return withCors({
        success: true,
        message: "OTP verified successfully",
      });
    }

    return withCors({ error: 'Invalid action. Use "send" or "verify".' }, 400);
  } catch (e) {
    console.error("fast2sms-otp error", e);
    return withCors({ error: (e as Error).message }, 500);
  }
});
