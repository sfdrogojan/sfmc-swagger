#!/bin/bash
# Run Unit Tests

source ./setup-variables.sh

dotnet test ${CSHARP_SDK_GIT_REPO_FOLDER}/src/Salesforce.MarketingCloud.UnitTests/Salesforce.MarketingCloud.UnitTests.csproj \
    --logger:console \
    --verbosity:minimal

exit $?