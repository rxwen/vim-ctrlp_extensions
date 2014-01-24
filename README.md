# CtrlP Extensions

A collections of CtrlP exensions

* listsource: for listing source files for a project. It's useful to get
a clean list that only contains source files of a project
* cmdhistory: for quick access to vim command history

Below vim commands are created by this plugin:

* `CtrlPListSource` - list source files
* `CtrlPCmdHistory` - list recent vim commands

## Prerequisites

1. [CtrlP][1] must be installed
2. Current directory should contains one of (The order matters, if a 
preceeding condition is satisfied, latters won't be checked):

- GTAGS (gnu global database file)
- .git
- cscope.files (a text file contains all source files)


## Installation

1.  Use your favorite method (I prefer [Vundle][2])
2. (Optional) Create mapping

    ```
    nnoremap \fs :CtrlPListSource<CR>
    nnoremap \fh :CtrlPCmdHistory<CR>
    ```


[1]: https://github.com/kien/ctrlp.vim
[2]: https://github.com/gmarik/vundle
