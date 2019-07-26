#!/bin/bash

# csharp pipeline steps

bash ./clone-csharp-sdk-git-repo.sh &&

bash ./generate-csharp-api-client.sh &&

bash ./generate-client-class.sh &&

bash ./build-solution.sh &&

bash ./run-unit-tests.sh &&

bash ./run-integration-tests.sh &&

bash ./create-nuget-package.sh &&

bash ./git-push-csharp-sdk.sh &&

bash ./create-pull-request.sh

exit $?