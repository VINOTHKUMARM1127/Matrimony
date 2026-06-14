import React from 'react';

const Button = ({ children, onClick, isLoading, type = 'button', className = '', fullWidth }) => (
  <button
    type={type}
    onClick={onClick}
    disabled={isLoading}
    className={`px-4 py-2 font-bold rounded-lg transition-colors bg-primary-500 text-white hover:bg-primary-600 disabled:opacity-50 ${fullWidth ? 'w-full' : ''} ${className}`}
  >
    {isLoading ? 'Wait...' : children}
  </button>
);

export default Button;
