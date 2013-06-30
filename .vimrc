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

" Easily switch between windows
nnoremap <C-h> <C-w>h
nnoremap <C-j> <C-w>j
nnoremap <C-k> <C-w>k
nnoremap <C-l> <C-w>l

"Opens a split and switches over (\v)
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
inoremap <C-S-t> <Esc>:tabnew<CR>

" Bundles

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
