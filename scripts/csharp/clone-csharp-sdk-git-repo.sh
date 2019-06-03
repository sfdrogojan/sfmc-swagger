#!/bin/sh
SDK_REPOS_ROOT_FOLDER=$1
CSHARP_SDK_GIT_REPO_ID=$2
GIT_USER_ID=$3

CSHARP_SDK_GIT_REPO_FOLDER="${SDK_REPOS_ROOT_FOLDER}/${CSHARP_SDK_GIT_REPO_ID}"

    if [ -d $CSHARP_SDK_GIT_REPO_FOLDER ]; then
        echo "${CSHARP_SDK_GIT_REPO_ID} repo exists"
        pushd $CSHARP_SDK_GIT_REPO_FOLDER
            git fetch
            git checkout dev
            git pull origin dev
        popd
    else
        echo "${CSHARP_SDK_GIT_REPO_ID} repo does not exist"
        pushd $SDK_REPOS_ROOT_FOLDER
            git clone https://github.com/${GIT_USER_ID}/${CSHARP_SDK_GIT_REPO_ID}
            cd $CSHARP_SDK_GIT_REPO_ID
            git fetch
            git checkout dev
        popd
    fi

 exit $?