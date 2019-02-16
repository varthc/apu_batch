:: v3.0
@echo off

rem Get param to create the exclude file.
set createEternalFiles=%~1
set createProjectFiles=%~2

if not defined createProjectFiles goto projectFiles
if "%createProjectFiles%" == "y" goto projectFiles
goto end

:projectFiles
	rem Get the path where it's this file.
	set projectPath="%~dp0"

	rem Copy proxy.
	@ xcopy /s /i /Y "%projectPath%\files\proxy.conf.json" "%projectPath%" >NUL
	echo Proxy file copied.

	rem Copy auth service.
	set /p authPackage=<files\auth_package.txt
	@ xcopy /s /i /Y "%projectPath%\files\authorization.service.ts" "%projectPath%\node_modules\%authPackage%\src\app\authorization" >NUL
	echo Auth service copied.
:end

rem Copie exclude file and pre-push hook.
if "%createEternalFiles%" == "y" (
	@ xcopy /s /i /Y "%projectPath%\files\exclude" "%projectPath%\.git\info" >NUL
	echo Local ignore file copied.
	
	@ xcopy /s /i /Y "%projectPath%\files\pre-push" "%projectPath%\.git\hooks" >NUL
	echo Pre-push hook copied.
)

echo Thank you, come again!
