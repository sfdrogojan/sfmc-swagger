#!/bin/bash

source ../setup-variables.sh

pushd "${CSHARP_SDK_GIT_REPO_FOLDER}/src/Salesforce.MarketingCloud"

dotnet pack Salesforce.MarketingCloud.csproj -p:NuspecFile=Salesforce.MarketingCloud.nuspec --configuration Release --output ${CSHARP_SDK_GIT_REPO_FOLDER}/build-artifacts

popd

exit $?