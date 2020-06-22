#!/bin/bash -e

echo "Copy binaries for later use"
sudo mkdir -p /floodgate/bin
sudo chmod 777 /floodgate/bin
cp /go/src/github.com/codilime/floodgate/floodgate /floodgate/bin/floodgate

