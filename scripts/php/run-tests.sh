#!/bin/bash

source ../setup-variables.sh

# bash ${PHP_SDK_GIT_REPO_FOLDER}/SalesForce/vendor/bin/phpunit -c ${PHP_SDK_GIT_REPO_FOLDER}/SalesForce/phpunit.xml --testsuite=php-sdk-api,php-sdk-auth
exit $?

popd