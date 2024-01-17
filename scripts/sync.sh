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

rm -rf $targetDir/auto/BootstrapBlazorApp*
rm -rf $targetDir/server/BootstrapBlazorApp*
rm -rf $targetDir/webassembly/BootstrapBlazorApp*

rm -rf $sourceDir/Auto/BootstrapBlazorApp/bin
rm -rf $sourceDir/Auto/BootstrapBlazorApp/obj
rm -rf $sourceDir/Auto/BootstrapBlazorApp.Client/bin
rm -rf $sourceDir/Auto/BootstrapBlazorApp.Client/obj

rm -rf $sourceDir/Server/BootstrapBlazorApp.Server/bin
rm -rf $sourceDir/Server/BootstrapBlazorApp.Server/obj

rm -rf $sourceDir/WebAssembly/BootstrapBlazorApp.WebAssembly/bin
rm -rf $sourceDir/WebAssembly/BootstrapBlazorApp.WebAssembly/obj

\cp -rf $sourceDir/Auto/*.* $targetDir/auto
\cp $sourceDir\.editorconfig $targetDir/auto

\cp -rf $sourceDir/Server/*.* $targetDir/server
\cp $sourceDir\.editorconfig $targetDir/server

\cp -rf $sourceDir/WebAssembly/*.* $targetDir/webassembly
\cp $sourceDir\.editorconfig $targetDir/webassembly

echo Sync success!
