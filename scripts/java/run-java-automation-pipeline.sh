#!/bin/bash

# java pipeline steps

bash ./clone-java-sdk-git-repo.sh &&

bash ./generate-java-api-client.sh &&

# TODO
#bash ./generate-client-class.sh

bash ./run-tests.sh &&

bash ./git-push-java-sdk.sh &&

bash ./create-pull-request.sh

exit $?