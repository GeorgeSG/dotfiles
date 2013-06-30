" General
syntax on
filetype on
filetype plugin on
set nocompatible
set autoindent
set smartindent
set linespace=2

" Code Folding
set foldlevelstart=20
set foldmethod=indent

" Fix line numbers and tabs
set number
set tabstop=4 softtabstop=4 shiftwidth=4 expandtab

" Set colors
colorscheme railscasts
set t_Co=256
set cursorline

" Set the Command Line
set showcmd
set showmode
set laststatus=2

" Move lines up/down
nnoremap <C-Down> :m .+1<CR>==
nnoremap <C-Up> :m .-2<CR>==
vnoremap <C-Down> :m '>+1<CR>gv=gv
vnoremap <C-Up> :m '<-2<CR>gv=gv

" Automatically change current directory to that of the file in the buffer
autocmd BufEnter * cd %:p:h

" Disable gvim toolbars by default
set guioptions-=T
set guioptions-=m>

" Use Ctrl+F2 to toggle gui
map <silent> <C-F2> :if &guioptions =~# 'T' <Bar>
        \set guioptions-=T <Bar>
        \set guioptions-=m <Bar>
    \else <Bar>
        \set guioptions+=T <Bar>
        \set guioptions+=m <Bar>
    \endif<CR>


" Remove trailing spaces on save
autocmd BufWritePre * :%s/\s\+$//e

" Use CTRL+S to save file changes
command -nargs=0 -bar Update if &modified
                           \|    if empty(bufname('%'))
                           \|        browse confirm write
                           \|    else
                           \|        confirm write
                           \|    endif
                           \|endif

" Undo and swap dirs
set undodir=~/.vim/undodir
set dir=~/.vim/swapdir

" Disable netrw
let g:loaded_netrw = 1
let g:loaded_netrwPlugin = 1

" Easily switch between split windows
nnoremap <C-h> <C-w>h
nnoremap <C-j> <C-w>j
nnoremap <C-k> <C-w>k
nnoremap <C-l> <C-w>l

" Opens a split and switches over (\v, \s)
nnoremap <leader>v <C-w>v<C-w>l
nnoremap <leader>s <C-w>s<C-w>j

nnoremap <silent> <C-S> :<C-u>Update<CR>
inoremap <c-s> <c-o>:Update<CR>
imap <S-Tab> <Esc><<i


" tab navigation
nnoremap <C-S-tab> :tabprevious<CR>
nnoremap <C-tab>   :tabnext<CR>
nnoremap <C-S-t>   :tabnew<CR>
inoremap <C-S-tab> <Esc>:tabprevious<CR>i
inoremap <C-tab>   <Esc>:tabnext<CR>i
inoremap <C-S-t>   <Esc>:tabnew<CR>

" Bundles
set rtp+=~/.vim/bundle/vundle/
call vundle#rc()

Bundle 'gmarik/vundle'
Bundle 'The-NERD-tree'
Bundle 'majutsushi/tagbar'
Bundle 'Lokaltog/vim-powerline'
Bundle 'tpope/vim-commentary'
Bundle 'tpope/vim-repeat'
Bundle 'tpope/vim-endwise'
Bundle 'tpope/vim-surround'
Bundle 'tpope/vim-fugitive'
Bundle 'bronson/vim-trailing-whitespace'
Bundle 'SingleCompile'
Bundle 'jiangmiao/auto-pairs'
Bundle 'vim-ruby/vim-ruby'
Bundle 'pangloss/vim-javascript'
Bundle 'kien/ctrlp.vim'
Bundle 'jelera/vim-javascript-syntax'
Bundle 'genutils'
Bundle 'Nibble'


" NERDTree
map <F2> :NERDTreeToggle<CR>

" Tagbar
map <F3> :TagbarToggle<CR>

" SimpleCompile
nmap <F8> :SCCompile<cr>
nmap <F9> :SCCompileRun<cr>
