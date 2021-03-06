#!/bin/bash

ASSIGNMENT=./assignments/$1
COMPILED=./compiled/$1

if [ ! -d $ASSIGNMENT ] || [ "$1" = "" ]; then
    echo "$ASSIGNMENT does not exist."
    exit 1
fi

rm -rf $COMPILED
mkdir -p $COMPILED

raco make $ASSIGNMENT/wheats/*.rkt
cp $ASSIGNMENT/wheats/compiled/* $COMPILED/
rm -rf $ASSIGNMENT/wheats/compiled

raco make $ASSIGNMENT/chaffs/*.rkt
cp $ASSIGNMENT/chaffs/compiled/* $COMPILED/
rm -rf $ASSIGNMENT/chaffs/compiled

racket summarize.rkt "$@"

cd ./compiled
git add $1
git commit -m "Update to '$1'."
git push origin master
