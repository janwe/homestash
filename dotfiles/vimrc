set nocompatible                  " be iMproved, dont bother being compatible with vi
syntax on                         " highlight
set backspace=indent,eol,start    " intuitive backspacing in insert mode
set encoding=utf-8                " encoding
set autoindent                    " keep indent on newline
set smartindent                   " auto-indent (block/language)
set shiftround                    " round to whole indents
set expandtab                     " tabs are spaces
set showmatch                     " show matching chars (,{,..
set matchtime=3                   " blink matching chars for .x seconds
set matchpairs+=<:>               " add < > to matched pairs
set ignorecase                    " use smart case searching, only search for \
set smartcase                     " case sensitive words if search has capital
set incsearch                     " ...dynamically as they are typed.
set wrapscan                      " make search wrap
set hlsearch                      " highlight search-terms
set hlsearch!

filetype off                      " required for Vundle

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
" alternatively, pass a path where Vundle should install plugins
"call vundle#begin('~/some/path/here')

" let Vundle manage Vundle, required
Plugin 'VundleVim/Vundle.vim'

" The following are examples of different formats supported.
" Keep Plugin commands between vundle#begin/end.
" plugin on GitHub repo
Plugin 'tpope/vim-fugitive'

" All of your Plugins must be added before the following line
call vundle#end()            " required
filetype plugin indent on    " required
" To ignore plugin indent changes, instead use:
"filetype plugin on
"
" Brief help
" :PluginList       - lists configured plugins
" :PluginInstall    - installs plugins; append `!` to update or just :PluginUpdate
" :PluginSearch foo - searches for foo; append `!` to refresh local cache
" :PluginClean      - confirms removal of unused plugins; append `!` to auto-approve removal
"
" see :h vundle for more details or wiki for FAQ
" Put your non-Plugin stuff after this line