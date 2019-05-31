#!/bin/sh
rootFolderForRepos=$(dirname $(dirname $(dirname $(readlink -f "$0"))))
cSharpSdkRepoName="sfmc-csharp-sdk"
cSharpSdkGitRepoFolder="$rootFolderForRepos/$cSharpSdkRepoName"

    if [ -d $cSharpSdkGitRepoFolder ]; then
        echo "$cSharpSdkRepoName repo exists"
        cd $cSharpSdkGitRepoFolder
        git fetch
        git checkout dev
        git pull origin dev
    else
        echo "$cSharpSdkRepoName repo does not exist"
        cd $rootFolderForRepos
        git clone https://github.com/sfdrogojan/$cSharpSdkRepoName
        cd $cSharpSdkGitRepoFolder
        git fetch
        git checkout dev
    fi

    # return to initial directory
    cd $(dirname $(readlink -f "$0"))

 exit $?