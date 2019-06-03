#!/bin/sh

CSHARP_SDK_FOLDER=$1

pushd "$CSHARP_SDK_FOLDER/src/Salesforce.MarketingCloud"

dotnet pack Salesforce.MarketingCloud.csproj -p:NuspecFile=Salesforce.MarketingCloud.nuspec --configuration Release --output ../../../../build-artifacts

popd

exit $?