#!/bin/bash
# Licensed to the Apache Software Foundation (ASF) under one or more contributor
# license agreements; and to You under the Apache License, Version 2.0.

if [ $1 ]
then
    while read fn; do
        echo "update-fork:" $fn
        cd $fn
        git update-fork
        cd ..
    done < $1
else
    echo "ERROR: Argument not present: Repository Text listing (.txt)"
    exit 1
fi
