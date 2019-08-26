#!/bin/bash

pushd ${PWD}

### Cloning the GitHub repository
git_clone ${PHP_SDK_GIT_REPO_ID}

# Checkout relevant branch (testing only)
pushd ${PHP_SDK_GIT_REPO_FOLDER}
    git checkout feature/client-validation
popd

### Generating the API client code
bash ./generate-api-client.sh

### Installing the dependencies
pushd ${PHP_SDK_GIT_REPO_FOLDER}/SalesForce
    php -f ${SFMC_SWAGGER_ROOT_FOLDER}/cli/composer.phar install
popd

### Running the unit tests
phpunit -c ${PHP_SDK_GIT_REPO_FOLDER}/SalesForce/phpunit.xml.dist --testsuite=php-sdk-api,php-sdk-auth

### Pushing the new branch to 
git_push ${PHP_SDK_GIT_REPO_ID}

### Creating the PR
create_pull_request ${PHP_SDK_GIT_REPO_ID}

exit $?