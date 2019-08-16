#!/bin/bash

source ../setup-variables.sh
source ../common-functions.sh

cd ${PHP_SDK_GIT_REPO_FOLDER}/SalesForce && php -f ${SFMC_SWAGGER_ROOT_FOLDER}/cli/composer.phar install