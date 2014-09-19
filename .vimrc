execute pathogen#infect()

syntax on
filetype plugin indent on

set number
set ruler

" Set the colorscheme
colorscheme slate

" Set tab widths
set expandtab
set tabstop=2
set softtabstop=2
set shiftwidth=2
set autoindent
set copyindent

set hlsearch
set incsearch

" NERDTree
map <C-n> :NERDTreeToggle<CR>

" TagBar
map <C-t> :TagbarToggle<CR>

" .proto syntax
augroup filetype
	au! BufRead,BufNewFile *.proto setfiletype proto
augroup end

" Stupid jruby slowness
let g:ruby_path='/usr/bin/ruby'

"ruby
autocmd FileType ruby,eruby set omnifunc=rubycomplete#Complete
autocmd FileType ruby,eruby let g:rubycomplete_buffer_loading = 1
autocmd FileType ruby,eruby let g:rubycomplete_rails = 1
autocmd FileType ruby,eruby let g:rubycomplete_classes_in_global = 1
"improve autocomplete menu color
highlight Pmenu ctermbg=238 gui=bold

" Saving and restoring sessions
function! DoSaveSession(session_name)
  let b:sessiondir = $HOME . "/.vim/sessions"
  if (filewritable(b:sessiondir) != 2)
    exe 'silent !mkdir -p ' b:sessiondir
    redraw!
  endif
  let b:filename = b:sessiondir . '/' . a:session_name . '.vim'
  exe "mksession! " . b:filename
endfunction
command! SaveSession call DoSaveSession()

function! DoLoadSession(session_name)
  let b:sessiondir = $HOME . "/.vim/sessions"
  let b:sessionfile = b:sessiondir . '/' . a:session_name . '.vim'
  if (filereadable(b:sessionfile))
    exe 'source ' b:sessionfile
  else
    echo "No session loaded."
  endif
endfunction
command! -nargs=1 LoadSession call DoLoadSession(<f-args>)

" Modification for taglist support for javascript
let g:tagbar_type_javascript = {
    \ 'ctagstype' : 'JavaScript',
    \ 'kinds'     : [
        \ 'c:constructors',
        \ 'f:functions',
        \ 'a:arrays',
        \ 'o:objects',
        \ 's:strings'
    \ ]
\ }

function! DoCleanXML()
  " save the filetype so we can restore it later
  let l:origft = &ft
  set ft=
  " delete the xml header if it exists. This will
  " permit us to surround the document with fake tags
  " without creating invalid xml.
  1s/<?xml .*?>//e
  " insert fake tags around the entire document.
  " This will permit us to pretty-format excerpts of
  " XML that may contain multiple top-level elements.
  0put ='<CleanXML>'
  $put ='</CleanXML>'
  silent %!xmllint --format --encode utf-8 -
  " xmllint will insert an <?xml?> header setting its
  " encoding type to utf-8
  " delete the fake tags
  2d
  $d
  " restore the normal indentation
  silent %<
  " back to home
  1
  " restore the filetype
  exe "set ft=" . l:origft
endfunction
command! CleanXML call DoCleanXML()

" Open vim-fugitive Ggrep output in a quickfix window
autocmd QuickFixCmdPost *grep* cwindow
