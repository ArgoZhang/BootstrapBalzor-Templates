@echo off
if "%1" == "" (
    echo Please provider SolutionDir like: "$(MSBuildThisFileDirectory)"
    exit /B
)

set sourceDir=%1..\src
set targetDir=%1

echo "Ready to copy files to dist

rd /Q /S %targetDir%auto\BootstrapBlazorApp
rd /Q /S %targetDir%auto\BootstrapBlazorApp.Client
rd /Q /S %targetDir%server\BootstrapBlazorApp.Server
rd /Q /S %targetDir%webassembly\BootstrapBlazorApp.WebAssembly

rd /Q /S %sourceDir%\Auto\BootstrapBlazorApp\bin
rd /Q /S %sourceDir%\Auto\BootstrapBlazorApp\obj
rd /Q /S %sourceDir%\Auto\BootstrapBlazorApp.Client\bin
rd /Q /S %sourceDir%\Auto\BootstrapBlazorApp.Client\obj

rd /Q /S %sourceDir%\Server\BootstrapBlazorApp.Server\bin
rd /Q /S %sourceDir%\Server\BootstrapBlazorApp.Server\obj

rd /Q /S %sourceDir%\WebAssembly\BootstrapBlazorApp.WebAssembly\bin
rd /Q /S %sourceDir%\WebAssembly\BootstrapBlazorApp.WebAssembly\obj

xcopy %sourceDir%\Auto\*.* %targetDir%auto /S /R /Y
xcopy %sourceDir%\.editorconfig %targetDir%auto /Y

xcopy %sourceDir%\Server\*.* %targetDir%server /S /R /Y
xcopy %sourceDir%\.editorconfig %targetDir%server /Y

xcopy %sourceDir%\WebAssembly\*.* %targetDir%webassembly /S /R /Y
xcopy %sourceDir%\.editorconfig %targetDir%webassembly /Y

echo Sync success!
