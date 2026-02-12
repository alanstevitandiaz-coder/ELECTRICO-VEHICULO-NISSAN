@echo off

call "setup_mingw.bat"


call  "\\Ignazzzio\D$\Program Files\MATLAB\R2025b\bin\win64\checkMATLABRootForDriveMap.exe" "\\Ignazzzio\D$\Program Files\MATLAB\R2025b"  > mlEnv.txt
for /f %%a in (mlEnv.txt) do set "%%a"\n
cd .

if "%1"=="" ("%MINGW_ROOT%\mingw32-make.exe" MATLAB_ROOT=%MATLAB_ROOT% ALT_MATLAB_ROOT=%ALT_MATLAB_ROOT% MATLAB_BIN=%MATLAB_BIN% ALT_MATLAB_BIN=%ALT_MATLAB_BIN%  -j 8 -l 8 -Oline -f SimpleECU.mk all) else ("%MINGW_ROOT%\mingw32-make.exe" MATLAB_ROOT=%MATLAB_ROOT% ALT_MATLAB_ROOT=%ALT_MATLAB_ROOT% MATLAB_BIN=%MATLAB_BIN% ALT_MATLAB_BIN=%ALT_MATLAB_BIN%  -j 8 -l 8 -Oline -f SimpleECU.mk %1)
@if errorlevel 1 goto error_exit

exit /B 0

:error_exit
echo The make command returned an error of %errorlevel%
exit /B 1