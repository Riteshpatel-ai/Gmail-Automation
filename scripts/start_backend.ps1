# Start backend server
cd backend
if (Test-Path "venv\Scripts\python.exe") {
    & "venv\Scripts\python.exe" -m uvicorn app.main:app --reload --host 0.0.0.0 --port 8000
} else {
    Write-Host "Virtual environment not found. Run setup.ps1 first." -ForegroundColor Red
}
