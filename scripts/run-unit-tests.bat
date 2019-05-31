:: Run Unit Tests

dotnet test ..\openapi-2.0\generated\src\Salesforce.MarketingCloud.UnitTests\Salesforce.MarketingCloud.UnitTests.csproj ^
    --logger:console ^
    --verbosity:minimal

if %errorlevel% neq 0 exit %errorlevel%