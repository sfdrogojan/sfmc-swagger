#!/bin/bash

source "${BASH_SOURCE%/*}/common-variables.sh"

# Clones a GitHub repository
clone_sdk_git_repo()
{
    GIT_REPO_ID=$1
    GIT_REPO_FOLDER="${SDK_REPOS_ROOT_FOLDER}/${GIT_REPO_ID}"
    GIT_REPO_URL="https://${GIT_USER_ID}:${GITHUB_TOKEN}@github.com/${GIT_USER_ID}/${GIT_REPO_ID}.git"
    
    pushd $SDK_REPOS_ROOT_FOLDER
        # Clone the repository
        echo "Cloning from repository ${GIT_REPO_URL}"
        git clone $GIT_REPO_URL

        # Create new branch for the release
        pushd $SDK_GIT_REPO_ID
            git fetch

            # Making sure we have the lastest verion of the target branch
            git checkout $PR_TARGET_BRANCH
            git pull origin $PR_TARGET_BRANCH

            # Creating the release branch
            git checkout -B $PR_SOURCE_BRANCH 
        popd
    popd
    fi
}

# Push code to the repository
git_push() 
{
    GIT_REPO_ID=$1
    GIT_REPO_FOLDER="${SDK_REPOS_ROOT_FOLDER}/${GIT_REPO_ID}"
    GIT_REPO_URL="https://${GIT_USER_ID}:${GITHUB_TOKEN}@github.com/${GIT_USER_ID}/${GIT_REPO_ID}.git"

    # Change path to the root folder of the repo
    pushd $GIT_REPO_FOLDER
        
        # Debug
        echo "Working directory for PUSH action: ${PWD}"

        # Adds the files in the local repository and stages them for commit.
        git add .

        # Commits the tracked changes and prepares them to be pushed to a remote repository.
        git commit -m "SDK auto-update"

        # Pushes the changes in the local repository up to the remote repository
        echo "Pushing to repository ${GIT_REPO_URL}"
        git push origin $PR_SOURCE_BRANCH
    popd
}

# Create PR on the repository
create_pull_request()
{
    GIT_REPO_ID=$1
    GIT_REPO_FOLDER="${SDK_REPOS_ROOT_FOLDER}/${GIT_REPO_ID}"

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

    # Create pull request
    pushd ${GIT_REPO_FOLDER}

        CHECK_PR_ALREADY_OPEN_COMMAND=`hub pr list -f "%U" -b "${PR_TARGET_BRANCH}" -h "${PR_SOURCE_BRANCH}"`

        if [ "$CHECK_PR_ALREADY_OPEN_COMMAND" = "" ]; then
            echo "Creating PR from ${PR_SOURCE_BRANCH} to ${PR_TARGET_BRANCH}"

            hub pull-request \
                -m "Automation pipeline update" \
                -m "PR created due to ${TRIGGERED_BY_PULL_REQUEST}" \
                -b ${PR_TARGET_BRANCH}

            exit $?
        else
            echo "PR from ${PR_SOURCE_BRANCH} to ${PR_TARGET_BRANCH} already open"
        fi

    popd
}