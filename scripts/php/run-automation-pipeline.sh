#!/bin/bash

bash ./clone-sdk-git-repo.sh

bash ./generate-api-client.sh

bash ./install-deps.sh

bash ./run-tests.sh

bash ./git-push-sdk.sh

bash ./create-pull-request.sh

exit $?