#!/bin/bash

# common variables used in automation pipeline scripts

SFMC_SWAGGER_ROOT_FOLDER=$(dirname $( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd ))
SDK_REPOS_ROOT_FOLDER=$(dirname ${SFMC_SWAGGER_ROOT_FOLDER})
CSHARP_SDK_GIT_REPO_ID="sfmc-csharp-sdk"
GIT_USER_ID="sfdrogojan"
BRANCH_NAME="demo"
DESTINATION_BRANCH_NAME="dev"
CSHARP_SDK_GIT_REPO_FOLDER="${SDK_REPOS_ROOT_FOLDER}/${CSHARP_SDK_GIT_REPO_ID}" 