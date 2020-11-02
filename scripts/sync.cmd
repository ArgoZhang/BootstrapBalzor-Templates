@echo off
if "%1" == "" (
    echo Please provider SolutionDir like: "$(MSBuildThisFileDirectory)"
    exit /B
)

set sourceDir=%1..\template-ui\src
set targetDir=%1src

echo "Ready to copy files to dist

echo xcopy %sourceDir%\*.* %targetDir% /y

rd /Q /S %targetDir%\BootstrapBlazorApp*
rd /Q /S %sourceDir%\.vs
rd /Q /S %sourceDir%\BootstrapBlazorApp.Server\bin
rd /Q /S %sourceDir%\BootstrapBlazorApp.Server\obj
rd /Q /S %sourceDir%\BootstrapBlazorApp.WebAssembly\bin
rd /Q /S %sourceDir%\BootstrapBlazorApp.WebAssembly\obj
xcopy %sourceDir%\*.* %targetDir% /E /R /Y

echo Sync success!
