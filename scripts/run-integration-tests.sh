#!/bin/sh
# Run Integration Tests

CSHARP_SDK_FOLDER=$1

dotnet test $CSHARP_SDK_FOLDER/src/Salesforce.MarketingCloud.Test/Salesforce.MarketingCloud.Test.csproj \
    --logger:console

exit $?