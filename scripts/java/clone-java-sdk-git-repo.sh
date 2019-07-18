#!/bin/bash

source ../setup-variables.sh

JAVA_SDK_GIT_REPO_FOLDER="${SDK_REPOS_ROOT_FOLDER}/${JAVA_SDK_GIT_REPO_ID}"

    if [ -d $JAVA_SDK_GIT_REPO_FOLDER ]; then
        echo "${JAVA_SDK_GIT_REPO_ID} repo exists"
        pushd $JAVA_SDK_GIT_REPO_FOLDER
            git fetch
            git checkout $BRANCH_NAME
            git pull origin $BRANCH_NAME
        popd
    else
        echo "${JAVA_SDK_GIT_REPO_ID} repo does not exist"
        pushd $SDK_REPOS_ROOT_FOLDER
            git clone https://github.com/${GIT_USER_ID}/${JAVA_SDK_GIT_REPO_ID}
            cd $JAVA_SDK_GIT_REPO_ID
            git fetch
            git checkout $BRANCH_NAME
        popd
    fi

 exit $?