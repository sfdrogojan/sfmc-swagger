#!/bin/sh
# Run Unit Tests

generatedFolder=$1

dotnet test $generatedFolder/src/Salesforce.MarketingCloud.UnitTests/Salesforce.MarketingCloud.UnitTests.csproj \
    --logger:console \
    --verbosity:minimal

exit $?