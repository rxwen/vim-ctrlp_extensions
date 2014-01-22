# CtrlP listsource

CtrlP extension for listing source files for a project. It's useful to get
a clean list that only contains source files of a project

A vim command is created by this plugin:

* `CtrlPListSource` - list source files

## Prerequisites

1. [CtrlP][1] must be installed
2. Current directory should contains one of (The order matters, if a 
preceeding condition is satisfied, latters won't be checked):
- GTAGS (gnu global database file)
- tags file (ctags database file)
- .git


## Installation

1.  Use your favorite method (I prefer [Vundle][2])
2. (Optional) Create mapping

    ```
    nnoremap \fs :CtrlPListSource<CR>
    ```


[1]: https://github.com/kien/ctrlp.vim
[2]: https://github.com/gmarik/vundle
