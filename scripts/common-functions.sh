#!/bin/bash

source "${BASH_SOURCE%/*}/common-variables.sh"

create_pull_request()
{
    # set hub in PATH
    if [ $OSTYPE = "msys" ]; then # Windows
        HUB_PATH="$SFMC_SWAGGER_ROOT_FOLDER/cli/hub-windows-amd64-2.11.2"
    else
        HUB_PATH="$SFMC_SWAGGER_ROOT_FOLDER/cli/hub-linux-amd64-2.11.2"
    fi

    echo $HUB_PATH
    export PATH=$HUB_PATH:$PATH

    hub version

    pushd ${SFMC_SWAGGER_ROOT_FOLDER}

        TRIGGERED_BY_PULL_REQUEST=`hub pr list -f "%U"`

    popd

    REPO_FOLDER=$1

    # create pull request
    pushd $REPO_FOLDER

        CHECK_PR_ALREADY_OPEN_COMMAND=`hub pr list -f "%U" -b "${DESTINATION_BRANCH_NAME}" -h "${BRANCH_NAME}"`

        if [ "$CHECK_PR_ALREADY_OPEN_COMMAND" = "" ]; then
            echo "Creating PR from ${BRANCH_NAME} to ${DESTINATION_BRANCH_NAME}"

            git fetch &&
            git checkout $BRANCH_NAME &&

            hub pull-request \
                -m "Automation pipeline update" \
                -m "PR created due to ${TRIGGERED_BY_PULL_REQUEST}" \
                -b ${DESTINATION_BRANCH_NAME}

            exit $?
        else
            echo "PR from ${BRANCH_NAME} to ${DESTINATION_BRANCH_NAME} already open"
        fi

    popd
}

git_push() 
{
    GIT_REPO_FOLDER=$1
    GIT_REPO_ID=$2

    # Change path to the root folder of the repo
    pushd $GIT_REPO_FOLDER

        echo "Working directory for PUSH action: ${PWD}"

        RELEASE_NOTE="Automation pipeline script update"

        # Adds the files in the local repository and stages them for commit.
        git add .

        # Commits the tracked changes and prepares them to be pushed to a remote repository.
        git commit -m "$RELEASE_NOTE"

        git pull origin $BRANCH_NAME

        # Pushes the changes in the local repository up to the remote repository
        echo "Git pushing to https://github.com/${GIT_USER_ID}/${GIT_REPO_ID}.git"
        git push origin $BRANCH_NAME
        exit $?
    popd
}

clone_sdk_git_repo()
{
    SDK_GIT_REPO_ID=$1
    SDK_GIT_REPO_FOLDER="${SDK_REPOS_ROOT_FOLDER}/${SDK_GIT_REPO_ID}"

    if [ -d $SDK_GIT_REPO_FOLDER ]; then
        echo "${SDK_GIT_REPO_ID} repo exists"
        pushd $SDK_GIT_REPO_FOLDER
            git fetch &&
            git checkout $BRANCH_NAME &&
            git pull origin $BRANCH_NAME &&
            # merge the destination branch into the source branch
            git pull origin $DESTINATION_BRANCH_NAME
        popd
    else
        echo "${SDK_GIT_REPO_ID} repo does not exist"
        pushd $SDK_REPOS_ROOT_FOLDER
            echo "Cloning from https://${GIT_USER_ID}:${GITHUB_TOKEN}@github.com/${GIT_USER_ID}/${SDK_GIT_REPO_ID}.git"

            git clone https://${GIT_USER_ID}:${GITHUB_TOKEN}@github.com/${GIT_USER_ID}/${SDK_GIT_REPO_ID}.git
            cd $SDK_GIT_REPO_ID
            git fetch
            git checkout $BRANCH_NAME
            git pull origin $DESTINATION_BRANCH_NAME
        popd
    fi
}