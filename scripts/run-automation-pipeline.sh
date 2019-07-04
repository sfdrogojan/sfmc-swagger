#!/bin/bash
set -e

source ./common-variables.sh

echo "SFMC_SWAGGER_ROOT_FOLDER=${SFMC_SWAGGER_ROOT_FOLDER}"
echo "SDK_REPOS_ROOT_FOLDER=${SDK_REPOS_ROOT_FOLDER}"

bash ./validate-openapi-spec.sh

bash ./build-client-generator.sh

bash ./run-client-generator-unit-tests.sh

bash ./run-client-generator-integration-tests.sh

bash ./publish-client-generator.sh

pushd ${SFMC_SWAGGER_ROOT_FOLDER}/scripts/csharp

bash ./run-csharp-automation-pipeline.sh

popd