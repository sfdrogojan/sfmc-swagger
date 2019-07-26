#!/bin/bash

source ./common-variables.sh

CLIENT_GENERATOR_ROOT_FOLDER=${SFMC_SWAGGER_ROOT_FOLDER}/generators/ClientGenerator

pushd ${CLIENT_GENERATOR_ROOT_FOLDER} &&

    pushd "ClientGenerator" &&

        dotnet restore &&
        dotnet msbuild ClientGenerator.csproj -p:Configuration=Release &&

    popd &&

    pushd "ClientGenerator.UnitTests" &&

        dotnet restore &&
        dotnet msbuild ClientGenerator.UnitTests.csproj -p:Configuration=Release &&

    popd &&

    pushd "ClientGenerator.IntegrationTests" &&

        dotnet restore &&
        dotnet msbuild ClientGenerator.IntegrationTests.csproj -p:Configuration=Release &&

    popd &&

popd

exit $?