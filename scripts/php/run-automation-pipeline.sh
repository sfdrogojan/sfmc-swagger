#!/bin/bash

source ../setup-variables.sh
source ../common-functions.sh

# Preparing the environment
echo "deb http://archive.ubuntu.com/ubuntu/ bionic main" >> /etc/apt/sources.list
echo "deb http://archive.ubuntu.com/ubuntu/ bionic-updates main" >> /etc/apt/sources.list
echo "deb http://security.ubuntu.com/ubuntu bionic-security main" >> /etc/apt/sources.list

sudo apt-get update && sudo apt-get install -y php7
pip install --user requests

### Cloning the GitHub repository and checkout the release branch
git_clone ${PHP_SDK_GIT_REPO_ID}

### Generating the API client code
bash ./generate-api-client.sh

### Installing the dependencies
pushd ${PHP_SDK_GIT_REPO_FOLDER}/SalesForce
    php -f ${SFMC_SWAGGER_ROOT_FOLDER}/cli/composer.phar install
popd

### Running the unit tests
pushd ${PHP_SDK_GIT_REPO_FOLDER}
    phpunit -c ${PHP_SDK_GIT_REPO_FOLDER}/SalesForce/phpunit.xml.dist --testsuite=php-sdk-api,php-sdk-auth
popd

### Pushing the new branch to 
git_push ${PHP_SDK_GIT_REPO_ID}

### Creating the PR
python ../git_create_pr.py ${GITHUB_TOKEN} ${GIT_USER_ID} ${PHP_SDK_GIT_REPO_ID} ${PR_SOURCE_BRANCH} ${PR_TARGET_BRANCH}

exit 0