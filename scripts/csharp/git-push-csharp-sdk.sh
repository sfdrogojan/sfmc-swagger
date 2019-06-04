#!/bin/bash

source ./setup-variables.sh

# Change path to the root folder of the repo
pushd $CSHARP_SDK_GIT_REPO_FOLDER

RELEASE_NOTE="Automation pipeline script update"

GIT_REMOTE=`git remote | grep "origin-with-token"`
if [ "$GIT_REMOTE" = "" ]; then
    git remote add origin-with-token https://${GIT_USER_ID}:${GITHUB_TOKEN}@github.com/${GIT_USER_ID}/${GIT_REPO_ID}.git
fi

# Adds the files in the local repository and stages them for commit.
git add .

# Commits the tracked changes and prepares them to be pushed to a remote repository.
git commit -m "$RELEASE_NOTE"

git pull origin $BRANCH_NAME

# Pushes the changes in the local repository up to the remote repository
echo "Git pushing to https://github.com/${GIT_USER_ID}/${GIT_REPO_ID}.git"
git push origin-with-token $BRANCH_NAME 2>&1 | grep -v 'To https'

popd

exit $?