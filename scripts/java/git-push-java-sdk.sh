#!/bin/bash

source ../setup-variables.sh
source ../common-functions.sh

git_push $JAVA_SDK_GIT_REPO_FOLDER $JAVA_SDK_GIT_REPO_ID

exit $?