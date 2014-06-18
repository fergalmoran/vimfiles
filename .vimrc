set nocompatible 
filetype off   

set rtp+=~/.vim/bundle/vundle/
call vundle#rc()

"Auto reload .vimrc
autocmd! bufwritepost .vimrc source %

"De-insaneify copy & paste
set pastetoggle=<F2>
set clipboard=unnamed

set nobackup
set nowritebackup
set noswapfile

let mapleader=","

" easier indentation, retains selection
vnoremap < <gv 
vnoremap > >gv

"brace autocompletion
inoremap {      {}<Left>
inoremap {<CR>  {<CR>}<Esc>O
inoremap {{     {
inoremap {}     {}


"Sane window management
map <c-h> <c-w>h
map <c-j> <c-w>j
map <c-k> <c-w>k
map <c-l> <c-w>l

map <Leader>n <esc>:tabprevious<CR>
map <Leader>m <esc>:tabnext<CR>

"CTRL-N to open Nerd Tree
map <C-n> :NERDTreeToggle<CR>
let NERDTreeIgnore = ['\.pyc$']

"Close vim when NERDTree is the only window open
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTreeType") && b:NERDTreeType == "primary") | q | endif

vnoremap <Leader>s :sort<CR>

set incsearch
set smartcase

" let Vundle manage Vundle
" required! 
Bundle 'gmarik/vundle'
Bundle 'scrooloose/nerdtree'

" My Bundles here:
"
" original repos on github
Bundle 'scrooloose/syntastic'
Bundle 'tpope/vim-fugitive'
Bundle 'Lokaltog/vim-easymotion'
Bundle 'rstacruz/sparkup', {'rtp': 'vim/'}
Bundle 'tpope/vim-rails.git'
Bundle 'https://github.com/fholgado/minibufexpl.vim'
Bundle 'evanmiller/nginx-vim-syntax'
Bundle "wookiehangover/jshint.vim"
Bundle "bpowell/vim-android.git"

let g:JSHintHighlightErrorLine = 0

Bundle "pangloss/vim-javascript"

Bundle 'https://github.com/Lokaltog/powerline'
set rtp+=~/.vim/bundle/powerline/powerline/bindings/vim
set laststatus=2

Bundle 'https://github.com/kien/ctrlp.vim'
let g:ctrlp_max_height = 30
set wildignore+=*node_modules*
let g:ctrlp_custom_ignore = {
  \ 'dir':  '\v[\/]\.(git|hg|svn)$',
  \ 'file': '\v\.(exe|so|dll)$',
  \ 'link': 'some_bad_symbolic_links',
  \ }

set wildignore+=*.pyc
set wildignore+=*_build/*

let g:syntastic_always_populate_loc_list = 0                                    
let g:syntastic_auto_loc_list = 0 

" Sane Ignore For ctrlp
let g:ctrlp_custom_ignore = {
  \ 'dir':  '\.git$\|\.hg$\|\.svn$\|\.yardoc\|node_modules|public\/images\|public\/system\|data\|log\|tmp$',
  \ 'file': '\.exe$\|\.so$\|\.dat$'
  \ }
Bundle 'https://github.com/klen/python-mode.git'
map <Leader>g :call RopeGotoDefinition()<CR>
let ropevim_enable_shortcuts = 1
let g:pymode_rope_goto_def_newwin = "vnew"
let g:pymode_rope_extended_complete = 1
let g:pymode_breakout = 0
let g:pymode_syntax = 1
let g:pymode_syntax_builtin_objs = 0
let g:pymode_syntax_builtin_funcs = 0
map <Leader>b 0import ipdb; ipdb.set_trace() # BREAKPOINT<C-c>

set completeopt=longest,menuone
function! OmniPopup(action)
    if pumvisible()
        if a:action == 'j'
            return "\<C-N>"
        elseif a:action == 'k'
            return "\<C-P>"
        endif
    endif
    return a:action
endfunction
inoremap <silent><C-j> <C-R>=OmniPopup('j')<CR>
inoremap <silent><C-k> <C-R>=OmniPopup('k')<CR>

Bundle 'kchmck/vim-coffee-script'
au BufWritePost *.coffee silent make!

Bundle 'https://github.com/juvenn/mustache.vim'
Bundle 'https://github.com/wincent/Command-T.git'
Bundle 'https://github.com/godlygeek/tabular.git'
Bundle 'taglist.vim'

" vim-scripts repos
Bundle 'L9'
Bundle 'FuzzyFinder'
" non github repos
Bundle 'git://git.wincent.com/command-t.git'

" Setup 256 colors
if &term =~ "xterm"
  "256 color --
  let &t_Co=256
  " restore screen after quitting
  set t_ti=ESC7ESC[rESC[?47h t_te=ESC[?47lESC8
  if has("terminfo")
    let &t_Sf="\ESC[3%p1%dm"
    let &t_Sb="\ESC[4%p1%dm"
  else
    let &t_Sf="\ESC[3%dm"
    let &t_Sb="\ESC[4%dm"
  endif
endif


set t_Co=256

filetype on

set expandtab
set smarttab
set tabstop=4
set softtabstop=4
set shiftwidth=4

set foldcolumn=4
set foldenable
set foldlevel=2
set foldmethod=syntax " Markers are used to specify folds.
set foldminlines=0 " Allow folding single lines
set foldnestmax=3 " Set max fold nesting level
set formatoptions=
set formatoptions+=c " Format comments
set formatoptions+=r " Continue comments by default
set formatoptions+=o " Make comment when using o or O from comment line
set formatoptions+=q " Format comments with gq
set formatoptions+=n " Recognize numbered lists
set formatoptions+=2 " Use indent from 2nd line of a paragraph
set formatoptions+=l " Don't break lines that are already long
set formatoptions+=1 " Break before 1-letter words

colorscheme elflord

syntax enable
filetype plugin indent on   

