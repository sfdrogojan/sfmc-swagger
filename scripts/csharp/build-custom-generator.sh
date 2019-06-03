#!/bin/sh

SFMC_SWAGGER_ROOT_FOLDER=$1

pushd ${SFMC_SWAGGER_ROOT_FOLDER}/generators/csharp

mvn clean package

popd

exit $?