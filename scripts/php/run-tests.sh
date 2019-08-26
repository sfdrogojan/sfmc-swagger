#!/bin/bash

source ../setup-variables.sh

phpunit -c ${PHP_SDK_GIT_REPO_FOLDER}/SalesForce/phpunit.xml.dist --testsuite=php-sdk-api,php-sdk-auth