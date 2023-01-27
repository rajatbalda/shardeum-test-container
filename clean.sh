#!/usr/bin/env bash

echo "Taking down stack..."
./down.sh

echo "Deleting existing image..."
docker rmi $(docker images | grep shardeum-test-image | awk {' print $3 '})

echo "Done."