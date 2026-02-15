"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""               
"               
"               ██╗   ██╗██╗███╗   ███╗██████╗  ██████╗
"               ██║   ██║██║████╗ ████║██╔══██╗██╔════╝
"               ██║   ██║██║██╔████╔██║██████╔╝██║     
"               ╚██╗ ██╔╝██║██║╚██╔╝██║██╔══██╗██║     
"                ╚████╔╝ ██║██║ ╚═╝ ██║██║  ██║╚██████╗
"                 ╚═══╝  ╚═╝╚═╝     ╚═╝╚═╝  ╚═╝ ╚═════╝
"               
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""" 

" BASIC {{{

set foldmethod=manual

" Disable compatibility with vi which can cause unexpected issues.
set nocompatible

" Enable type file detection. Vim will be able to try to detect the type of file in use.
filetype on

let g:mapleader = " "
let g:maplocalleader = " "

set mouse=a
set encoding=utf-8

set relativenumber
set number

" tabs
set tabstop=4
set softtabstop=4
set shiftwidth=4
set smartindent

" Sync clipboard
set clipboard=unnamedplus

set breakindent

" Save undo history
set undofile

" Show partial command you type in the last line of the screen.
set showcmd

" Show the mode you are on the last line.
set showmode

" Set the commands to save in history default number is 20.
set history=500

" Keep signcolumn on by default
" set signcolumn=yes

set updatetime=250

" Decrease mapped sequence wait time
set timeoutlen=300

" Configure how new splits should be opened
set splitright
set splitbelow

" Sets how neovim will display certain whitespace characters in the editor.
set list
set listchars=tab:»\ ,trail:·,nbsp:␣

" Show which line your cursor is on
set cursorline

" Confirm dangerous operrations
set confirm

" Minimal number of screen lines to keep above and below the cursor.
set scrolloff=10

" Auto-reload files changed outside vim
set autoread

" }}}

" WINDOWS {{{

" Creating / splitting
nnoremap <leader>wv <C-w>v<Esc>
nnoremap <leader>ws <C-w>s<Esc>
nnoremap <leader>wn <C-w>n

" Chose window
nnoremap <C-h> <C-w>h
nnoremap <C-j> <C-w>j
nnoremap <C-k> <C-w>k
nnoremap <C-l> <C-w>l

" Moving
nnoremap <leader>wl <C-w>L
nnoremap <leader>wk <C-w>K
nnoremap <leader>wj <C-w>J
nnoremap <leader>wh <C-w>H

" Manipulating
nnoremap <leader>wo <C-w>o
nnoremap <leader>w+ <C-w>+
nnoremap <leader>w- <C-w>-

" Resize split windows using arrow keys by pressing:
" CTRL+UP, CTRL+DOWN, CTRL+LEFT, or CTRL+RIGHT.
noremap <c-up> <c-w>+
noremap <c-down> <c-w>-
noremap <c-left> <c-w>>
noremap <c-right> <c-w><

" You can split a window into sections by typing `:split` or `:vsplit`.
" Display cursorline and cursorcolumn ONLY in active window.
augroup cursor_off
    autocmd!
    autocmd WinLeave * set nocursorline
    autocmd WinEnter * set cursorline
augroup END

" }}}

" SEARCHING {{{

" Set highlight when searching
set hlsearch

" Case-insensitive searching UNLESS \C or one or more capital letters in the search term
set ignorecase
set smartcase

" Show matching words during a search.
set showmatch

" Use highlighting when doing a search.
set hlsearch

" }}}

" WILDMENU {{{

"  Bash completion is a great feature which saves keystrokes by auto completing what you type.
"  Vim has a similar feature called wildmenu.

" Enable auto completion menu after pressing TAB.
set wildmenu
" There are certain files that we would never want to edit with Vim.
" Wildmenu will ignore files with these extensions.
set wildignore=*.docx,*.jpg,*.png,*.gif,*.pdf,*.pyc,*.exe,*elf,*.flv,*.img,*.xlsx,.git,.hg,.svn

" }}}

" PROGRAMMING {{{

" C++ settings
autocmd FileType cpp setlocal tabstop=4 shiftwidth=4
autocmd FileType cpp setlocal formatoptions-=cro
autocmd FileType cpp setlocal commentstring=//\ %s
autocmd FileType cpp setlocal omnifunc=ccomplete#Complete
autocmd FileType cpp setlocal complete+=k~/.vim/cpp_keywords.txt

" Python settings
autocmd FileType python setlocal tabstop=4 shiftwidth=4
autocmd FileType python setlocal formatoptions-=cro
autocmd FileType python setlocal commentstring=#\ %s
autocmd FileType python setlocal omnifunc=python3complete#Complete
autocmd FileType python setlocal complete+=k~/.vim/python_keywords.txt
autocmd FileType python setlocal makeprg=python3\ -m\ py_compile\ %

" HTML settings
autocmd FileType html setlocal tabstop=2 shiftwidth=2
autocmd FileType html setlocal formatoptions+=mM
autocmd FileType html setlocal omnifunc=htmlcomplete#CompleteTags

" CSS settings
autocmd FileType css setlocal tabstop=2 shiftwidth=2
autocmd FileType css setlocal omnifunc=csscomplete#CompleteCSS

" Jinja2 settings (treat as HTML with Django syntax)
autocmd BufNewFile,BufRead *.j2,*.jinja,*.jinja2 setfiletype jinja.html
autocmd FileType jinja setlocal tabstop=2 shiftwidth=2
autocmd FileType jinja setlocal formatoptions+=mM

" JavaScript settings
autocmd FileType javascript setlocal tabstop=2 shiftwidth=2
autocmd FileType javascript setlocal omnifunc=javascriptcomplete#CompleteJS

" }}}

" EDITOR {{{

" Auto-pair brackets and quotes
" inoremap { {}<Left>
" inoremap [ []<Left>
" inoremap ( ()<Left>
" inoremap " ""<Left>
" inoremap ' ''<Left>

" Auto-close HTML tags
autocmd FileType html,xml,jinja,js,css inoremap <buffer> < <><Left>

" Auto-indent on new lines
autocmd FileType * inoremap <buffer> <CR> <CR><C-o>==

" Set directories to search files in
set path+=.,
set path+=/usr/include,
set path+=/usr/lib/gcc/*/*/include,
set path+=inc,
set path+=include,
set path+=/usr/avr/include,
set path+=~/.pebble-sdk/SDKs/current/sdk-core/pebble/*/include

" }}}


" Preview substitutions live
if exists('+inccommand')
    set inccommand=split
endif

" KEYMAPS {{{

" MISCELLANEOUS {{{

" Clear highlights on search when pressing <Esc> in normal mode
nnoremap <Esc> :nohlsearch<CR>

" Diagnostic keymaps
nnoremap <leader>q :lopen<CR>

" Save file
nnoremap <leader>sf :w<CR>

" Pressing the ENTER  will open a new line below the current one.
" Exit insert mode after creating a new line above or below the current line.
nnoremap <CR> o<esc>
nnoremap <S-CR> O<esc>

" Quick comment toggle
nnoremap <leader>c I// <Esc>
vnoremap <leader>c :s/^/\/\//<CR>

" }}}

" CUSTOM MODES {{{

" Enter Visual Block mode
nnoremap <leader>v <Cmd>execute "normal! \<C-v>"<CR>

" }}}

" }}}

" THEME {{{

" Important!!
if has('termguicolors')
	set termguicolors
endif

let g:gruvbox_italic = 1
let g:gruvbox_italicize_strings = 1
let g:gruvbox_contrast_dar = 'soft'

colorscheme gruvbox
set background=dark
" Turn syntax highlighting on.
:syntax on

" }}}
