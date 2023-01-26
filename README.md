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
[![Continuous Integration](https://github.com/apache/openwhisk-utilities/actions/workflows/ci.yaml/badge.svg)](https://github.com/apache/openwhisk-utilities/actions/workflows/ci.yaml)
[![Scan Code](https://github.com/apache/openwhisk-utilities/actions/workflows/scancode.yaml/badge.svg)](https://github.com/apache/openwhisk-utilities/actions/workflows/scancode.yaml)


# OpenWhisk Utilities

Shared utilities used across Apache OpenWhisk project repositories.

### Utility listing

The following utilities are included in this repository (by subdirectory):

- _**scancode**_ - Configurable code scanning utility that performs file and line-level checks on all files (exclusions permitted) on a provided path. It is intended for Git commit hooks and continuous integration (CI) builds to enforce certain coding conventions.


If you "push" code that follows all conventions, you will see the message:
```bash
Scanning files starting at [./mycodepath/]...
All checks passed.
```
However, if you push code containing tabs, trailing whitespace or missing Apache License headers, your build will fail immediately with one of the following messages:
```bash
Scan detected 3 error(s) in 1 file(s):
  [./mycodepath/sourcecode.go]:
       1: file does not include required license header.
      18: line contains tabs.
      27: line has trailing whitespaces.
```

To make sure this never happens to you, you can run the same tests on your local machine every time you commit changes.

1. Clone the OpenWhisk utilities project:
```bash
$ git clone https://github.com/apache/openwhisk-utilities.git
```

2. Run the scancode utility against the root directory of your project or subdirectory where your code changes live:
```bash
$ python3 ./openwhisk-utilities/scancode/scanCode.py $ROOTDIR
```

It is worth adding a Git [pre-commit hook](https://git-scm.com/book/en/v2/Customizing-Git-Git-Hooks) to automatically run the checks before you can even type in a Git commit message. Here is a sample `pre-commit` file:

```bash
$ cat /path/to/openwhisk/.git/hooks/pre-commit
#!/usr/bin/env bash

# -- Code scanning --
# See https://github.com/apache/openwhisk-utilities
# determine openwhisk base directory
root="$(git rev-parse --show-toplevel)"
scancode_path="/path/to/openwhisk-utilities/scancode"
python3 $scancode_path/scanCode.py --config $scancode_path/ASF-Release.cfg --gitignore $root/.gitignore $root
```

_Note_: A hook a locally installed, so if you check out the repository again, you will need to reinstall it.

Apache OpenWhisk repositories can be configured to run scancode as part of their CI process by invoking it
as a GitHub action.  It should be run immediately after the checkout action.  For example:
```yaml
      # Checkout just this repo and run scanCode before we do anything else
      - name: Checkout runtime repo
        uses: actions/checkout@v3
      - name: Scan Code
        uses: apache/openwhisk-utilities/scancode@master
```

### Issues

Report bugs, ask questions and request features [here on GitHub](https://github.com/apache/openwhisk-utilities/issues).

You can also join our Slack channel and chat with developers. To get access to our Slack channel, request an invite [here](http://slack.openwhisk.org).
