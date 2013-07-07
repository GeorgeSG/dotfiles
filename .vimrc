" General
syntax on
filetype on
filetype plugin on
set nocompatible
set autoread
set shortmess=atI

" Start scrolling when we're 8 lines from the bottom
set scrolloff=8

" Set fonts
set encoding=utf-8
set guifont=Menlo\ for\ Powerline\ 10
set linespace=2


" Set colors
colorscheme Tomorrow
set t_Co=256
set cursorline
autocmd BufEnter * :syntax sync fromstart

" Set line numbers, tabulations and indentations
set number
set tabstop=4 softtabstop=4 shiftwidth=4 expandtab
set autoindent
set smartindent

" Set the Command Line
set showcmd
set showmode
set laststatus=2

" Display trailing tabs and spaces
set list listchars=tab:\ \ ,trail:·

" Code Folding
set foldlevelstart=20
set foldmethod=indent

" Move lines up/down
nnoremap <C-Down> :m .+1<CR>==
nnoremap <C-Up> :m .-2<CR>==
vnoremap <C-Down> :m '>+1<CR>gv=gv
vnoremap <C-Up> :m '<-2<CR>gv=gv

" Ease visual shifting
vnoremap > >gv
vnoremap < <gv

" Automatically change current directory to that of the file in the buffer
autocmd BufEnter * cd %:p:h

" Disable gvim toolbars by default
set guioptions-=T
set guioptions-=m>

" Use Ctrl+F2 to toggle gui
map <silent> <C-F3> :if &guioptions =~# 'T' <Bar>
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

nnoremap <silent> <C-S> :<C-u>Update<CR><ESC>
inoremap <c-s> <c-o>:Update<CR><ESC>

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

" Easily move split windows
nnoremap <S-H> <C-w>H
nnoremap <S-J> <C-w>J
nnoremap <S-K> <C-w>K
nnoremap <S-L> <C-w>L

" Opens a split and switches over (\v, \s)
nnoremap <leader>v <C-w>v<C-w>l
nnoremap <leader>s <C-w>s<C-w>j

" Shift-Tab to go backwards in insert mode
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
Bundle 'vim-ruby/vim-ruby'
Bundle 'tpope/vim-sensible'
Bundle 'tpope/vim-commentary'
Bundle 'tpope/vim-repeat'
Bundle 'tpope/vim-endwise'
Bundle 'tpope/vim-surround'
Bundle 'tpope/vim-fugitive'
Bundle 'terryma/vim-multiple-cursors'
Bundle 'godlygeek/tabular'
Bundle 'bronson/vim-trailing-whitespace'
Bundle 'SingleCompile'
Bundle 'jiangmiao/auto-pairs'
Bundle 'pangloss/vim-javascript'
Bundle 'kien/ctrlp.vim'
Bundle 'jelera/vim-javascript-syntax'
Bundle 'abijr/colorpicker'

" The REALLY serious stuff :D
Bundle 'genutils'
Bundle 'Nibble'

" NERDTree
map <F2> :NERDTreeToggle<CR>
map <C-F2> :NERDTree<CR>

" Tagbar
map <F3> :TagbarToggle<CR>

" Powerline
let g:Powerline_symbols = 'fancy'


" SimpleCompile
nmap <F8> :SCCompile<cr>
nmap <F9> :SCCompileRun<cr>

" Multiple-Cursors
let g:multi_cursor_use_default_mapping=0
let g:multi_cursor_next_key='<C-S-k>'
let g:multi_cursor_prev_key='<C-p>'
let g:multi_cursor_skip_key='<C-x>'
let g:multi_cursor_quit_key='<Esc>'

" Tabular
nmap <Leader>a= :Tabularize /=<CR>
vmap <Leader>a= :Tabularize /=<CR>
nmap <Leader>a: :Tabularize /:\zs<CR>
vmap <Leader>a: :Tabularize /:\zs<CR>

