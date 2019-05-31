#!/bin/sh
# Run Integration Tests

generatedFolder=$1

dotnet test $generatedFolder/src/Salesforce.MarketingCloud.Test/Salesforce.MarketingCloud.Test.csproj \
    --logger:console

exit $?