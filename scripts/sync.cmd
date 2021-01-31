@echo off
if "%1" == "" (
    echo Please provider SolutionDir like: "$(MSBuildThisFileDirectory)"
    exit /B
)

set sourceDir=%1..\src
set targetDir=%1src

echo "Ready to copy files to dist

rd /Q /S %targetDir%\BootstrapBlazorApp.Server
rd /Q /S %targetDir%\BootstrapBlazorApp.WebAssembly
rd /Q /S %targetDir%\BootstrapBlazorApp.Shared

rd /Q /S %sourceDir%\.vs
rd /Q /S %sourceDir%\BootstrapBlazorApp.Server\bin
rd /Q /S %sourceDir%\BootstrapBlazorApp.Server\obj
rd /Q /S %sourceDir%\BootstrapBlazorApp.WebAssembly\bin
rd /Q /S %sourceDir%\BootstrapBlazorApp.WebAssembly\obj
rd /Q /S %sourceDir%\BootstrapBlazorApp.Shared\bin
rd /Q /S %sourceDir%\BootstrapBlazorApp.Shared\obj

xcopy %sourceDir%\*.* %targetDir% /E /R /Y

echo Sync success!
