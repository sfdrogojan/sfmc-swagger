#!/bin/bash

source ../setup-variables.sh
source ../common-functions.sh

clone_sdk_git_repo ${CSHARP_SDK_GIT_REPO_ID}

exit $?