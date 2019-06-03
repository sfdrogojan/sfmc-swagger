#!/bin/sh

# Change path to the root folder of the repo
pushd $1

release_note="Automation pipeline script update"
branch_name="dev"
GIT_USER_ID="sfdrogojan"
GIT_REPO_ID="sfmc-csharp-sdk"

git remote add origin-with-token https://${GIT_USER_ID}:${GITHUB_TOKEN}@github.com/${GIT_USER_ID}/${GIT_REPO_ID}.git

# Adds the files in the local repository and stages them for commit.
git add .

# Commits the tracked changes and prepares them to be pushed to a remote repository.
git commit -m "$release_note"

git pull origin $branch_name

# Pushes the changes in the local repository up to the remote repository
echo "Git pushing to https://github.com/${GIT_USER_ID}/${GIT_REPO_ID}.git"
git push origin-with-token $branch_name 2>&1 | grep -v 'To https'

popd

exit $?