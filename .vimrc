set nocompatible               " be iMproved


" *** End Vundle ***
filetype off                   " required!

set rtp+=~/.vim/bundle/vundle/
call vundle#rc()


syntax on

" let Vundle manage Vundle
" required! 
Bundle 'gmarik/vundle'
Bundle 'scrooloose/nerdtree'

" My Bundles here:
"
" original repos on github
Bundle 'tpope/vim-fugitive'
Bundle 'Lokaltog/vim-easymotion'
Bundle 'rstacruz/sparkup', {'rtp': 'vim/'}
Bundle 'tpope/vim-rails.git'
Bundle 'https://github.com/fholgado/minibufexpl.vim'
" vim-scripts repos
Bundle 'L9'
Bundle 'FuzzyFinder'
" non github repos
Bundle 'git://git.wincent.com/command-t.git'
" ...

filetype plugin indent on     " required!
"
" Brief help
" :BundleList          - list configured bundles
" :BundleInstall(!)    - install(update) bundles
" :BundleSearch(!) foo - search(or refresh cache first) for foo
" :BundleClean(!)      - confirm(or auto-approve) removal of unused bundles
"
" see :h vundle for more details or wiki for FAQ
" NOTE: comments after Bundle command are not allowed..
" *** End Vundle ***
set t_Co=256
colorscheme badwolf
filetype on
