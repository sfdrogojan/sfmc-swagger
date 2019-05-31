#!/bin/sh

# Change path to the root folder of the repo
cd $1

release_note="Automation pipeline script update"
branch_name="dev"
GIT_USER_ID="sfdrogojan"
GIT_REPO_ID="sfmc-csharp-sdk"

# Adds the files in the local repository and stages them for commit.
git add .

# Commits the tracked changes and prepares them to be pushed to a remote repository.
git commit -m "$release_note"

# Pushes the changes in the local repository up to the remote repository
echo "Git pushing to https://github.com/${GIT_USER_ID}/${GIT_REPO_ID}.git"
git push origin $branch_name 2>&1 | grep -v 'To https'

exit $?