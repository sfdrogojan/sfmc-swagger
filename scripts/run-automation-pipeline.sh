#!/bin/sh
set -e

bash build-custom-csharp-generator.sh

bash clone-csharp-sdk-git-repo.sh

rootFolderForRepos=$(dirname $(dirname $(dirname $(readlink -f "$0"))))
cSharpSdkRepoName="sfmc-csharp-sdk"
cSharpSdkGitRepoFolder="$rootFolderForRepos/$cSharpSdkRepoName"

bash generate-csharp-api-client.sh $cSharpSdkGitRepoFolder

bash build-solution-core.sh $cSharpSdkGitRepoFolder

bash run-unit-tests.sh $cSharpSdkGitRepoFolder

bash run-integration-tests.sh $cSharpSdkGitRepoFolder

bash create-nuget-package.sh $cSharpSdkGitRepoFolder

bash git-push-csharp-sdk.sh $cSharpSdkGitRepoFolder

bash create-pull-request.sh $cSharpSdkGitRepoFolder