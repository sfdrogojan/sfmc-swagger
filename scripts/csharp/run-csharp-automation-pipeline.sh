#!/bin/sh
set -e

SFMC_SWAGGER_ROOT_FOLDER=$1
SDK_REPOS_ROOT_FOLDER=$(dirname ${SFMC_SWAGGER_ROOT_FOLDER})
CSHARP_SDK_GIT_REPO_ID="sfmc-csharp-sdk"
GIT_USER_ID="sfdrogojan"

bash build-custom-csharp-generator.sh $SFMC_SWAGGER_ROOT_FOLDER

bash clone-csharp-sdk-git-repo.sh $SFMC_SWAGGER_ROOT_FOLDER $CSHARP_SDK_GIT_REPO_ID $GIT_USER_ID

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