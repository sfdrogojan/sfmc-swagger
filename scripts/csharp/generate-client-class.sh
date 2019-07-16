#!/bin/bash

source ../setup-variables.sh

CLI_ROOT_FOLDER=${SFMC_SWAGGER_ROOT_FOLDER}/cli

CLIENT_GENERATOR_WIN_X64_CLI_FOLDER=${CLI_ROOT_FOLDER}/client-generator-win-x64
CLIENT_GENERATOR_LINUX_X64_CLI_FOLDER=${CLI_ROOT_FOLDER}/client-generator-linux-x64
CSHARP_SDK_API_FOLDER=${CSHARP_SDK_GIT_REPO_FOLDER}/src/Salesforce.MarketingCloud/Api

if [ $OSTYPE = "msys" ]; then # Windows
    pushd ${CLIENT_GENERATOR_WIN_X64_CLI_FOLDER}
        ./client-generator.exe generate -l csharp -i ${CSHARP_SDK_API_FOLDER}
    popd
else
    pushd ${CLIENT_GENERATOR_LINUX_X64_CLI_FOLDER}
        dotnet client-generator.dll generate -l csharp -i ${CSHARP_SDK_API_FOLDER}
    popd
fi

exit $?