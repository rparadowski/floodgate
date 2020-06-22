#!/bin/bash -e

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


echo "Prepare directories"
sudo mkdir /floodgate
sudo chmod 777 /floodgate
mkdir -p /floodgate/bin
mkdir -p /floodgate/libs
mkdir -p /floodgate/resources
cp -r sponnet /floodgate/libs/
cp -r examples /floodgate/resources/
cp floodgate-$GATE_API_BRANCH.$BUILD_OS.$BUILD_ARCH /floodgate/bin/
chmod +x /floodgate/bin/floodgate

