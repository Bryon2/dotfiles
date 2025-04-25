""" .vimrc configuration file

" Set runtime path to include Vundle
set nocompatible
filetype off

" Initialize Vundle
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

" Plugins
Plugin 'VundleVim/Vundle.vim'
Plugin 'nanotech/jellybeans.vim'
Plugin 'nathanaelkane/vim-indent-guides'
Plugin 'tpope/vim-fugitive'
Plugin 'ycm-core/YouCompleteMe'

call vundle#end()
filetype plugin indent on

" Set colorscheme
colorscheme jellybeans

" Enable syntax highlighting
syntax on

" Set indentation
set tabstop=4
set shiftwidth=4
set expandtab
set autoindent

" Enable line numbers
set number

" Enable mouse support
set mouse=a

" Enable search highlighting
set hlsearch
set incsearch

" Enable status bar
set laststatus=2
