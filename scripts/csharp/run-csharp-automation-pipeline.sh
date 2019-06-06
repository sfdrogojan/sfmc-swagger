#!/bin/bash

# csharp pipeline steps

bash ./build-custom-generator.sh

bash ./clone-csharp-sdk-git-repo.sh

bash ./generate-csharp-api-client.sh

bash ./build-solution.sh

bash ./run-unit-tests.sh

bash ./run-integration-tests.sh

bash ./create-nuget-package.sh

bash ./git-push-csharp-sdk.sh

bash ./create-pull-request.sh

exit $?