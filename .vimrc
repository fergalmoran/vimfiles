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

"remove whitespace
nnoremap <silent> <F5> :let _s=@/ <Bar> :%s/\s\+$//e <Bar> :let @/=_s <Bar> :nohl <Bar> :unlet _s <CR>

"Sane window management
map <c-h> <c-w>h
map <c-j> <c-w>j
map <c-k> <c-w>k
map <c-l> <c-w>l

nnoremap <Tab> :bnext<CR>
nnoremap <S-Tab> :bprevious<CR>
noremap <F3> :Autoformat<CR><CR>

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
Plugin 'Chiel92/vim-autoformat'
Plugin 'gmarik/vundle'
Plugin 'scrooloose/nerdtree'
Plugin 'scrooloose/syntastic'
Plugin 'leafgarland/typescript-vim'
Plugin 'SirVer/ultisnips'
Plugin 'evanmiller/nginx-vim-syntax'
" My Plugins here:
"
" original repos on github
Plugin 'tpope/vim-dispatch'
Plugin 'airblade/vim-gutter'
Plugin 'Xuyuanp/nerdtree-git-plugin'
" Plugin 'fholgado/minibufexpl.vim'
Plugin 'Valloric/YouCompleteMe'
Plugin 'marijnh/tern_for_vim'
Plugin 'kien/ctrlp.vim'
Plugin 'klen/python-mode'
Plugin 'godlygeek/tabulart'
Plugin 'taglist.vim'
Plugin 'mattn/emmet-vim'

Plugin 'Yggdroot/indentline'
Plugin 'vim-airline/vim-airline'
Plugin 'vim-airline/vim-airline-themes'
Plugin 'ntpeters/vim-better-whitespace'
Plugin 'ap/vim-buftabline'
Plugin 'elzr/vim-json'
Plugin 'OmniSharp/omnisharp-vim'
Plugin 'OrangeT/vim-csharp'
Plugin 'morhetz/gruvbox'
Plugin 'ryanoasis/vim-devicons'

let g:JSHintHighlightErrorLine = 0
let g:miniBufExplForceSyntaxEnable = 1

let g:airline#extensions#tabline#enabled = 1

" These are the tweaks I apply to YCM's config, you don't need them but they
" might help.
" " YCM gives you popups and splits by default that some people might not
" like, so these should tidy it up a bit for you.
let g:ycm_add_preview_to_completeopt=0
let g:ycm_confirm_extra_conf=0
" Map CTRL-C to split line
imap <C-c> <CR><Esc>O

set laststatus=2

let g:ctrlp_max_height = 30
set wildignore+=*node_modules*
let g:ctrlp_custom_ignore = {
  \ 'dir':  '\v[\/]\.(git|hg|svn)$',
  \ 'file': '\v\.(exe|so|dll)$',
  \ 'link': 'some_bad_symbolic_links',
  \ }

set wildignore+=*.pyc
set wildignore+=*_build/*

" Sane Ignore For ctrlp
let g:ctrlp_custom_ignore = {
  \ 'dir':  '\.git$\|\.hg$\|\.svn$\|\.yardoc\|node_modules|public\/images\|public\/system\|data\|log\|tmp$',
  \ 'file': '\.exe$\|\.so$\|\.dat$'
  \ }
map <Leader>g :call RopeGotoDefinition()<CR>

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

let g:OmniSharp_server_type = 'roslyn'

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

syntax on
set background=dark

syntax enable
filetype plugin indent on

"Added by android-vim:
set tags+=/home/fergalm/.vim/tags
autocmd Filetype java setlocal omnifunc=javacomplete#Complete
let g:SuperTabDefaultCompletionType = 'context'

colorscheme gruvbox
