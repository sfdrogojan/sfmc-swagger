#!/bin/sh
ROOT_FOLDER_FOR_GIT_REPOS=$(dirname $(dirname $(dirname $(readlink -f "$0"))))
GITHUB_USER_ID="sfdrogojan"
CSHARP_SDK_GITHUB_REPO_ID="sfmc-csharp-sdk"
CSHARP_SDK_GIT_REPO_FOLDER="${ROOT_FOLDER_FOR_GIT_REPOS}/${CSHARP_SDK_GITHUB_REPO_ID}"

    if [ -d $CSHARP_SDK_GIT_REPO_FOLDER ]; then
        echo "${CSHARP_SDK_GITHUB_REPO_ID} repo exists"
        cd $CSHARP_SDK_GIT_REPO_FOLDER
        git fetch
        git checkout dev
        git pull origin dev
    else
        echo "${CSHARP_SDK_GITHUB_REPO_ID} repo does not exist"
        cd $ROOT_FOLDER_FOR_GIT_REPOS
        git clone https://github.com/${GITHUB_USER_ID}/${CSHARP_SDK_GITHUB_REPO_ID}
        cd $CSHARP_SDK_GIT_REPO_FOLDER
        git fetch
        git checkout dev
    fi

    # return to initial directory
    cd $(dirname $(readlink -f "$0"))

 exit $?