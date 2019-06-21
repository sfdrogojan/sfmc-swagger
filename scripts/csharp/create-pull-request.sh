#!/bin/bash

source ../setup-variables.sh

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

# create pull request
pushd $CSHARP_SDK_GIT_REPO_FOLDER

git fetch
git checkout $BRANCH_NAME

hub pull-request \
    -m "Automation pipeline update" \
    -m "PR created due to ${TRIGGERED_BY_PULL_REQUEST}" \
    -b ${DESTINATION_BRANCH_NAME}

popd

exit $?