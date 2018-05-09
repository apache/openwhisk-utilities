<!--
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
-->

[![License](https://img.shields.io/badge/license-Apache--2.0-blue.svg)](http://www.apache.org/licenses/LICENSE-2.0)

## Test descriptions

The following test files exist in this directory to confirm that scanCode.py can detect an ASF License in various types of files which have varying comment syntax:

| Test file | Description |
| --- | --- |
| README.md | Detect ASF License in markdown (*.md) file. |
| good-apache-license.go | Detect ASF License in GoLang (*.go) file. |
| python/good-fuzzy-script.py | Detect License in Python (*.py) file.|
| good-apache-license.scala | Detect ASF License in Scala (*.scala) file. |
| good-hello.lua | Detect ASF License in Lua (*.lua) file. |
| good_hello.js | Detect ASF License in JavaScript (*.js) file. |
| good-bash.sh | Detect ASF License in Bash (*.sh) file. |

### Notes
- We also include the ASF License "badge" in this file to not only exhibit best practice for README markdown files, but also prove these statements can appear after the ASF License successfully.
