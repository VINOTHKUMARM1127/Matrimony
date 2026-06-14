import { useState, useRef } from 'react';
import * as adminApi from '../../api/adminApi';
import Card from '../../components/common/Card';
import Button from '../../components/common/Button';
import { UploadCloud, CheckCircle, AlertCircle, FileJson, Type } from 'lucide-react';

const BulkUploader = () => {
  const [uploadMethod, setUploadMethod] = useState('file'); // 'file' or 'paste'
  const [file, setFile] = useState(null);
  const [pastedJson, setPastedJson] = useState('');
  const [isUploading, setIsUploading] = useState(false);
  const [results, setResults] = useState(null);
  const fileInputRef = useRef(null);

  const handleFileChange = (e) => {
    const selected = e.target.files[0];
    if (selected && selected.type === 'application/json') {
      setFile(selected);
      setResults(null);
    } else {
      alert('Please select a valid JSON file.');
      setFile(null);
    }
  };

  const processJsonArray = async (jsonArray) => {
    if (!Array.isArray(jsonArray)) {
      throw new Error('JSON data must be an array of user objects.');
    }

    if (jsonArray.length === 0) {
      throw new Error('JSON array is empty.');
    }

    // Validate required fields
    const requiredFields = ['email', 'password', 'display_name', 'gender'];
    for (let i = 0; i < jsonArray.length; i++) {
      const user = jsonArray[i];
      for (const field of requiredFields) {
        if (!user[field]) {
          throw new Error(`Row ${i + 1} (${user.email || 'Unknown'}): Missing required field "${field}".`);
        }
      }
    }

    const uploadResults = await adminApi.bulkUploadUsers(jsonArray);
    setResults(uploadResults);
    
    // Clear inputs after successful processing
    setFile(null);
    setPastedJson('');
    if (fileInputRef.current) fileInputRef.current.value = '';
  };

  const handleFileUpload = async () => {
    if (!file) return;
    
    setIsUploading(true);
    setResults(null);

    const reader = new FileReader();
    reader.onload = async (e) => {
      try {
        const json = JSON.parse(e.target.result);
        await processJsonArray(json);
      } catch (err) {
        console.error(err);
        alert(`Error: ${err.message}`);
      } finally {
        setIsUploading(false);
      }
    };
    reader.readAsText(file);
  };

  const handlePasteUpload = async () => {
    if (!pastedJson.trim()) return;
    
    setIsUploading(true);
    setResults(null);

    try {
      const json = JSON.parse(pastedJson);
      await processJsonArray(json);
    } catch (err) {
      console.error(err);
      alert(`Error: ${err.message}`);
    } finally {
      setIsUploading(false);
    }
  };

  const sampleJsonStr = `[
  {
    "email": "sample@example.com",
    "password": "TempPassword123!",
    "display_name": "Arun Kumar",
    "gender": "male",
    "date_of_birth": "1994-08-20",
    "phone": "9876543210",
    "religion": "Hindu",
    "caste": "Mudaliar",
    "city": "Chennai",
    "education": "B.E. / B.Tech.",
    "occupation": "Software Engineer"
  }
]`;

  const copySample = () => {
    navigator.clipboard.writeText(sampleJsonStr)
      .then(() => alert('Sample JSON copied to clipboard!'))
      .catch(err => alert('Failed to copy text: ' + err));
  };

  return (
    <div className="max-w-3xl mx-auto pb-12">
      <h1 className="text-2xl font-bold text-neutral-900 mb-6">Bulk Upload Users</h1>
      
      <div className="flex bg-neutral-100 p-1 rounded-lg mb-6 w-fit">
        <button
          onClick={() => setUploadMethod('file')}
          className={`flex items-center gap-2 px-4 py-2 rounded-md text-sm font-medium transition-colors ${
            uploadMethod === 'file' ? 'bg-white text-neutral-900 shadow-sm' : 'text-neutral-500 hover:text-neutral-700'
          }`}
        >
          <FileJson size={16} />
          Upload JSON File
        </button>
        <button
          onClick={() => setUploadMethod('paste')}
          className={`flex items-center gap-2 px-4 py-2 rounded-md text-sm font-medium transition-colors ${
            uploadMethod === 'paste' ? 'bg-white text-neutral-900 shadow-sm' : 'text-neutral-500 hover:text-neutral-700'
          }`}
        >
          <Type size={16} />
          Paste JSON Text
        </button>
      </div>

      <Card className="p-8 mb-8">
        {uploadMethod === 'file' ? (
          <div 
            className="border-2 border-dashed border-neutral-300 rounded-xl p-12 text-center hover:bg-neutral-50 transition-colors cursor-pointer"
            onClick={() => fileInputRef.current?.click()}
          >
            <input 
              type="file" 
              ref={fileInputRef} 
              accept=".json" 
              className="hidden" 
              onChange={handleFileChange}
            />
            
            <div className="w-16 h-16 bg-primary-100 text-primary rounded-full flex items-center justify-center mx-auto mb-4">
              {file ? <CheckCircle size={32} className="text-success-500" /> : <UploadCloud size={32} />}
            </div>
            
            <h3 className="text-lg font-bold text-neutral-900 mb-2">
              {file ? file.name : 'Click to select a JSON file'}
            </h3>
            <p className="text-neutral-500 text-sm max-w-sm mx-auto">
              Upload a JSON file containing an array of user objects. The system will automatically create auth accounts and profile records.
            </p>

            {file && (
              <Button 
                className="mt-6" 
                onClick={(e) => {
                  e.stopPropagation();
                  handleFileUpload();
                }}
                isLoading={isUploading}
              >
                Start File Upload Process
              </Button>
            )}
          </div>
        ) : (
          <div>
            <label className="block text-sm font-medium text-neutral-700 mb-2">
              Paste your JSON array here
            </label>
            <textarea
              className="w-full h-64 p-4 border border-neutral-200 rounded-lg font-mono text-sm focus:outline-none focus:ring-2 focus:ring-primary-500 focus:border-transparent"
              placeholder={'[\n  {\n    "email": "user@example.com",\n    "password": "SecurePass123",\n    "display_name": "John Doe",\n    "gender": "male"\n  }\n]'}
              value={pastedJson}
              onChange={(e) => setPastedJson(e.target.value)}
            ></textarea>
            
            <div className="mt-4 flex justify-end">
              <Button 
                onClick={handlePasteUpload}
                isLoading={isUploading}
                disabled={!pastedJson.trim()}
              >
                Start Processing Text
              </Button>
            </div>
          </div>
        )}
      </Card>

      {results && (
        <Card className="p-6 mb-8">
          <h3 className="text-lg font-bold text-neutral-900 mb-4">Upload Results</h3>
          
          <div className="flex gap-4 mb-6">
            <div className="flex-1 bg-success-50 border border-success-200 p-4 rounded-lg flex items-center gap-3">
              <CheckCircle className="text-success-500" size={24} />
              <div>
                <p className="text-sm text-success-700 font-medium">Successfully Created</p>
                <p className="text-2xl font-bold text-success-900">{results.success}</p>
              </div>
            </div>
            
            <div className="flex-1 bg-error-50 border border-error-200 p-4 rounded-lg flex items-center gap-3">
              <AlertCircle className="text-error-500" size={24} />
              <div>
                <p className="text-sm text-error-700 font-medium">Failed</p>
                <p className="text-2xl font-bold text-error-900">{results.failed}</p>
              </div>
            </div>
          </div>

          {results.errors?.length > 0 && (
            <div>
              <p className="font-semibold text-neutral-900 mb-2">Error Logs:</p>
              <div className="bg-neutral-900 text-neutral-300 p-4 rounded-lg text-sm font-mono h-48 overflow-y-auto">
                {results.errors.map((err, idx) => (
                  <div key={idx} className="mb-1 text-error-400">• {err}</div>
                ))}
              </div>
            </div>
          )}
        </Card>
      )}

      <Card className="p-6 bg-primary-50 border border-primary-100">
        <div className="flex justify-between items-center mb-4">
          <div>
            <h3 className="font-bold text-primary-900 mb-1">Sample JSON Format</h3>
            <p className="text-xs text-primary-700">Required fields: email, password, display_name, gender</p>
          </div>
          <Button variant="outline" onClick={copySample} className="bg-white hover:bg-neutral-50 text-xs py-1.5 px-3">
            Copy Sample JSON
          </Button>
        </div>
        <pre className="bg-white p-4 rounded-lg text-xs overflow-x-auto text-neutral-800 border border-primary-100">
{sampleJsonStr}
        </pre>
      </Card>
    </div>
  );
};

export default BulkUploader;
