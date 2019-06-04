#!/bin/bash
set -e

source ./common-variables.sh

echo "SFMC_SWAGGER_ROOT_FOLDER=${SFMC_SWAGGER_ROOT_FOLDER}"
echo "SDK_REPOS_ROOT_FOLDER=${SDK_REPOS_ROOT_FOLDER}"

pushd ${SFMC_SWAGGER_ROOT_FOLDER}/scripts/csharp

bash ./run-csharp-automation-pipeline.sh

popd