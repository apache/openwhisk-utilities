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

# codescan
_Simple configurable code scanner in Python._

## Usage

```
scanCode.py [-h] [-v] [--config CONFIG] root_directory
```

Scans all source code under specified directory for project compliance using
provided configuration.

### positional arguments:
 * root_directory   : the starting directory for the scan

### optional arguments:
 * -h, --help       : show this help message and exit
 * -v, --verbose    : enable verbose output
 * --config CONFIG  : provide custom configuration file

 # Configuration file format

 ## Supported sections

 ### [Licenses]

List of filenames containing the text of valid license (headers).
These files SHOULD be in the same directory path where scanCode.py
resides.

### [Includes]

Filters (path/filename) with wildcards and associated scan checks
that are to be run against them.  The checks are actual valid
function names found in scanCode.py.

These include:
- has_block_license
- no_tabs
- no_trailing_spaces
- eol_at_eof
- check_regex

### [Excludes]

List of paths (inclusive of subdirectories) to exclude from code scanning.

### [Regex]

List of regular expressions for forbidden strings, e.g. \w+@company.com

### [Options]

List of additional key-value pair format options.

Currently, the following options are supported:

- LICENSE_SLACK_LENGTH (apples to check 'has_block_license')
  - Not all code files allow licenses to appear starting at the first character
    of the file. This option tells the scan to allow licenses to appear starting
    within first 'x' characters of each code file (as provided by this option's
    value).
