#!/bin/bash

# BUILD_ARC=${1,,}

# echo "custom build completed $BUILD_ARC"


docker build -t $(basename $(pwd)):latest --force-rm=true --no-cache -f ./docker/Dockerfile.x86_64 ./docker