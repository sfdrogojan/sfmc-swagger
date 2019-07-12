#!/bin/bash

source ./common-variables.sh

CLI_JAR="${SFMC_SWAGGER_ROOT_FOLDER}/cli/swagger-codegen-cli-2.4.4.jar"

java -jar ${CLI_JAR} validate \
    -i ${SFMC_SWAGGER_ROOT_FOLDER}/openapi-2.0/sfmc-openapi-v2.json

exit $?