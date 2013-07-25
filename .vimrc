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

"ruby
autocmd FileType ruby,eruby set omnifunc=rubycomplete#Complete
autocmd FileType ruby,eruby let g:rubycomplete_buffer_loading = 1
autocmd FileType ruby,eruby let g:rubycomplete_rails = 1
autocmd FileType ruby,eruby let g:rubycomplete_classes_in_global = 1
"improve autocomplete menu color
highlight Pmenu ctermbg=238 gui=bold

" Saving and restoring sessions
function! SaveSession(session_name)
  let b:sessiondir = $HOME . "/.vim/sessions"
  if (filewritable(b:sessiondir) != 2)
    exe 'silent !mkdir -p ' b:sessiondir
    redraw!
  endif
  let b:filename = b:sessiondir . '/' . a:session_name . '.vim'
  exe "mksession! " . b:filename
endfunction

function! LoadSession(session_name)
  let b:sessiondir = $HOME . "/.vim/sessions"
  let b:sessionfile = b:sessiondir . '/' . a:session_name . '.vim'
  if (filereadable(b:sessionfile))
    exe 'source ' b:sessionfile
  else
    echo "No session loaded."
  endif
endfunction

let g:tagbar_type_javascript = {
    \ 'ctagstype' : 'JavaScript',
    \ 'kinds'     : [
        \ 'o:objects',
        \ 'f:functions',
        \ 'a:arrays',
        \ 's:strings'
    \ ]
\ }
