if exists('g:loaded_ctrlp_cmdhistory') && g:loaded_ctrlp_cmdhistory
  finish
endif

let g:loaded_ctrlp_cmdhistory = 1

call add(g:ctrlp_ext_vars, {
      \ 'init': 'ctrlp#cmdhistory#init()',
      \ 'accept': 'ctrlp#cmdhistory#accept',
      \ 'lname': 'cmdhist',
      \ 'sname': 'cmdhist',
      \ 'type': 'line',
      \ 'enter': 'ctrlp#cmdhistory#enter()',
      \ 'exit': 'ctrlp#cmdhistory#exit()',
      \ 'opts': 'ctrlp#cmdhistory#opts()',
      \ 'sort': 0,
      \ 'specinput': 0,
      \ })

" Give the extension an ID
let s:id = g:ctrlp_builtins + len(g:ctrlp_ext_vars)

" Allow it to be called later
function! ctrlp#cmdhistory#id()
  return s:id
endfunction

" Provide a list of strings to search in
"
" Return: a Vim's List
"
function! ctrlp#cmdhistory#init()
  let type = 'cmd'
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
function! ctrlp#cmdhistory#accept(mode, str)
  cal ctrlp#exit()
  " if mode is 'v', copy current selection to command prompt and wait for user
  " to confirm and execute
  if a:mode == 'v'
      call feedkeys(':'.a:str)
  else
      execute ':'.a:str
  endif
endfunction

" (optional) Do something before enterting ctrlp
function! ctrlp#cmdhistory#enter()
endfunction

" (optional) Do something after exiting ctrlp
function! ctrlp#cmdhistory#exit()
endfunction

" (optional) Set or check for user options specific to this extension
function! ctrlp#cmdhistory#opts()
endfunction

function! ctrlp#cmdhistory#exec()
  call ctrlp#init(ctrlp#cmdhistory#id())
endfunction
