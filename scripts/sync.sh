#!/bin/sh
# Permission denied
# chmod a+x sync.sh

if [ $1 = "" ]; then
    echo Please provider SolutionDir like: "$(MSBuildThisFileDirectory)"
    exit 1
fi

sourceDir=$1../src
targetDir=$1

echo "Ready to copy files to dist"

echo copy $sourceDir $targetDir 

rm -rf $targetDir/src/BootstrapBlazorApp*
rm -rf $sourceDir/.vs
rm -rf $sourceDir/BootstrapBlazorApp.Server/bin
rm -rf $sourceDir/BootstrapBlazorApp.Server/obj
rm -rf $sourceDir/BootstrapBlazorApp.WebAssembly/bin
rm -rf $sourceDir/BootstrapBlazorApp.WebAssembly/obj
rm -rf $sourceDir/BootstrapBlazorApp.Shared/bin
rm -rf $sourceDir/BootstrapBlazorApp.Shared/obj
\cp -rf $sourceDir $targetDir

\cp $sourceDir/../src/*.sln $targetDir

echo Sync success!
