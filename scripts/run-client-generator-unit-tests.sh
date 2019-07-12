#!/bin/bash

source ./common-variables.sh

dotnet test ${SFMC_SWAGGER_ROOT_FOLDER}/generators/ClientGenerator/ClientGenerator.UnitTests/ClientGenerator.UnitTests.csproj \
    -c Release \
    --logger:console \
    --verbosity:minimal

exit $?