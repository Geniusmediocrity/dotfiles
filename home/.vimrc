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

let &t_ut=''


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

" SEARCHING {{{

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

" Preview substitutions live
if exists('+inccommand')
    set inccommand=split
endif

" KEYMAPS {{{


" Clear highlights on search when pressing <Esc> in normal mode
nnoremap <Esc> :nohlsearch<CR>

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
