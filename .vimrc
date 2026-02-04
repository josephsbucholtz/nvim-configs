" =========================
" Remap
" =========================

" NOTE: <leader> defaults to \ in Vim. If you want Space like many Neovim setups:
let mapleader = " "

" Open netrw / file explorer (rough equivalent of :Ex in Vim)
nnoremap <leader>pv :Ex<CR>

" Move selected lines up/down
vnoremap J :m '>+1<CR>gv=gv
vnoremap K :m '<-2<CR>gv=gv

" Join lines but keep cursor position
nnoremap J mzJ`z

" Half-page moves stay centered
nnoremap <C-d> <C-d>zz
nnoremap <C-u> <C-u>zz

" Keep bottom of file centered when going to end
nnoremap G Gzz

" Next/prev search stays centered and opens folds
nnoremap n nzzzv
nnoremap N Nzzzv

" System clipboard yank (requires Vim compiled with +clipboard, or use gVim)
nnoremap <leader>y "+y
vnoremap <leader>y "+y
nnoremap <leader>Y "+Y

" Delete into void register
nnoremap <leader>d "_d
vnoremap <leader>d "_d

" Ctrl-c in insert behaves like Esc
inoremap <C-c> <Esc>

" Disable Ex mode
nnoremap Q <nop>

" Quickfix next/prev centered
nnoremap <C-k> :cnext<CR>zz
nnoremap <C-j> :cprev<CR>zz

" Location list next/prev centered
nnoremap <leader>k :lnext<CR>zz
nnoremap <leader>j :lprev<CR>zz

" Run current file (Vim version)
" Python: open a terminal and run python3 on current file
nnoremap <leader>rp :terminal python3 %<CR>

" Java: run java on current file name (you may want a class name instead)
nnoremap <leader>rj :terminal java %<CR>

" C++: save, compile to current file root name, then run it
nnoremap <leader>rcpp :w<CR>:!g++ -o %:r % && ./%:r<CR>


" =========================
" Plugins
" =========================


" =========================
" Set
" =========================

" Cursor style (Vim can't do vim.opt.guicursor="", but this is close-ish)
set guicursor=
colorscheme evening

set number
set relativenumber

set tabstop=4
set softtabstop=4
set shiftwidth=4
set expandtab

set smartindent
set nowrap

set noswapfile
set nobackup

" Persistent undo
set undofile
set undodir=~/.vim/undodir

set nohlsearch
set incsearch

" Truecolor (only works if your terminal supports it)
set termguicolors

set scrolloff=8
set signcolumn=yes

" Append @-@ to isfname
set isfname+=@-@

set updatetime=50
