#!/bin/sh
# Run Unit Tests

CSHARP_SDK_FOLDER=$1

dotnet test $CSHARP_SDK_FOLDER/src/Salesforce.MarketingCloud.UnitTests/Salesforce.MarketingCloud.UnitTests.csproj \
    --logger:console \
    --verbosity:minimal

exit $?