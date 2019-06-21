#!/bin/bash

source ../setup-variables.sh

CLI_JAR="${SFMC_SWAGGER_ROOT_FOLDER}/cli/swagger-codegen-cli-2.4.4.jar"
JAVA_TEMPLATES_PATH="${SFMC_SWAGGER_ROOT_FOLDER}/templates/Java"
CURRENT_YEAR=`date +'%Y'`

java -jar ${CLI_JAR} generate \
    -l java \
    -i ${SFMC_SWAGGER_ROOT_FOLDER}/openapi-2.0/sfmc-openapi-v2.json \
    -t ${JAVA_TEMPLATES_PATH} \
    -o ${JAVA_SDK_GIT_REPO_FOLDER} \
    -c ${SFMC_SWAGGER_ROOT_FOLDER}/openapi-2.0/swagger-codegen-config-java.json \
    # -DmodelTests=false \
    # --additional-properties packageTitle="Salesforce Marketing Cloud C# SDK" \
    # --additional-properties packageCompany="Salesforce" \
    # --additional-properties packageProductName="Salesforce Marketing Cloud C# SDK" \
    # --additional-properties packageDescription="The Salesforce Marketing Cloud C# SDK" \
    # --additional-properties packageAuthors="Salesforce" \
    # --additional-properties packageCopyright="Copyright © Salesforce ${CURRENT_YEAR}" \

exit $?