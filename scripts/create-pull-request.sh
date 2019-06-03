#!/bin/sh

ROOT_DIRECTORY=$(dirname $(dirname $(readlink -f "$0")))

if [ $OSTYPE = "msys" ]; then # Windows
    HUB_PATH="$ROOT_DIRECTORY/cli/hub-windows-amd64-2.11.2"
else
    HUB_PATH="$ROOT_DIRECTORY/cli/hub-linux-amd64-2.11.2"
fi

echo $HUB_PATH
export PATH=$HUB_PATH:$PATH

hub version

CSHARP_SDK_FOLDER=$1
pushd $CSHARP_SDK_FOLDER

git fetch
git checkout dev

hub pull-request -m "Automation pipeline update"

popd

exit $?