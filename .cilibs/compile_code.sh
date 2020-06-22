#!/bin/bash -e

GATE_VERSION=release-1.20.x
BUILD_OS=linux
BUILD_ARCH=amd64


while getopts "o:a:g" opt; do
  case ${opt} in
    o) #Build OS
      BUILD_OS=${OPTARG}
      ;;
    a) #Build arch
      BUILD_ARCH=${OPTARG}
      ;;
    g) #Gate version
      GATE_VERSION=${OPTARG}
      ;;
  esac
done

echo "Compile code"
if [ -z "$TRAVIS_BRANCH" ]
then
    export RELEASE=$(echo $CIRCLE_TAG | sed 's/^v[0-9]\+\.[0-9]\+\.[0-9]\+-\?//')
else
    export RELEASE=$CIRCLE_BRANCH
fi
env GOOS=${BUILD_OS} GOARCH=${BUILD_ARCH} go build -ldflags \
"-X github.com/codilime/floodgate/version.GitCommit=$TRAVIS_COMMIT \
-X github.com/codilime/floodgate/version.BuiltDate=$(date  +%Y-%m-%d_%H:%M:%S) \
-X github.com/codilime/floodgate/version.Release=$RELEASE \
-X github.com/codilime/floodgate/version.GoVersion=$GOLANG_VERSION \
-X github.com/codilime/floodgate/version.GateVersion=$(echo ${GATE_API_BRANCH} | sed 's/release-//') \
"
