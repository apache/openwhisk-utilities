#!/usr/bin/env bash
# set -x #echo on

SCRIPTDIR=$(cd $(dirname "$0") && pwd)

cd $SCRIPTDIR

# Test help
python ./scanCode.py . -h

# Test basic usage
python ./scanCode.py . --config travis.cfg

# Test verbose usage
python ./scanCode.py . --config travis.cfg -v
