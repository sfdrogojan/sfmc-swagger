#!/bin/sh

generatedFolder=$1

pushd "$generatedFolder/src/Salesforce.MarketingCloud"

dotnet pack Salesforce.MarketingCloud.csproj -p:NuspecFile=Salesforce.MarketingCloud.nuspec --configuration Release --output ../../../../build-artifacts

popd

exit $?