#!/bin/bash
# Licensed to the Apache Software Foundation (ASF) under one or more contributor
# license agreements; and to You under the Apache License, Version 2.0.

if [ $1 ]
then
    while read fn; do
        cd incubator-openwhisk-utilities
        echo "scanning repo:" $fn
        scancode/scanCode.py --config scancode/ASF-Release.cfg ../$fn
        cd ..
    done < $1
else
    echo "ERROR: Argument not present: Repository Text listing (.txt)"
    exit 1
fi
