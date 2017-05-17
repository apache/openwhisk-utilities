# codescan
_Simple configurable code scanner in Python._


## Usage

```
scanCode.py [-h] [-v] [--config CONFIG] root_directory
```

Scans all source code under specified directory for project compliance using
provided configuration.

### positional arguments:
 * root_directory   : starting directory for the scan

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

### [Excludes]

List of paths (inclusive of subdirectories) to exlude from code scanning.

### [Options]

List of additional key-value pair format options.

Currently, the following options are supported:

- LICENSE_SLACK_LENGTH (apples to check 'has_block_license')
  - Not all code files allow licenses to appear starting at the first character
    of the file. This option tells the scan to allow licenses to appear starting
    within first 'x' characters of each code file (as provided by this option's
    value).
