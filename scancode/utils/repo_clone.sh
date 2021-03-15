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

USAGE="repo_clone <repo. name> <ORIGIN> <UPSTREAM>"

if [ $1 ]
then
    : # $1 was given
    REPO=$1

    if [ $2 ]
    then
        :
        OWNER=$2
    else
        echo "ERROR: Did not add GitHub fork name for ORIGIN."
        echo $USAGE
        exit 2
    fi

    echo "REPO=[$1]"
    echo "OWNER=[$2]"

    echo "Info: Cloning: git@github.com:$OWNER/$REPO ..."
    git clone git@github.com:$OWNER/$REPO
    echo "Info: Remotes: git remote"
    git remote

    if [ $3 ]
    then
        cd $REPO
        echo "Info: Adding UPSTREAM remote: 'git remote add upstream git@github.com:$3/$REPO' ..."
        git remote add upstream git@github.com:$3/$REPO
        echo "Info: Fetching remotes: 'git fetch --all'  ..."
        git fetch --all
        echo "Info: Remotes: git remote"
        git remote
        cd ..
    else
        echo "INFO: Did not add GitHub fork name for UPSTREAM. Did not add REMOTE"
    fi
else
    echo "ERROR: Argument not present: GitHub Repository Name"
    echo $USAGE
    exit 1
fi
