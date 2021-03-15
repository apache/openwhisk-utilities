#!/bin/bash
#
# Licensed to the Apache Software Foundation (ASF) under one or more
# contributor license agreements.  See the NOTICE file distributed with
# this work for additional information regarding copyright ownership.
# The ASF licenses this file to You under the Apache License, Version 2.0
# (the "License"); you may not use this file except in compliance with
# the License.  You may obtain a copy of the License at
#
#     http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.
#

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
            printf "ERROR: Did not add GitHub fork name for UPSTREAM. Did not add REMOTE\n"
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
