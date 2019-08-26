#!/bin/bash

# common variables used in automation pipeline scripts

# swagger related
SFMC_SWAGGER_ROOT_FOLDER=$(dirname $( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd ))
SDK_REPOS_ROOT_FOLDER=$(dirname ${SFMC_SWAGGER_ROOT_FOLDER})

# SDK repos
CSHARP_SDK_GIT_REPO_ID="sfmc-csharp-sdk"
JAVA_SDK_GIT_REPO_ID="sfmc-java-sdk"
PHP_SDK_GIT_REPO_ID="sfmc-php-sdk"

# SDK folders
CSHARP_SDK_GIT_REPO_FOLDER="${SDK_REPOS_ROOT_FOLDER}/${CSHARP_SDK_GIT_REPO_ID}"
JAVA_SDK_GIT_REPO_FOLDER="${SDK_REPOS_ROOT_FOLDER}/${JAVA_SDK_GIT_REPO_ID}"
PHP_SDK_GIT_REPO_FOLDER="${SDK_REPOS_ROOT_FOLDER}/${PHP_SDK_GIT_REPO_ID}"

# Git vars
GIT_USER_ID="sfadincescu"
BRANCH_NAME="develop"
DESTINATION_BRANCH_NAME="master"