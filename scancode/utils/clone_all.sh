#!/bin/bash
# Licensed to the Apache Software Foundation (ASF) under one or more contributor
# license agreements; and to You under the Apache License, Version 2.0.

USAGE=$"USAGE: clone_all <repo-list.txt> <ORIGIN> <UPSTREAM>\n"

if [ $1 ]
then
    if [ $2 ]
    then
        if [ $3 ]
        then
            while read fn; do
                printf "cloning:" $fn
                source ./repo_clone.sh $fn $2 $3
            done < $1
        else
            printf "ERROR: Did not add Github fork name for UPSTREAM. Did not add REMOTE\n"
            printf "$USAGE"
            exit 3
        fi
    else
        printf "ERROR: Argument not present: GitHub Organization Name\n"
        printf "$USAGE"
        exit 2
    fi
else
    echo "ERROR: Argument not present: Repository Text listing (.txt)\n"
    printf "$USAGE"
    exit 1
fi
