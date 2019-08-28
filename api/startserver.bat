@echo off
for /f "skip=1 delims={}, " %%A in ('wmic nicconfig get ipaddress') do for /f "tokens=1" %%B in ("%%~A") do set "IP=%%~B"

echo Public IP is: %IP%

start chrome %IP%:5000

set FLASK_DEBUG = true
python -m flask run --host=%IP% --port=5000
