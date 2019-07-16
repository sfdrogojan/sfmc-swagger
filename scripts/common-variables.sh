#!/bin/bash

# common variables used in automation pipeline scripts

SFMC_SWAGGER_ROOT_FOLDER=$(dirname $( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd ))
SDK_REPOS_ROOT_FOLDER=$(dirname ${SFMC_SWAGGER_ROOT_FOLDER})
CSHARP_SDK_GIT_REPO_ID="sfmc-csharp-sdk"
JAVA_SDK_GIT_REPO_ID="sfmc-java-sdk"
GIT_USER_ID="sfdrogojan"
BRANCH_NAME="demo"
DESTINATION_BRANCH_NAME="dev"
CSHARP_SDK_GIT_REPO_FOLDER="${SDK_REPOS_ROOT_FOLDER}/${CSHARP_SDK_GIT_REPO_ID}"
JAVA_SDK_GIT_REPO_FOLDER="${SDK_REPOS_ROOT_FOLDER}/${JAVA_SDK_GIT_REPO_ID}" 