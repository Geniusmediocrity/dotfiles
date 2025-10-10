let g:mapleader = " "
let g:maplocalleader = " "

" Windows splitting
nnoremap <leader>ws :split<CR>
nnoremap <leader>wv :vsplit<CR>

" Chose window
nnoremap <C-h> <C-w>h
nnoremap <C-j> <C-w>j
nnoremap <C-k> <C-w>k
nnoremap <C-l> <C-w>l

set mouse=a
set encoding=utf-8

set relativenumber
set number

" tabs
set tabstop=4
set softtabstop=4
set shiftwidth=4
set smartindent

" Set highlight when searching
set hlsearch

" Sync clipboard
set clipboard+=unnamedplus

set breakindent

" Save undo history
set undofile

" Case-insensitive searching UNLESS \C or one or more capital letters in the search term
set ignorecase
set smartcase

" Keep signcolumn on by default
set signcolumn = "yes"

set updatetime=250

" Decrease mapped sequence wait time
set timeoutlen=300

" Configure how new splits should be opened
set splitright
set splitbelow

" Sets how neovim will display certain whitespace characters in the editor.
set list
set listchars=tab:»\ ,trail:·,nbsp:␣

" Preview substitutions live, as you type!
if exists('+inccommand')
    set inccommand=split
endif

" Show which line your cursor is on
set cursorline

" Confirm dangerous operrations
set confirm

" Highlight when yanking (copying) text
augroup HighlightYank
    autocmd!
    autocmd TextYankPost * silent! lua vim.highlight.on_yank{higroup="IncSearch", timeout=500}
augroup END

" Minimal number of screen lines to keep above and below the cursor.
set scrolloff=10

" === === Keymaps === ===
" === Miscellaneous keymaps ===

" Clear highlights on search when pressing <Esc> in normal mode
nnoremap <Esc> :nohlsearch<CR>

" Diagnostic keymaps
nnoremap <leader>q :lopen<CR>

" Save file
nnoremap <leader>sf :w<CR>

" === Windows ===

" Creating / splitting
nnoremap <leader>wv <C-w>v<Esc>
nnoremap <leader>ws <C-w>s<Esc>
nnoremap <leader>wn <C-w>n

" Moving
nnoremap <leader>wl <C-w>L
nnoremap <leader>wk <C-w>K
nnoremap <leader>wj <C-w>J
nnoremap <leader>wh <C-w>H

" Manipulating
nnoremap <leader>wo <C-w>o
nnoremap <leader>w+ <C-w>+
nnoremap <leader>w- <C-w>-

" === Custom Modes ===

" Enter Visual Block mode
nnoremap <leader>v <Cmd>execute "normal! \<C-v>"<CR>
