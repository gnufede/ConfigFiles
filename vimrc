"imap <C-F> <ESC>:r!~/.bin/google-contacts-lookup.sh <cword><CR><ESC>
syntax on
" size of a hard tabstop
set tabstop=2 "4 before

" size of an "indent"
set shiftwidth=2

" a combination of spaces and tabs are used to simulate tab stops at a width
" other than the (hard)tabstop
set softtabstop=2
" make "tab" insert indents instead of tabs at the beginning of a line
set smarttab

" always uses spaces instead of tab characters
set expandtab


set textwidth=79
"set autoindent

set nocompatible
set showmatch
set ruler
set incsearch
"filetype plugin indent on " load filetype plugins/indent settings
set autochdir " always switch to the current file directory 
set backspace=indent,eol,start " make backspace a more flexible


"let g:pydiction_location = '/usr/share/pydiction/complete-dict'
"autocmd FileType python set omnifunc=pythoncomplete#Complete
autocmd FileType python set autoindent
"highlight OverLength ctermbg=red ctermfg=darkred guibg=#FFD9D9
"match OverLength /\%81v.\+/

function! Smart_TabComplete()
  let line = getline('.')                         " curline
  let substr = strpart(line, -1, col('.')+1)      " from start to cursor
  let substr = matchstr(substr, "[^ \t]*$")       " word till cursor
  if (strlen(substr)==0)                          " nothing to match on empty string
    return "\<tab>"
  endif
  let has_period = match(substr, '\.') != -1      " position of period, if any
  let has_slash = match(substr, '\/') != -1       " position of slash, if any
  if (!has_period && !has_slash)
    return "\<C-X>\<C-P>"                         " existing text matching
  elseif ( has_slash )
    return "\<C-X>\<C-F>"                         " file matching
  else
    return "\<C-X>\<C-O>"                         " plugin matching
  endif
endfunction 

inoremap <tab> <c-r>=Smart_TabComplete()<CR>

autocmd FileType python set omnifunc=pythoncomplete#Complete
autocmd FileType javascript set omnifunc=javascriptcomplete#CompleteJS
autocmd FileType html set omnifunc=htmlcomplete#CompleteTags
autocmd FileType css set omnifunc=csscomplete#CompleteCSS
autocmd FileType xml set omnifunc=xmlcomplete#CompleteTags
autocmd FileType php set omnifunc=phpcomplete#CompletPHP
autocmd FileType c set omnifunc=ccomplete#Complete

set background=light
colorscheme solarized
