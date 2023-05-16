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

rm -rf $targetDir/src/BootstrapBlazorApp*
rm -rf $sourceDir/.vs
rm -rf $sourceDir/BootstrapBlazorApp.Server/bin
rm -rf $sourceDir/BootstrapBlazorApp.Server/obj
rm -rf $sourceDir/BootstrapBlazorApp.WebAssembly/bin
rm -rf $sourceDir/BootstrapBlazorApp.WebAssembly/obj
rm -rf $sourceDir/BootstrapBlazorApp.Shared/bin
rm -rf $sourceDir/BootstrapBlazorApp.Shared/obj

find $expansionTargetDir/expansions/BootstrapBlazorApp.OnlyServer -not -path $expansionTargetDir/expansions/BootstrapBlazorApp.OnlyServer/.template.config* -delete
rm -rf $expansionSourceDir/BootstrapBlazorApp.OnlyServer/bin
rm -rf $expansionSourceDir/BootstrapBlazorApp.OnlyServer/obj
find $expansionTargetDir/expansions/BootstrapBlazorApp.OnlyWasm -not -path $expansionTargetDir/expansions/BootstrapBlazorApp.OnlyWasm/.template.config* -delete
rm -rf $expansionSourceDir/BootstrapBlazorApp.OnlyWasm/bin
rm -rf $expansionSourceDir/BootstrapBlazorApp.OnlyWasm/obj

\cp -rf $sourceDir $targetDir

\cp $sourceDir/../src/*.sln $targetDir

\cp -rf $expansionSourceDir $expansionTargetDir

echo Sync success!
