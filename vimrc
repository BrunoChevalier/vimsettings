" ***************************************************************************************
" ---------------------------------------------------------------------------------------
" Bruno Chevalier's .vimrc
" Info: bmgg.chevalier@gmail.com
" ---------------------------------------------------------------------------------------
" ***************************************************************************************
execute pathogen#infect()
filetype plugin indent on


" ***************************************************************************************
" ---------------------------------------------------------------------------------------
" Vundle package manager
" ---------------------------------------------------------------------------------------
" ***************************************************************************************

" set the runtime path to include Vundle and initialize
call vundle#begin()

" Fancy statusbar
Plugin 'bling/vim-airline'

" Angry plugin - to use 'a' for argument (change in argument, delete all arguments)
Plugin 'b4winckler/vim-angry'

" Plugin to display buffer in airline bar
Plugin 'bling/vim-bufferline'

" delimitMate
Plugin 'raimondi/delimitMate'

" let Vundle manage Vundle, required
Plugin 'gmarik/Vundle.vim'

" Robotframework Highlighting - usage : setf robot
" Plugin 'git://github.com/mfukar/robotframework-vim.git'

call vundle#end()            " required

autocmd VimEnter * DisableWhitespace
autocmd VimEnter * EnableWhitespace

" ***************************************************************************************
" ---------------------------------------------------------------------------------------
" "Normal" Vim settings
" ---------------------------------------------------------------------------------------
" ***************************************************************************************

" Search settings -----------------------------------------------------------------------
set hlsearch        "Highlight all results that match your search
set incsearch       "Highlight all results that match your search while you're typing

" Number settings -----------------------------------------------------------------------
set number          "Display line numbers on the left side
set relativenumber  "Enable relative number counting - absolute line numbers still work

" Tab settings --------------------------------------------------------------------------
set autoindent      "Copy indent from the current line when starting a new line
set expandtab       "Use spaces to insert a <Tab> - A tab can be inserted by using <C-V><Tab>
set tabstop=4       "Number of spaces that a <Tab> in the file counts for
set shiftwidth=4   "Test first if we can do without it

set pastetoggle=<F2>

" Interface settings --------------------------------------------------------------------
set background=dark
colorscheme solarized "Set colorscheme - moloki is based on molokai with some minor changes"
let g:airline#extensions#bufferline#enabled = 1     "Display buffer in airline bar
set cursorline      "Highlight the line where the cursor is
set langmenu=none   "langmenu options sets the language used in menu's - none = English
set laststatus=2    "Show airline statusbar all the time
syntax enable           "Set syntaxhighlighting on

" Enable the list of buffers
let g:airline#extensions#tabline#enabled = 1

" Show just the filename
let g:airline#extensions#tabline#fnamemod = ':t'

" Misc settings -------------------------------------------------------------------------
set backspace=indent,eol,start  "Allow backspace in insert mode
set complete+=i     "Also search in included files for completion
set nocompatible    " Make Vim not Vi-compatible (behave more useful)
set omnifunc=syntaxcomplete#Complete    "Enables smart completion with <C-X> - filetype plugin on is needed for this
"When putting the line on your cursor to the end(zb)/middle(zz)/top(zt) of the
"screen, scroloff determinates the lines between the end and the selected line
set scrolloff=0
set showcmd         "Show the current command-key-combination at the rights side in the status bar
set wildmenu        "Better command-line completion
set hidden          "Be able to switch between buffer without having to save every time

set list
set listchars=eol:⏎,tab:␉·,trail:␠,nbsp:⏟

set tags=./tags,.hg/tags,tags;$HOME
set statusline+=%{gutentags#statusline()}

" ***************************************************************************************
" ---------------------------------------------------------------------------------------
" Key bindings
" ---------------------------------------------------------------------------------------
" ***************************************************************************************

let mapleader = " "

" Easier window navigation --------------------------------------------------------------
nnoremap <C-h> <C-w>h
nnoremap <C-j> <C-w>j
nnoremap <C-k> <C-w>k
nnoremap <C-l> <C-w>l

" To complete a whole line --------------------------------------------------------------
inoremap <C-l> <C-X><C-l>

" Unmap page up and down in insert mode -------------------------------------------------
imap <PageUp> <Nop>
imap <PageDown> <Nop>

" Unmap arrow keys ----------------------------------------------------------------------
map <Up> <Nop>
imap <Up> <Nop>
map <Down> <Nop>
imap <Down> <Nop>
map <Left> <Nop>
imap <Left> <Nop>
map <Right> <Nop>
imap <Right> <Nop>

" Remap goto end of line (easier to reach) ----------------------------------------------
noremap ; $

" Gundo
nnoremap <F5> :GundoToggle<CR>

" See https://joshldavis.com/2014/04/05/vim-tab-madness-buffers-vs-tabs/
" To open a new empty buffer
" This replaces :tabnew which I used to bind to this mapping
nmap <leader>T :enew<CR>

" Move to the next buffer
nmap <leader>l :bnext<CR>

" Move to the previous buffer
nmap <leader>h :bprevious<CR>

" Close the current buffer and move to the previous one
" This replicates the idea of closing a tab
nmap <leader>bq :bp <BAR> bd #<CR>

" Show all open buffers and their status
nmap <leader>bl :ls<CR>
