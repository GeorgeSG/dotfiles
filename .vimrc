syntax on
filetype off
set nocompatible

" Fix line numbers and tabs
set number
set tabstop=4 softtabstop=4 shiftwidth=4 expandtab

" Set colorscheme
colorscheme jellybeans
set t_Co=256
set cursorline
filetype plugin on

" Set the Command Line
set showcmd
set showmode
set laststatus=2

set guioptions-=T
set guioptions-=m>

" Remove trailing spaces on save
autocmd BufWritePre * :%s/\s\+$//e
set autoindent

set rtp+=~/.vim/bundle/vundle/
call vundle#rc()

" Use CTRL+S to save file changes
command -nargs=0 -bar Update if &modified
                           \|    if empty(bufname('%'))
                           \|        browse confirm write
                           \|    else
                           \|        confirm write
                           \|    endif
                           \|endif

" Use Ctrl+F2 to remove gui
map <silent> <C-F2> :if &guioptions =~# 'T' <Bar>
        \set guioptions-=T <Bar>
        \set guioptions-=m <Bar>
    \else <Bar>
        \set guioptions+=T <Bar>
        \set guioptions+=m <Bar>
    \endif<CR>

" Undo dir
set undodir=~/.vim/undodir
set dir=~/.vim/swapdir

" Disable netrw
let g:loaded_netrw = 1
let g:loaded_netrwPlugin = 1

nnoremap <silent> <C-S> :<C-u>Update<CR>
inoremap <c-s> <c-o>:Update<CR>
imap <S-Tab> <Esc><<i


" tab navigation
nnoremap <C-S-tab> :tabprevious<CR>
nnoremap <C-tab>   :tabnext<CR>
nnoremap <C-S-t>   :tabnew<CR>
nnoremap <C-S-w>   <Esc>:tabclose<CR>
inoremap <C-S-tab> <Esc>:tabprevious<CR>i
inoremap <C-tab>   <Esc>:tabnext<CR>i
inoremap <C-S-t> <Esc>:tabnew<CR>
inoremap <C-S-w> <Esc>:tabclose<CR>

" Maximize the GVim window
if has("gui_running")
  " GUI is running or is about to start.
  " Maximize gvim window.
  set lines=999 columns=999
else
  " This is console Vim.
  if exists("+lines")
    set lines=50
  endif
  if exists("+columns")
    set columns=100
  endif
endif

" Bundles

Bundle 'gmarik/vundle'
Bundle 'The-NERD-tree'
Bundle 'Lokaltog/vim-powerline'
Bundle 'tpope/vim-commentary'
Bundle 'tpope/vim-repeat'
Bundle 'tpope/vim-endwise'
Bundle 'tpope/vim-surround'
Bundle 'bronson/vim-trailing-whitespace'
Bundle 'wincent/Command-T'
Bundle 'SingleCompile'
Bundle 'jiangmiao/auto-pairs'

" NERDTree
map <F2> :NERDTreeToggle<CR>

" SimpleCompile
nmap <F8> :SCCompile<cr>
nmap <F9> :SCCompileRun<cr>
