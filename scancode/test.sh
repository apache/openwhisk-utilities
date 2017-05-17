#!/usr/bin/env bash

# Test help
python ./scanCode.py . -h

# Test basic usage
python ./scanCode.py . --config travis.cfg

# Test verbose usage
python ./scanCode.py . --config travis.cfg -v
