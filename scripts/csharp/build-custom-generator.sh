#!/bin/sh

. ./setup-variables.sh

pushd ${SFMC_SWAGGER_ROOT_FOLDER}/generators/csharp

mvn clean package

popd

exit $?