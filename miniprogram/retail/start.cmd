@echo off
rem Launch TDesign retail miniprogram in WeChat DevTools
rem D:\wxdevtools is a junction to the real install dir (avoids non-ASCII path issues)
set "DT=D:\wxdevtools"
set "PROJ=%~dp0"
echo [1/2] Opening project in WeChat DevTools (scan QR code if login is required)...
"%DT%\node.exe" "%DT%\cli.js" open --project "%PROJ%"
if errorlevel 1 goto manual
echo [2/2] Building npm (tdesign-miniprogram to miniprogram_npm)...
"%DT%\node.exe" "%DT%\cli.js" build-npm --project "%PROJ%"
echo Done. Simulator should show the retail starter home page.
pause
exit /b

:manual
echo.
echo =================================*****************************
echo  CLI open failed. Do this ONE TIME setup:
echo  1. Open WeChat DevTools manually (start menu or desktop icon)
echo  2. Scan the QR code with WeChat to log in
echo  3. In DevTools: Settings (gear) - Security Settings -
echo     turn ON "Service Port" (an quan she zhi - fu wu duan kou)
echo  4. Close DevTools, then run start.cmd again
echo =================================*****************************
pause
