#!/bin/sh

if [ $1 = "" ]; then
    echo Please provider SolutionDir like: "$(MSBuildThisFileDirectory)"
    exit 1
fi

sourceDir=$1../template-ui/src
targetDir=$1

echo "Ready to copy files to dist"

echo copy $sourceDir $targetDir 

rm /fr %sourceDir%/.vs
rm /fr %sourceDir%/BootstrapBlazorApp.Server/bin
rm /fr %sourceDir%/BootstrapBlazorApp.Server/obj
rm /fr %sourceDir%/BootstrapBlazorApp.WebAssembly/bin
rm /fr %sourceDir%/BootstrapBlazorApp.WebAssembly/obj
\cp -rf $sourceDir $targetDir

echo Sync success!
