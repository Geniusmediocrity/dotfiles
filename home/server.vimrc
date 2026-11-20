let &t_ut=''


set foldmethod=manual

" Disable compatibility with vi which can cause unexpected issues.
set nocompatible

" Enable type file detection. Vim will be able to try to detect the type of file in use.
filetype plugin indent on

syntax on

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

" Set highlight when searching
set hlsearch

" Case-insensitive searching UNLESS \C or one or more capital letters in the search term
set ignorecase
set smartcase

" Show matching words during a search.
set showmatch


" SEARCHING {{{

" Case-insensitive searching UNLESS \C or one or more capital letters in the search term
set ignorecase
set smartcase

" Show matching words during a search.
set showmatch

" Use highlighting when doing a search.
set hlsearch

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

" THEME {{{

colorscheme slate

" }}}
