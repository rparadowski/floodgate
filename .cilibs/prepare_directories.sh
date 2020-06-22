#!/bin/bash -e

echo "Prepare directories"
mkdir /floodgate
chmod 777 /floodgate
mkdir -p /floodgate/bin
mkdir -p /floodgate/libs
mkdir -p /floodgate/resources
cp -r sponnet /floodgate/libs/
cp -r examples /floodgate/resources/
cp floodgate /floodgate/bin/
chmod +x /floodgate/bin/floodgate

