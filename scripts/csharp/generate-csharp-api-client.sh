#!/bin/sh

source ./setup-variables.sh

CLI_JAR="${SFMC_SWAGGER_ROOT_FOLDER}/cli/swagger-codegen-cli-2.4.4.jar"
CUSTOM_GENERATOR_JAR="${SFMC_SWAGGER_ROOT_FOLDER}/generators/csharp/target/csharp-swagger-codegen-1.0.0.jar"
java -cp ${CUSTOM_GENERATOR_JAR}:${CLI_JAR} io.swagger.codegen.SwaggerCodegen generate -l csharp -i ${SFMC_SWAGGER_ROOT_FOLDER}/openapi-2.0/sfmc-openapi-v2.json -o ${CSHARP_SDK_GIT_REPO_FOLDER} -c ${SFMC_SWAGGER_ROOT_FOLDER}/openapi-2.0/swagger-codegen-config.json

exit $?