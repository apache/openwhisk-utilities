#!/usr/bin/env bash

SCRIPTDIR=$(cd $(dirname "$0") && pwd)

cd cd $HOMEDIR

# Test help
python ./scanCode.py . -h

# Test basic usage
python ./scanCode.py . --config travis.cfg

# Test verbose usage
python ./scanCode.py . --config travis.cfg -v
