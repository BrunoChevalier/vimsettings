" ***************************************************************************************
" ---------------------------------------------------------------------------------------
" Bruno Chevalier's .vimrc
" Info: bmgg.chevalier@gmail.com
" ---------------------------------------------------------------------------------------
" ***************************************************************************************
set nocompatible              " be iMproved, required
set encoding=utf-8
filetype off
" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim

" Install vim-plug if it's not present
if empty(glob('~/.vim/autoload/plug.vim'))
  silent !curl -fLo ~/.vim/autoload/plug.vim --create-dirs
    \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif

" :PlugInstall to install
" :PlugUpdate to install or update plugins
" :PlugClean[!] Remove unlisted plugins (bang version will clean without prompt)
" :PlugUpgrade upgrade vim-plug itself
call plug#begin('~/.vim/plugged')

" Fancy statusbar
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'enricobacis/vim-airline-clock'

"" Angry plugin - to use 'a' for argument (change in argument, delete all arguments)
Plug 'b4winckler/vim-angry'

" Plugin to display buffer in airline bar
Plug 'bling/vim-bufferline'

" delimitMate
Plug 'raimondi/delimitMate'

" Robotframework Highlighting - usage : setf robot
Plug 'git://github.com/mfukar/robotframework-vim.git'

Plug 'easymotion/vim-easymotion'
Plug 'Yggdroot/indentLine'
Plug 'ctrlpvim/ctrlp.vim'
Plug 'ntpeters/vim-better-whitespace'
Plug 'tpope/vim-surround'
Plug 'tpope/vim-repeat'

" Deus color scheme
" To display all highlight cmd = :so $VIMRUNTIME/syntax/hitest.vim
Plug 'ajmwagar/vim-deus'

" javascript highlighting support
Plug 'yuezk/vim-js'

" Typescript/tsx highlighting support
Plug 'HerringtonDarkholme/yats.vim'

" jsx highlighting support
Plug 'maxmellon/vim-jsx-pretty'

"minimap requires drawille
"Plugin 'severin-lemaignan/vim-minimap'
call plug#end()


" Use vundle for YouCompleteMe
" :PluginList       - lists configured plugins
" :PluginInstall    - installs plugins; append `!` to update or just :PluginUpdate
" :PluginSearch foo - searches for foo; append `!` to refresh local cache
" :PluginClean      - confirms removal of unused plugins; append `!` to auto-approve removal
call vundle#begin()
" let Vundle manage Vundle, required
Plugin 'VundleVim/Vundle.vim'
Plugin 'ycm-core/YouCompleteMe'
call vundle#end()
filetype plugin indent on    " required

autocmd VimEnter * DisableWhitespace
autocmd VimEnter * EnableWhitespace

" ***************************************************************************************
" ---------------------------------------------------------------------------------------
" "Normal" Vim settings
" ---------------------------------------------------------------------------------------
" ***************************************************************************************
" FileType settings
au BufRead,BufNewFile *.do set filetype=tcl

" Search settings -----------------------------------------------------------------------
set hlsearch        "Highlight all results that match your search
set incsearch       "Highlight all results that match your search while you're typing

" Number settings -----------------------------------------------------------------------
set number          "Display line numbers on the left side
set relativenumber  "Enable relative number counting - absolute line numbers still work
"Toggle linenumbers on and off
nnoremap <silent> <F12> :set invnumber invrelativenumber<CR>

" automatically switch to absolute line numbers whenever Vim loses focus,
" since we don't really care about the relative line numbers unless
" we're moving around
:au FocusLost * :set norelativenumber
:au FocusGained * :set relativenumber

" We don't move around in insert mode, so we don't need relative line numbers
autocmd InsertEnter * :set norelativenumber
autocmd InsertLeave * :set relativenumber


" Tab settings --------------------------------------------------------------------------
set autoindent      "Copy indent from the current line when starting a new line
set pastetoggle=<F2>

" Special indentation for yaml files
autocmd FileType yaml setlocal ts=2 sts=2 sw=2 expandtab
autocmd FileType yml setlocal ts=2 sts=2 sw=2 expandtab

" Don't expand TAB for the following filetypes
autocmd FileType make setlocal noexpandtab
autocmd FileType dts setlocal noexpandtab

" virtual tabstops using spaces
let my_tab=4
execute "set shiftwidth=".my_tab
execute "set softtabstop=".my_tab
execute "set tabstop=".my_tab
set expandtab
" allow toggling between local and default mode
function! TabToggle()
  if &expandtab
    set shiftwidth=8
    set softtabstop=0
    set noexpandtab
  else
    execute "set shiftwidth=".g:my_tab
    execute "set softtabstop=".g:my_tab
    set expandtab
  endif
endfunction
nmap <F9> mz:execute TabToggle()<CR>'z

" Interface settings --------------------------------------------------------------------
let g:airline#extensions#bufferline#enabled = 1     "Display buffer in airline bar
let g:airline_powerline_fonts = 1
set cursorline      "Highlight the line where the cursor is
set langmenu=none   "langmenu options sets the language used in menu's - none = English
set laststatus=2    "Show airline statusbar all the time
syntax enable           "Set syntaxhighlighting on

" Colors
set t_Co=256
set termguicolors
let &t_8f = "\<Esc>[38;2;%lu;%lu;%lum"
let &t_8b = "\<Esc>[48;2;%lu;%lu;%lum"
set background=dark    " Setting dark mode
let g:deus_termcolors=256
colorscheme deus

" Set the airline symbols
if !exists('g:airline_symbols')
  let g:airline_symbols = {}
endif

" powerline symbols
" Enter in vim with:
" In insert mode, type Ctrl+V followed by
" a decimal number (0-255)
" o then an octal number (o0-o377, i.e., 255 is the maximum value)
" x then a hex number (x00-xFF, i.e., 255 is the maximum value)
" u then a 4-hexchar Unicode sequence
" U then an 8-hexchar Unicode sequence
"let g:airline_left_sep = ''
"let g:airline_left_alt_sep = ''
"let g:airline_right_sep = ''
"let g:airline_right_alt_sep = ''
let g:airline_left_sep = ''
let g:airline_left_alt_sep = ''
let g:airline_right_sep = ''
let g:airline_right_alt_sep = ''
let g:airline_symbols.branch = ''
let g:airline_symbols.crypt = '🔒'
let g:airline_symbols.dirty='⚡'
"let g:airline_symbols.linenr = ''
let g:airline_symbols.linenr = ''
let g:airline_symbols.maxlinenr = ''
let g:airline_symbols.notexists = 'Ɇ'
let g:airline_symbols.paste = '∥'
let g:airline_symbols.readonly = ''
let g:airline_symbols.spell = 'Ꞩ'
let g:airline_symbols.whitespace = 'Ξ'


" Enable the list of buffers
let g:airline#extensions#tabline#enabled = 1
" Straight tabs
"let g:airline#extensions#tabline#left_sep = ' '
"let g:airline#extensions#tabline#left_alt_sep = '|'

" Show just the filename
" let g:airline#extensions#tabline#fnamemod = ':t'
" Use different formatter
"let g:airline#extensions#tabline#formatter = 'short_path'
let g:airline#extensions#tabline#formatter = 'unique_tail_improved'
let g:airline#extensions#clock#format = '%H:%M'

" Misc settings -------------------------------------------------------------------------
set backspace=indent,eol,start  "Allow backspace in insert mode
set complete+=i     "Also search in included files for completion
set nocompatible    " Make Vim not Vi-compatible (behave more useful)
set omnifunc=syntaxcomplete#Complete    "Enables smart completion with <C-X> - filetype plugin on is needed for this
"When putting the line on your cursor to the end(zb)/middle(zz)/top(zt) of the
"screen, scroloff determines the lines between the end and the selected line
set scrolloff=0 "Start scrollling 10 lines before the top or bottom
set shortmess=a "avoid typing ENTER to continue
set cmdheight=2 "More room for messages

set showcmd         "Show the current command-key-combination at the rights side in the status bar
set wildmenu        "Better command-line completion
set wildignore=*.o,*~,*.pyc " Ignore compiled files
set hidden          "Be able to switch between buffer without having to save every time

set list
" set listchars=eol:⏎,tab:␉·,trail:␠,nbsp:⏟
set listchars=tab:»·,trail:·


" Show matching brackets when text inidicator is over them
set showmatch

"set csprg=gtags-cscope
"let gtagsfile = $GTAGSROOT.'GTAGS'
"execute \"cscope add \".gtagsfile

set tags=./tags,tags;/

if exists('+colorcolumn')
    set colorcolumn=80,100,120
endif
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

" Append at end of word (even when on last character of the word)
nnoremap ea hea
nnoremap Ea hEa

nnoremap <silent> - :Explore<CR>

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

" Plugins config --------------------------------------------------------------

" GTAGS and unite-gtags mappings
"nnoremap <leader>gg :execute 'Unite gtags/def:'.expand('<cword>')<CR>
"nnoremap <leader>gc :execute 'Unite gtags/context'<CR>
"nnoremap <leader>gr :execute 'Unite gtags/ref'<CR>
"nnoremap <leader>ge :execute 'Unite gtags/grep'<CR>
"vnoremap <leader>gg <ESC>:execute 'Unite gtags/def:'.GetVisualSelection()<CR>
nnoremap <leader>jd :YcmCompleter GoTo<CR>
nnoremap <leader>jh :YcmCompleter GoToDefinition<CR>

"easymotion remapping
map <Leader> <Plug>(easymotion-prefix)

let g:EasyMotion_do_mapping = 0 " Disable default mappings

" Jump to anywhere you want with minimal keystrokes, with just one key binding.
" `s{char}{label}`
"nmap s <Plug>(easymotion-overwin-f)
" or
" `s{char}{char}{label}`
" Need one more keystroke, but on average, it may be more comfortable.
nmap s <Plug>(easymotion-overwin-f2)
" Turn on case insensitive feature
let g:EasyMotion_smartcase = 1
" JK motions: Line motions
map <Leader>jj <Plug>(easymotion-j)
map <Leader>kk <Plug>(easymotion-k)


" CtrlP settings
set wildignore+=*/tmp/*,*.so,*.swp,*.zip
let g:ctrlp_cmd = 'CtrlP'
let g:ctrlp_working_path_mode = 'a'
let g:ctrlp_custom_ignore = {
  \ 'dir':  '\v[\/]\.(git|hg|svn)$',
  \ 'file': '\v\.(exe|so|dll)$',
  \ 'link': 'some_bad_symbolic_links',
  \ }
nnoremap <leader>p :CtrlPMixed<CR>
nnoremap <leader>. :CtrlPTag<CR>

" Syntastic settings
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*

let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 0
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0
let g:syntastic_sh_shellcheck_args = "-s bash"
let g:syntastic_yaml_checkers = ['yamllint']
let g:syntastic_python_checkers = ['mypy', 'flake8']
nnoremap <leader>[ :lprevious<CR>
nnoremap <leader>] :lnext<CR>

" Fastfold settings
nmap zuz <Plug>(FastFoldUpdate)
let g:fastfold_savehook = 1
let g:fastfold_fold_command_suffixes =  ['x','X','a','A','o','O','c','C']
let g:fastfold_fold_movement_commands = [']z', '[z', 'zj', 'zk']

" indentLine settings
let g:indentLine_setConceal = 0

" Completor settings
"let g:completor_python_binary = '/usr/bin/python'
"let g:completor_racer_binary = '/usr/bin/racer'
"let g:completor_node_binary = '/usr/bin/node'
"let g:completor_clang_binary = '/usr/bin/clang'
"let g:completor_tsserver_binary = '/usr/bin/tsserver'
"
"" Use TAB to complete when typing words, else inserts TABs as usual.  Uses
"" dictionary, source files, and completor to find matching words to complete.
"
"" Note: usual completion is on <C-n> but more trouble to press all the time.
"" Never type the same word twice and maybe learn a new spellings!
"" Use the Linux dictionary when spelling is in doubt.
"function! Tab_Or_Complete() abort
"  " If completor is already open the `tab` cycles through suggested completions.
"  if pumvisible()
"    return "\<C-N>"
"  " If completor is not open and we are in the middle of typing a word then
"  " `tab` opens completor menu.
"  elseif col('.')>1 && strpart( getline('.'), col('.')-2, 3 ) =~ '^[[:keyword:][:ident:]]'
"    return "\<C-R>=completor#do('complete')\<CR>"
"  else
"    " If we aren't typing a word and we press `tab` simply do the normal `tab`
"    " action.
"    return "\<Tab>"
"  endif
"endfunction
"
"" Use `tab` key to select completions.  Default is arrow keys.
"inoremap <expr> <Tab> pumvisible() ? "\<C-n>" : "\<Tab>"
"inoremap <expr> <S-Tab> pumvisible() ? "\<C-p>" : "\<S-Tab>"
"
"" Use tab to trigger auto completion.  Default suggests completions as you type.
"let g:completor_auto_trigger = 0
"inoremap <expr> <Tab> Tab_Or_Complete()
"
"noremap <silent> <leader>d :call completor#do('definition')<CR>
"noremap <silent> <leader>c :call completor#do('doc')<CR>
"noremap <silent> <leader>f :call completor#do('format')<CR>
"noremap <silent> <leader>s :call completor#do('hover')<CR>

let g:completor_complete_options = 'menuone,noselect,preview'
