@ECHO OFF

:: CALL rmdir "%~dp0artifacts\" /s /q
CALL rmdir "artifacts" /s /q

SET msbuild="%windir%\Microsoft.NET\Framework\v4.0.30319\msbuild.exe"

:: Build the solution. Override the platform to account for running
:: from Visual Studio Tools command prompt (x64). Log quietly to the 
:: console and verbosely to a file.
%msbuild% src/MarkPad.Setup.sln /nologo /property:Configuration=Release /verbosity:minimal /flp:verbosity=diagnostic

:: get build output and copy out to root 
:: CALL xcopy "%~dp0src\MarkPad.Setup\bin\Release\*.msi" "%~dp0artifacts\" /s /e /Y
CALL xcopy "src\MarkPad.Setup\bin\Release\*.msi" "artifacts\" /s /e /Y
IF NOT ERRORLEVEL 0 EXIT /B %ERRORLEVEL%
