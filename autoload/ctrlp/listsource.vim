if exists('g:loaded_ctrlp_listsource') && g:loaded_ctrlp_listsource
  finish
endif

let g:loaded_ctrlp_listsource = 1

call add(g:ctrlp_ext_vars, {
      \ 'init': 'ctrlp#listsource#init()',
      \ 'accept': 'ctrlp#listsource#accept',
      \ 'lname': 'listsrc',
      \ 'sname': 'listsrc',
      \ 'type': 'line',
      \ 'enter': 'ctrlp#listsource#enter()',
      \ 'exit': 'ctrlp#listsource#exit()',
      \ 'opts': 'ctrlp#listsource#opts()',
      \ 'sort': 0,
      \ 'specinput': 0,
      \ })

" Give the extension an ID
let s:id = g:ctrlp_builtins + len(g:ctrlp_ext_vars)

" Allow it to be called later
function! ctrlp#listsource#id()
  return s:id
endfunction

" Provide a list of strings to search in
"
" Return: a Vim's List
"
function! ctrlp#listsource#init()
  "let l:output = system("cscope -L -7 filename")
  if file_readable("GTAGS")
    let l:output = system("global -P")
  elseif file_readable("cscope.files")
    let l:output = system("cat cscope.files")
  elseif isdirectory(".git")
    let l:output = system("git ls-files")
  endif
  return split(l:output, '\n')
endfunction

" The action to perform on the selected string
"
" Arguments:
"  a:mode   the mode that has been chosen by pressing <cr> <c-v> <c-t> or <c-x>
"           the values are 'e', 'v', 't' and 'h', respectively
"  a:str    the selected string
"
function! ctrlp#listsource#accept(mode, str)
  cal ctrlp#acceptfile(a:mode, a:str)
endfunction

" (optional) Do something before enterting ctrlp
function! ctrlp#listsource#enter()
endfunction

" (optional) Do something after exiting ctrlp
function! ctrlp#listsource#exit()
endfunction

" (optional) Set or check for user options specific to this extension
function! ctrlp#listsource#opts()
endfunction

function! ctrlp#listsource#exec()
  call ctrlp#init(ctrlp#listsource#id())
endfunction
