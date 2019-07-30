set nocompatible
filetype off
set encoding=UTF8

set rtp+=~/.vim/bundle/vundle/
call vundle#rc()

"Who the fuck wants to load a tar file in vim???
let g:loaded_tarPlugin = 1

let s:uname = system("echo -n \"$(uname)\"")

"Auto reload .vimrc
autocmd! bufwritepost .vimrc source %

autocmd FileType nerdtree setlocal nolist

let g:python_host_prog = '/home/fergalm/.virtualenvs/nvim2/bin/python'
let g:python3_host_prog = '/home/fergalm/.virtualenvs/nvim3/bin/python'

"LEARN THE FUCKING VIM FERG
"noremap <Up> <NOP>
"noremap <Down> <NOP>
"noremap <Left> <NOP>
"noremap <Right> <NOP>

"De-insaneify copy & paste
set pastetoggle=<F2>
if $TMUX == ''
    set clipboard+=unnamed
endif

set nobackup
set nowritebackup
set noswapfile
set mouse=a

set colorcolumn=121


" stop hiding fucking quotes
let g:vim_json_syntax_conceal = 0

let mapleader=","
" unhighlight search on pressing return
nnoremap <CR> :noh<CR><CR>

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
noremap <C-c> :Bclose<CR>

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
Plugin 'scrooloose/nerdcommenter'
Plugin 'tiagofumo/vim-nerdtree-syntax-highlight'
Plugin 'w0rp/ale'
Plugin 'Shougo/vimproc.vim'
Plugin 'craigemery/vim-autotag'
Plugin 'leafgarland/typescript-vim'
Plugin 'SirVer/ultisnips'
Plugin 'chr4/nginx.vim'
Plugin 'zxqfl/tabnine-vim'

Plugin 'tpope/vim-dispatch'
Plugin 'Xuyuanp/nerdtree-git-plugin'

Plugin 'ctrlpvim/ctrlp.vim'
Plugin 'klen/python-mode'
Plugin 'taglist.vim'
Plugin 'mattn/emmet-vim'

Plugin 'Yggdroot/indentline'
Plugin 'vim-airline/vim-airline'
Plugin 'vim-airline/vim-airline-themes'
Plugin 'ntpeters/vim-better-whitespace'
Plugin 'ap/vim-buftabline'
Plugin 'elzr/vim-json'
Plugin 'morhetz/gruvbox'
Plugin 'dracula/vim'

if system("uname -m") != "armv7l\n"
    Plugin 'Shougo/vimproc'
    Plugin 'Quramy/tsuquyomi'
    " Plugin 'Valloric/YouCompleteMe'
    Plugin 'marijnh/tern_for_vim'
    Plugin 'OmniSharp/omnisharp-vim'
    Plugin 'OrangeT/vim-csharp'
endif 
Plugin 'ryanoasis/vim-devicons'
" step 2: font configuration
" " These are the basic settings to get the font to work (required):
" set guifont=Droid\ Sans\ Mono\ for\ Powerline\ Nerd\ Font\ Complete\ 12
" set guifont=Fira\ Code\ Medium\ for\ Powerline\ Plus\ Nerd\ File\ Types\ Medium\ 12

set encoding=UTF-8
" " required if using https://github.com/bling/vim-airline
let g:airline_powerline_fonts=1


let g:JSHintHighlightErrorLine = 0
let g:miniBufExplForceSyntaxEnable = 1

let g:airline#extensions#tabline#enabled = 1
let g:airline_powerline_fonts = 1
let g:airline#extensions#ale#enabled = 1

let g:autotagTagsFile=".tags"

" Syntastic config
" set statusline+=%#warningmsg#
" set statusline+=%{SyntasticStatuslineFlag()}
" set statusline+=%*

"let g:syntastic_always_populate_loc_list = 1
"let g:syntastic_auto_loc_list = 1
"let g:syntastic_check_on_open = 1
"let g:syntastic_check_on_wq = 0

" pymode config
let g:pymode_lint_config = '$HOME/.pylint.rc'

" Typescript configs (this will probably slow shit to a crawl)
let g:typescript_compiler_binary = 'tsc'
let g:typescript_compiler_options = ''
autocmd QuickFixCmdPost [^l]* nested cwindow
autocmd QuickFixCmdPost    l* nested lwindow

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

filetype on

set expandtab
set smarttab
set tabstop=4
set softtabstop=4
set shiftwidth=4

set foldcolumn=4
" set foldenable
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
filetype plugin on

"omnisharp settings
" OmniSharp won't work without this setting

" Don't autoselect first omnicomplete option, show options even if there is only
" one (so the preview documentation is accessible). Remove 'preview' if you
" don't want to see any documentation whatsoever.
let g:OmniSharp_server_path='/opt/OmniSharp/OmniSharp.exe'
set completeopt=longest,menuone,preview

" Fetch full documentation during omnicomplete requests.
" There is a performance penalty with this (especially on Mono).
" By default, only Type/Method signatures are fetched. Full documentation can
" still be fetched when you need it with the :OmniSharpDocumentation command.
"let g:omnicomplete_fetch_full_documentation = 1

" Set desired preview window height for viewing documentation.
" You might also want to look at the echodoc plugin.
set previewheight=5

" Tell ALE to use OmniSharp for linting C# files, and no other linters.
let g:ale_linters = { 'cs': ['OmniSharp'] }

augroup omnisharp_commands
    autocmd!

    " When Syntastic is available but not ALE, automatic syntax check on events
    " (TextChanged requires Vim 7.4)
    " autocmd BufEnter,TextChanged,InsertLeave *.cs SyntasticCheck

    " Show type information automatically when the cursor stops moving
    autocmd CursorHold *.cs call OmniSharp#TypeLookupWithoutDocumentation()

    " The following commands are contextual, based on the cursor position.
    autocmd FileType cs nnoremap <buffer> gd :OmniSharpGotoDefinition<CR>
    autocmd FileType cs nnoremap <buffer> <Leader>fi :OmniSharpFindImplementations<CR>
    autocmd FileType cs nnoremap <buffer> <Leader>fs :OmniSharpFindSymbol<CR>
    autocmd FileType cs nnoremap <buffer> <Leader>fu :OmniSharpFindUsages<CR>

    " Finds members in the current buffer
    autocmd FileType cs nnoremap <buffer> <Leader>fm :OmniSharpFindMembers<CR>

    autocmd FileType cs nnoremap <buffer> <Leader>fx :OmniSharpFixUsings<CR>
    autocmd FileType cs nnoremap <buffer> <Leader>tt :OmniSharpTypeLookup<CR>
    autocmd FileType cs nnoremap <buffer> <Leader>dc :OmniSharpDocumentation<CR>
    autocmd FileType cs nnoremap <buffer> <C-\> :OmniSharpSignatureHelp<CR>
    autocmd FileType cs inoremap <buffer> <C-\> <C-o>:OmniSharpSignatureHelp<CR>


    " Navigate up and down by method/property/field
    autocmd FileType cs nnoremap <buffer> <C-k> :OmniSharpNavigateUp<CR>
    autocmd FileType cs nnoremap <buffer> <C-j> :OmniSharpNavigateDown<CR>
augroup END

" Contextual code actions (uses fzf, CtrlP or unite.vim when available)
nnoremap <Leader><Space> :OmniSharpGetCodeActions<CR>
" Run code actions with text selected in visual mode to extract method
xnoremap <Leader><Space> :call OmniSharp#GetCodeActions('visual')<CR>

" Rename with dialog
nnoremap <Leader>nm :OmniSharpRename<CR>
nnoremap <F2> :OmniSharpRename<CR>
" Rename without dialog - with cursor on the symbol to rename: `:Rename newname`
command! -nargs=1 Rename :call OmniSharp#RenameTo("<args>")

nnoremap <Leader>cf :OmniSharpCodeFormat<CR>

" Start the omnisharp server for the current solution
nnoremap <Leader>ss :OmniSharpStartServer<CR>
nnoremap <Leader>sp :OmniSharpStopServer<CR>

" Add syntax highlighting for types and interfaces
nnoremap <Leader>th :OmniSharpHighlightTypes<CR>

" Enable snippet completion
" let g:OmniSharp_want_snippet=1
"end omnisharp settings


"pyflake settings
let g:flake8_show_quickfix=0

"Added by android-vim:
set tags+=/home/fergalm/.vim/tags
autocmd Filetype java setlocal omnifunc=javacomplete#Complete
let g:SuperTabDefaultCompletionType = 'context'

" NerdCommenter
let g:NERDSpaceDelims = 1

colorscheme dracula
