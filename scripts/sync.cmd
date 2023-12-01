@echo off
if "%1" == "" (
    echo Please provider SolutionDir like: "$(MSBuildThisFileDirectory)"
    exit /B
)

set sourceDir=%1..\src\net7
set targetDir=%1src

set expansionSourceDir=%1..\src\expansions
set expansionTargetDir=%1expansions\

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


rd /Q /S %expansionTargetDir%\BootstrapBlazorApp.OnlyServer .template.config
rd /Q /S %expansionTargetDir%\BootstrapBlazorApp.OnlyWasm .template.config

rd /Q /S %expansionSourceDir%\BootstrapBlazorApp.OnlyServer\bin
rd /Q /S %expansionSourceDir%\BootstrapBlazorApp.OnlyServer\obj
rd /Q /S %expansionSourceDir%\BootstrapBlazorApp.OnlyWasm\bin
rd /Q /S %expansionSourceDir%\BootstrapBlazorApp.OnlyWasm\obj


mkdir %targetDir%\BootstrapBlazorApp.Server
xcopy %sourceDir%\BootstrapBlazorApp.Server %targetDir%\BootstrapBlazorApp.Server /S /R /Y

mkdir %targetDir%\BootstrapBlazorApp.WebAssembly
xcopy %sourceDir%\BootstrapBlazorApp.WebAssembly %targetDir%\BootstrapBlazorApp.WebAssembly /S /R /Y

mkdir %targetDir%\BootstrapBlazorApp.Shared
xcopy %sourceDir%\BootstrapBlazorApp.Shared %targetDir%\BootstrapBlazorApp.Shared /S /R /Y

xcopy %sourceDir%\*.sln %targetDir% /Y

mkdir %expansionTargetDir%\BootstrapBlazorApp.OnlyServer
xcopy %expansionSourceDir%\BootstrapBlazorApp.OnlyServer %expansionTargetDir%\BootstrapBlazorApp.OnlyServer /S /R /Y

mkdir %expansionTargetDir%\BootstrapBlazorApp.OnlyWasm
xcopy %expansionSourceDir%\BootstrapBlazorApp.OnlyWasm %expansionTargetDir%\BootstrapBlazorApp.OnlyWasm /S /R /Y

echo Sync success!
