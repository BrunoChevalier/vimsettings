if &compatible
  set nocompatible " Be iMproved
endif

" Required:
set runtimepath+=~/.vim/dein/repos/github.com/Shougo/dein.vim

" Required:
if dein#load_state('~/.vim/dein')
    call dein#begin('~/.vim/dein')

    " Let dein manage dein
    " Required:
    call dein#add('~/.vim/dein/repos/github.com/Shougo/dein.vim')

    " Fancy statusbar
    call dein#add('bling/vim-airline')

    " Plugin to display buffer in airline bar
    call dein#add('bling/vim-bufferline')

    " delimitMate
    call dein#add('raimondi/delimitMate')

    " use s to go anywhere
    call dein#add('easymotion/vim-easymotion')

    " leader P > fuzzy file finding
    call dein#add('ctrlpvim/ctrlp.vim')

    " Surround with parentheses, brackets, quotes, ...
    call dein#add('tpope/vim-surround')

    " Display the trailing whitespaces better
    call dein#add('ntpeters/vim-better-whitespace')

    " Add or remove your plugins here:
"    call dein#add('Shougo/neosnippet.vim')
"    call dein#add('Shougo/neosnippet-snippets')
"
"    " You can specify revision/branch/tag.
"    call dein#add('Shougo/vimshell', { 'rev': '3787e5' })

    " Required:
    call dein#end()
    call dein#save_state()
endif

" Required:
filetype plugin indent on
syntax enable

" If you want to install not installed plugins on startup.
"if dein#check_install()
"  call dein#install()
"endif

" ***************************************************************************************
" ---------------------------------------------------------------------------------------
" Plugin settings and key mapping
" ---------------------------------------------------------------------------------------
" ***************************************************************************************
" Airline settings
    let g:airline#extensions#tabline#enabled = 1 " Enable the list of buffers
    let g:airline#extensions#tabline#fnamemod = ':t' " Show just the filename

" Bufferline settings
    let g:airline#extensions#bufferline#enabled = 1 "Display buffer in airline bar

"easymotion remapping
    map <Leader> <Plug>(easymotion-prefix)
    let g:EasyMotion_do_mapping = 0 " Disable default mappings
    let g:EasyMotion_smartcase = 1 " Turn on case insensitive feature

    " Jump to anywhere you want with minimal keystrokes, with just one key binding.
    " `s{char}{label}`
    "nmap s <Plug>(easymotion-overwin-f)
    " or
    " `s{char}{char}{label}`
    " Need one more keystroke, but on average, it may be more comfortable.
    nmap s <Plug>(easymotion-overwin-f2)
    " JK motions: Line motions
    map <Leader>jj <Plug>(easymotion-j)
    map <Leader>kk <Plug>(easymotion-k)

" CtrlP settings
    let g:ctrlp_cmd = 'CtrlP'
    let g:ctrlp_working_path_mode = 'a'
    let g:ctrlp_custom_ignore = {
      \ 'dir':  '\v[\/]\.(git|hg|svn)$',
      \ 'file': '\v\.(exe|so|dll)$',
      \ 'link': 'some_bad_symbolic_links',
      \ }
    nnoremap <leader>p :CtrlPMixed<CR>


" ***************************************************************************************
" ---------------------------------------------------------------------------------------
" "Normal" Vim settings
" ---------------------------------------------------------------------------------------
" ***************************************************************************************
" Color settings
set t_Co=256

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
set shiftwidth=4    "Test first if we can do without it


" Interface settings --------------------------------------------------------------------
colorscheme solarized
set background=dark
set cursorline      "Highlight the line where the cursor is
set langmenu=none   "langmenu options sets the language used in menu's - none = English
set laststatus=2    "Show airline statusbar all the time
syntax enable           "Set syntaxhighlighting on


" Misc settings -------------------------------------------------------------------------
set backspace=indent,eol,start  "Allow backspace in insert mode
set complete+=i     "Also search in included files for completion
set omnifunc=syntaxcomplete#Complete    "Enables smart completion with <C-X> - filetype plugin on is needed for this
"When putting the line on your cursor to the end(zb)/middle(zz)/top(zt) of the
"screen, scroloff determinates the lines between the end and the selected line
set scrolloff=0
set showcmd         "Show the current command-key-combination at the rights side in the status bar
set wildmenu        "Better command-line completion (tab cycling)
set wildignore+=*/tmp/*,*.so,*.swp,*.zip " ignore some file-extensions
set hidden          "Be able to switch between buffer without having to save every time

set list
" set listchars=eol:⏎,tab:␉·,trail:␠,nbsp:⏟
set listchars=tab:␉·,trail:␠,nbsp:⏟


set tags=./tags,tags;/

if exists('+colorcolumn')
    set colorcolumn=80,100,120
endif

" Automatically create backup directory, writable by the group.
if filewritable("~") && ! filewritable("~/.vimbackups")
    silent execute '!umask 002; mkdir ~/.vimbackups'
endif

" Automatically create backup directory, writable by the group.
if filewritable("~") && ! filewritable("~/.vimswap")
    silent execute '!umask 002; mkdir ~/.vimbackups'
endif

" For Unix and Win32, if a directory ends in two path separators, the swap file name
" will be built from the complete path to the file with all path separators substituted
" to percent '%' signs. This will ensure file name uniqueness in the preserve directory.
set backupdir=~/.vimbackups//
set directory=~/.vimswap//

" ***************************************************************************************
" ---------------------------------------------------------------------------------------
" Key bindings
" ---------------------------------------------------------------------------------------
" ***************************************************************************************
let mapleader = " "
set pastetoggle=<F2>

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
