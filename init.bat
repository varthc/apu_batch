@echo off

::Obtiene el path de donde esta el archivo.
set projectPath="%~dp0"

::Copia proxy.
@ xcopy /s /i /Y "%projectPath%\files\proxy.conf.json" "%projectPath%" >NUL
echo Copiado proxy.

::Copia auth service.
@ xcopy /s /i /Y "%projectPath%\files\authorization.service.ts" "%projectPath%\src\app" >NUL
echo Copiado auth service.

::Crea archivo exclude y agrega lo que quiero excluir localmente.
(
echo #Files and folders to ignore
echo /files
echo .vscode/
echo init.bat
) > "%projectPath%\.git\info\exclude"

echo Creado ignore local.
echo Gracias, vuelva prontos!
