if exists('g:loaded_ctrlp_searchhistory') && g:loaded_ctrlp_searchhistory
  finish
endif

let g:loaded_ctrlp_searchhistory = 1

call add(g:ctrlp_ext_vars, {
      \ 'init': 'ctrlp#searchhistory#init()',
      \ 'accept': 'ctrlp#searchhistory#accept',
      \ 'lname': 'searchhist',
      \ 'sname': 'searchhist',
      \ 'type': 'line',
      \ 'enter': 'ctrlp#searchhistory#enter()',
      \ 'exit': 'ctrlp#searchhistory#exit()',
      \ 'opts': 'ctrlp#searchhistory#opts()',
      \ 'sort': 0,
      \ 'specinput': 0,
      \ })

" Give the extension an ID
let s:id = g:ctrlp_builtins + len(g:ctrlp_ext_vars)

" Allow it to be called later
function! ctrlp#searchhistory#id()
  return s:id
endfunction

" Provide a list of strings to search in
"
" Return: a Vim's List
"
function! ctrlp#searchhistory#init()
  let type = 'search'
  let entries = map(range(histnr(type), 0, -1), 'histget(type, v:val)')
  let list = filter(entries, '!empty(v:val)')
  return list
endfunction

" The action to perform on the selected string
"
" Arguments:
"  a:mode   the mode that has been chosen by pressing <cr> <c-v> <c-t> or <c-x>
"           the values are 'e', 'v', 't' and 'h', respectively
"  a:str    the selected string
"
function! ctrlp#searchhistory#accept(mode, str)
  cal ctrlp#exit()
  " if mode is 'v', copy current selection to command prompt and wait for user
  " to confirm and execute
  if a:mode == 'v'
      call feedkeys('/'.a:str)
  else
      call feedkeys('/'.a:str."\<CR>")
  endif
endfunction

" (optional) Do something before enterting ctrlp
function! ctrlp#searchhistory#enter()
endfunction

" (optional) Do something after exiting ctrlp
function! ctrlp#searchhistory#exit()
endfunction

" (optional) Set or check for user options specific to this extension
function! ctrlp#searchhistory#opts()
endfunction

function! ctrlp#searchhistory#exec()
  call ctrlp#init(ctrlp#searchhistory#id())
endfunction
