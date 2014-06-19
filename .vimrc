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
let s:maxfontsize     = 25
let s:minfontsize     = 6
let s:regularfontsize = 10
set guifont=Menlo\ for\ Powerline\ 10
set encoding=utf-8
set linespace=2

" Turn backup off
" set nobackup
" set nowb
" set noswapfile

" Undo dir
set undodir=~/.vim/undodir
set dir=~/.vim/swapdir

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

set colorcolumn=80

" Set the Command Line
set showcmd
set showmode
set laststatus=2

" Code Folding
set foldlevelstart=20
set foldmethod=indent

" Edit my vimrc file
nnoremap <Leader>ev :vsplit $MYVIMRC<cr>

" Source my vimrc file
nnoremap <Leader>sv :source $MYVIMRC<cr>

set langmap+=чявертъуиопшщасдфгхйклзьцжбнмЧЯВЕРТЪУИОПШЩАСДФГХЙКЛЗѝЦЖБНМ;`qwertyuiop[]asdfghjklzxcvbnm~QWERTYUIOP{}ASDFGHJKLZXCVBNM,ю\\,Ю\|,

" Disable some keys
inoremap <Left> <Nop>
inoremap <Right> <Nop>
inoremap <Up> <Nop>
inoremap <Down> <Nop>

" Buffer Management
nnoremap <Leader>j :bp<CR>
nnoremap <Leader>k :bn<CR>
nnoremap <Leader>d :bd<CR>

" Move lines up/down
nnoremap <C-Down> :m .+1<CR>==
nnoremap <C-Up> :m .-2<CR>==
vnoremap <C-Down> :m '>+1<CR>gv=gv
vnoremap <C-Up> :m '<-2<CR>gv=gv

" Ease visual shifting
vnoremap > >gv
vnoremap < <gv

" Ease copy-paste
nnoremap <Leader>p "+p
vnoremap <Leader>y "+y

" Automatically change current directory to that of the file in the buffer
autocmd BufEnter * cd %:p:h

" Search the word under the cursor recursively in the entire working
" directory, and show all files that contain it
map <F3> :execute "vimgrep /" . expand("<cword>") . "/j **" <Bar> cw<CR>

" Disable gvim toolbars by default
set guioptions-=T
set guioptions-=m

" Use Ctrl+F3 to toggle gui
" map <silent> <C-F3> :if &guioptions =~# 'T' <Bar>
"         \set guioptions-=T <Bar>
"         \set guioptions-=m <Bar>
"     \else <Bar>
"         \set guioptions+=T <Bar>
"         \set guioptions+=m <Bar>
"     \endif<CR>

" Display trailing tabs and spaces
set list listchars=tab:\ \ ,trail:·

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

" Disable netrw
let g:loaded_netrw = 1
let g:loaded_netrwPlugin = 1

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

" increase/decrease/reset font size
let s:pattern = '^\(.* \)\([1-9][0-9]*\)$'

function! AdjustFontSize(amount)
  if has("gui_gtk2") && has("gui_running")
    let fontname = substitute(&guifont, s:pattern, '\1', '')
    if (a:amount == 0)
      let newfont = fontname . s:regularfontsize
      let &guifont = newfont
    else
      let cursize = substitute(&guifont, s:pattern, '\2', '')
      let newsize = cursize + a:amount
      if (newsize >= s:minfontsize) && (newsize <= s:maxfontsize)
        let newfont = fontname . newsize
        let &guifont = newfont
      endif
    endif
  else
    echoerr "You need to run the GTK2 version of Vim to use this function."
  endif
endfunction

function! LargerFont()
  call AdjustFontSize(1)
endfunction
command! LargerFont call LargerFont()

function! SmallerFont()
  call AdjustFontSize(-1)
endfunction
command! SmallerFont call SmallerFont()

function! DefaultFont()
  call AdjustFontSize(0)
endfunction
command! ResetFont call DefaultFont()

nnoremap <leader>= :LargerFont<CR>
nnoremap <leader>- :SmallerFont<CR>
nnoremap <leader>0 :ResetFont<CR>

autocmd FileType html set shiftwidth=2
autocmd FIleType html set tabstop=2

" -------------------------------------------
" ------------------ Bundles ----------------
" -------------------------------------------
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#rc()

" From vim-scripts
Plugin 'The-NERD-tree'
Plugin 'SingleCompile'
Plugin 'genutils'
Plugin 'Nibble'
" Plugin 'YankRing.vim'
Plugin 'ZoomWin'

Plugin 'gmarik/vundle'
Plugin 'bling/vim-airline'
" PLugin 'Lokaltog/vim-
'

Plugin 'brysgo/quickfixfix'
Plugin 'ecomba/vim-ruby-refactoring'
Plugin 'ervandew/supertab'
Plugin 'terryma/vim-multiple-cursors'
Plugin 'kien/ctrlp.vim'
Plugin 'godlygeek/tabular'
Plugin 'majutsushi/tagbar'
Plugin 'jiangmiao/auto-pairs'
Plugin 'bronson/vim-trailing-whitespace'
Plugin 'abijr/colorpicker'
Plugin 'scrooloose/syntastic'
Plugin 'tpope/vim-commentary'
Plugin 'tpope/vim-endwise'
Plugin 'tpope/vim-fugitive'
Plugin 'tpope/vim-rails'
Plugin 'tpope/vim-repeat'
Plugin 'tpope/vim-sensible'
Plugin 'tpope/vim-surround'
Plugin 'xolox/vim-notes'
Plugin 'xolox/vim-misc'
Plugin 'airblade/vim-gitgutter'
Plugin 'rking/ag.vim'

" Language Specific
Plugin 'vim-ruby/vim-ruby'
" Bundle 'pangloss/vim-javascript'
Plugin 'jelera/vim-javascript-syntax'

" NERDTree
map <F2> :NERDTreeToggle<CR>
map <C-F2> :NERDTree<CR>

" Tagbar
map <F4> :TagbarToggle<CR>

" Powerline
" let g:Powerline_symbols = 'fancy'

" Airline
let g:airline#extensions#tabline#enabled = 1
let g:airline_powerline_fonts = 1

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
map <Leader>a= :Tabularize /=<CR>
map <Leader>a: :Tabularize /:\zs<CR>

" GitGutter
let g:gitgutter_sign_column_always = 1

" YankRing
" nnoremap <silent> <F11> :YRShow<CR>
" let g:yankring_replace_n_pkey = '<C-M>'
