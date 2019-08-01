#!/bin/bash

source ../setup-variables.sh

CLI_JAR="${SFMC_SWAGGER_ROOT_FOLDER}/cli/swagger-codegen-cli-2.4.4.jar"
PHP_TEMPLATES_PATH="${SFMC_SWAGGER_ROOT_FOLDER}/templates/php"
CURRENT_YEAR=`date +'%Y'`

java -jar ${CLI_JAR} generate \
    -l dynamic-html \
    -i ${SFMC_SWAGGER_ROOT_FOLDER}/openapi-2.0/sfmc-openapi-v2.json \
    -o ${PHP_SDK_GIT_REPO_FOLDER}/static \
    -c ${SFMC_SWAGGER_ROOT_FOLDER}/openapi-2.0/swagger-codegen-config-php.json

exit $?