#!/bin/bash

source ../setup-variables.sh

CLI_JAR="${SFMC_SWAGGER_ROOT_FOLDER}/cli/swagger-codegen-cli-2.4.4.jar"
ES6_NODE_TEMPLATES_PATH="${SFMC_SWAGGER_ROOT_FOLDER}/templates/node-es6"
CURRENT_YEAR=`date +'%Y'`

java -jar ${CLI_JAR} generate \
    -l javascript \
    -i ${SFMC_SWAGGER_ROOT_FOLDER}/openapi-2.0/sfmc-openapi-v2.json \
    -t ${ES6_NODE_TEMPLATES_PATH} \
    -o ${ES6_NODE_SDK_GIT_REPO_FOLDER} \
    -c ${SFMC_SWAGGER_ROOT_FOLDER}/openapi-2.0/swagger-codegen-config-node-es6.json

exit $?