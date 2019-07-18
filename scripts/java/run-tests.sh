#!/bin/bash

source ../setup-variables.sh

pushd ${JAVA_SDK_GIT_REPO_FOLDER}

mvn test

popd

exit $?