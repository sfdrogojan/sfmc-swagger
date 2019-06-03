#!/bin/sh
set -e

SFMC_SWAGGER_ROOT_FOLDER=$(dirname $(dirname $(readlink -f "$0")))
SDK_REPOS_ROOT_FOLDER=$(dirname ${SFMC_SWAGGER_ROOT_FOLDER})

echo "SFMC_SWAGGER_ROOT_FOLDER=${SFMC_SWAGGER_ROOT_FOLDER}"
echo "SDK_REPOS_ROOT_FOLDER=${SDK_REPOS_ROOT_FOLDER}"

bash ./csharp/run-csharp-automation-pipeline.sh $SFMC_SWAGGER_ROOT_FOLDER

# bash build-custom-csharp-generator.sh $SFMC_SWAGGER_ROOT_FOLDER

# bash clone-csharp-sdk-git-repo.sh 

# rootFolderForRepos=$(dirname $(dirname $(dirname $(readlink -f "$0"))))
# cSharpSdkRepoName="sfmc-csharp-sdk"
# cSharpSdkGitRepoFolder="$rootFolderForRepos/$cSharpSdkRepoName"

# bash generate-csharp-api-client.sh $cSharpSdkGitRepoFolder

# bash build-solution-core.sh $cSharpSdkGitRepoFolder

# bash run-unit-tests.sh $cSharpSdkGitRepoFolder

# bash run-integration-tests.sh $cSharpSdkGitRepoFolder

# bash create-nuget-package.sh $cSharpSdkGitRepoFolder

# bash git-push-csharp-sdk.sh $cSharpSdkGitRepoFolder

# bash create-pull-request.sh $cSharpSdkGitRepoFolder