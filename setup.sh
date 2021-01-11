#!/bin/bash

if [ "$1" = "" ]; then
    echo "Usage: bash setup.sh <github repo url>"
    exit 1
fi

cd ./compiled
git init
git remote add origin $1
git pull origin master
