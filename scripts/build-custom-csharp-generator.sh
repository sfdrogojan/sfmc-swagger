#!/bin/sh

pushd ../generators/csharp

mvn clean package

popd

exit $?