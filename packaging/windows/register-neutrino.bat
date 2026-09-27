@echo off
powershell -NoProfile -ExecutionPolicy Bypass -File "%~dp0register-neutrino.ps1" %*
pause
