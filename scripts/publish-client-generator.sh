#!/bin/bash

source ./common-variables.sh

CLIENT_GENERATOR_ROOT_FOLDER=${SFMC_SWAGGER_ROOT_FOLDER}/generators/ClientGenerator
CLI_ROOT_FOLDER=${SFMC_SWAGGER_ROOT_FOLDER}/cli
CLIENT_GENERATOR_WIN_X64_CLI_FOLDER=${CLI_ROOT_FOLDER}/client-generator-win-x64
CLIENT_GENERATOR_LINUX_X64_CLI_FOLDER=${CLI_ROOT_FOLDER}/client-generator-linux-x64

pushd ${CLIENT_GENERATOR_ROOT_FOLDER}/ClientGenerator &&

# publish for win-x64
dotnet publish -c Release -r win-x64 -f netcoreapp2.2 --self-contained false &&

mkdir -p  ${CLIENT_GENERATOR_WIN_X64_CLI_FOLDER} &&

cp -r \
    ${CLIENT_GENERATOR_ROOT_FOLDER}/ClientGenerator/bin/Release/netcoreapp2.2/win-x64/publish/. \
    ${CLIENT_GENERATOR_WIN_X64_CLI_FOLDER} &&

# publish for linux-x64
dotnet publish -c Release -r linux-x64 -f netcoreapp2.2 --self-contained false &&

mkdir -p  ${CLIENT_GENERATOR_LINUX_X64_CLI_FOLDER} &&

cp -r \
    ${CLIENT_GENERATOR_ROOT_FOLDER}/ClientGenerator/bin/Release/netcoreapp2.2/linux-x64/publish/. \
    ${CLIENT_GENERATOR_LINUX_X64_CLI_FOLDER} &&

popd

exit $?