#!/bin/sh

generatedFolder=$1

pushd "$generatedFolder/src"

pushd "Salesforce.MarketingCloud"

dotnet restore
dotnet msbuild Salesforce.MarketingCloud.csproj -p:Configuration=Release

popd

pushd "Salesforce.MarketingCloud.Test"

dotnet restore
dotnet msbuild Salesforce.MarketingCloud.Test.csproj -p:Configuration=Release

popd

pushd "Salesforce.MarketingCloud.UnitTests"

dotnet restore
dotnet msbuild Salesforce.MarketingCloud.UnitTests.csproj -p:Configuration=Release

popd

popd

exit $?