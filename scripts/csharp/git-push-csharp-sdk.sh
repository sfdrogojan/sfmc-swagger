#!/bin/bash

source ../setup-variables.sh
source ../common-functions.sh

git_push $CSHARP_SDK_GIT_REPO_FOLDER $CSHARP_SDK_GIT_REPO_ID

exit $?