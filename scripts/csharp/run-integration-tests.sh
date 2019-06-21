#!/bin/bash
# Run Integration Tests

source ../setup-variables.sh

dotnet test ${CSHARP_SDK_GIT_REPO_FOLDER}/src/Salesforce.MarketingCloud.Test/Salesforce.MarketingCloud.Test.csproj \
    --logger:console \
    --verbosity:minimal

exit $?