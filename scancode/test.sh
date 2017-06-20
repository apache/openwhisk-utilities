#!/usr/bin/env bash
set -x #echo on

SCRIPTDIR=$(cd $(dirname "$0") && pwd)

cd $HOMEDIR

# Test help
python $HOMEDIR/scanCode.py . -h

# Test basic usage
python ./scanCode.py . --config travis.cfg

# Test verbose usage
python ./scanCode.py . --config travis.cfg -v
