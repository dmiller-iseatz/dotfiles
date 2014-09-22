set nocompatible              " be iMproved, required
filetype off                  " required

set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
"call vundle#begin('~/some/path/here')

" let Vundle manage Vundle, required
Plugin 'gmarik/Vundle.vim'
Plugin 'tpope/vim-fugitive'
Plugin 'scrooloose/nerdtree'
Plugin 'garyharan/vim-proto'
Plugin 'wincent/Command-T'

" All of your Plugins must be added before the following line
call vundle#end()            " required
filetype plugin indent on    " required
syntax on

augroup AutoReloadVimRC
  au!
  " automatically reload vimrc when it's saved
  au BufWritePost $MYVIMRC so $MYVIMRC
augroup END

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
