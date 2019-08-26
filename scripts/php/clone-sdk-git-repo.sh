#!/bin/bash

source ../setup-variables.sh
source ../common-functions.sh

clone_sdk_git_repo ${PHP_SDK_GIT_REPO_ID}


# Checkout relevant branch (testing only)
pushd ${PHP_SDK_GIT_REPO_FOLDER}

git checkout feature/client-validation

popd