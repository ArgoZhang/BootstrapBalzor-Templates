#!/bin/sh
# Permission denied
# chmod a+x sync.sh

if [ $1 = "" ]; then
    echo Please provider SolutionDir like: "$(MSBuildThisFileDirectory)"
    exit 1
fi

sourceDir=$1../src
targetDir=$1

expansionSourceDir=$1..\src\expansions
expansionTargetDir=$1expansions\

echo "Ready to copy files to dist"

echo copy $sourceDir $targetDir 

rm -rf $targetDir/auto/BootstrapBlazorApp
rm -rf $targetDir/auto/BootstrapBlazorApp.Client
rm -rf $targetDir/auto-per/BootstrapBlazorApp
rm -rf $targetDir/auto-per/BootstrapBlazorApp.Client
rm -rf $targetDir/server/BootstrapBlazorApp.Server
rm -rf $targetDir/webassembly/BootstrapBlazorApp.WebAssembly

rm -rf $sourceDir/Auto/BootstrapBlazorApp/bin
rm -rf $sourceDir/Auto/BootstrapBlazorApp/obj
rm -rf $sourceDir/Auto/BootstrapBlazorApp.Client/bin
rm -rf $sourceDir/Auto/BootstrapBlazorApp.Client/obj

rm -rf $sourceDir/Auto-Per/BootstrapBlazorApp/bin
rm -rf $sourceDir/Auto-Per/BootstrapBlazorApp/obj
rm -rf $sourceDir/Auto-Per/BootstrapBlazorApp.Client/bin
rm -rf $sourceDir/Auto-Per/BootstrapBlazorApp.Client/obj

rm -rf $sourceDir/Server/BootstrapBlazorApp.Server/bin
rm -rf $sourceDir/Server/BootstrapBlazorApp.Server/obj

rm -rf $sourceDir/WebAssembly/BootstrapBlazorApp.WebAssembly/bin
rm -rf $sourceDir/WebAssembly/BootstrapBlazorApp.WebAssembly/obj

\cp -r $sourceDir/Auto/BootstrapBlazorApp/ $targetDir/auto/BootstrapBlazorApp/
\cp -r $sourceDir/Auto/BootstrapBlazorApp.Client/ $targetDir/auto/BootstrapBlazorApp.Client/
\cp $sourceDir/.editorconfig $targetDir/auto/

\cp -r $sourceDir/Auto-Per/BootstrapBlazorApp/ $targetDir/auto-per/BootstrapBlazorApp/
\cp -r $sourceDir/Auto-Per/BootstrapBlazorApp.Client/ $targetDir/auto-per/BootstrapBlazorApp.Client/
\cp $sourceDir/.editorconfig $targetDir/auto-per/

\cp -r $sourceDir/Server/BootstrapBlazorApp.Server/ $targetDir/server/BootstrapBlazorApp.Server/
\cp $sourceDir/.editorconfig $targetDir/server/

\cp -r $sourceDir/WebAssembly/BootstrapBlazorApp.WebAssembly/ $targetDir/webassembly/BootstrapBlazorApp.WebAssembly/
\cp $sourceDir/.editorconfig $targetDir/webassembly/

echo Sync success!
