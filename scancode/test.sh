#!/usr/bin/env bash
# Licensed to the Apache Software Foundation (ASF) under one or more contributor
# license agreements; and to You under the Apache License, Version 2.0.

# set -x #echo on

SCRIPTDIR=$(cd $(dirname "$0") && pwd)

cd $SCRIPTDIR

# Test help
python ./scanCode.py . -h

# Test basic usage
python ./scanCode.py . --config travis.cfg

# Test verbose usage
python ./scanCode.py . --config travis.cfg -v
