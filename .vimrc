" ------------------------------- Vundle ------------------------------
" set up vundle
set nocompatible              " required
filetype off                  " required

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

" add all your plugins here (note older versions of Vundle
" used Bundle instead of Plugin)

" let Vundle manage Vundle, required
Plugin 'gmarik/Vundle.vim'
Bundle 'Valloric/YouCompleteMe'
Plugin 'vim-syntastic/syntastic'
Plugin 'nvie/vim-flake8'
Plugin 'scrooloose/nerdtree'
Plugin 'ctrlpvim/ctrlp.vim'
Plugin 'vim-airline/vim-airline'
Plugin 'tpope/vim-fugitive'
Plugin 'scrooloose/nerdcommenter'
Plugin 'altercation/vim-colors-solarized'

" All of your Plugins must be added before the following line
call vundle#end()            " required
filetype plugin indent on    " required
" ---------------------------------------------------------------------

" ------------------------- Plugin cusomisation -----------------------
" YouCompleteMe
let g:ycm_autoclose_preview_window_after_completion=1
let g:ycm_global_ycm_extra_conf = '/home/philipp/.vim/bundle/YouCompleteMe/third_party/ycmd/.ycm_extra_conf.py'

" Nerdtree
let NERDTreeMapOpenInTab='<Return>' " let nerdtree open file in new tab
let NERDTreeShowHidden=1 " let nerdtree show dotfiles also
autocmd vimenter * NERDTree " start NerdTree on vim start
autocmd VimEnter * wincmd p "focus file on start
autocmd BufEnter * lcd %:p:h " set wd to current files path

" syntastic
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*

let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0

" ctrlp
let g:ctrlp_show_hidden = 1

" solarized
syntax enable
set background=dark
colorscheme solarized
" ---------------------------------------------------------------------
" ------------------------------- General ----------------------------
set encoding=utf-8
" --------------------------------------------------------------------
" ------------------------------- Mapping -----------------------------
" saving and stuff
nnoremap <S-e> :q <Enter>
nnoremap <S-w> :w <Enter>
nnoremap <S-q> :qa <Enter>

" switch tabs
nnoremap t gt
nnoremap T gT
nnoremap gt <Nop>
nnoremap gT <Nop>

" move lines
nnoremap <C-j> :m .+1<CR>==
nnoremap <C-k> :m .-2<CR>==
inoremap <C-j> <Esc>:m .+1<CR>==gi
inoremap <C-k> <Esc>:m .-2<CR>==gi
vnoremap <C-j> :m '>+1<CR>gv=gv
vnoremap <C-k> :m '<-2<CR>gv=gv

" enter new line
nnoremap o o<Esc>
nnoremap O O<Esc>

" ---------------------------------------------------------------------
" ------------------------- Custom commands ---------------------------
command! -complete=file -nargs=1 Remove :echo 'Remove: '.'<f-args>'.' '.(delete(<f-args>) == 0 ? 'SUCCEEDED' : 'FAILED')
command! Removethis :call delete(expand('%')) | bdelete! | :q
" ---------------------------------------------------------------------
set ruler               " show line and column number
set number              " show line number
set showcmd             " show (partial) command in status line
set splitbelow " set, where spilted window should appear
syntax on
let python_highlight_all=1
set autochdir "automatically change pwd

" Enable folding
set foldmethod=indent
set foldlevel=99
" Enable folding with shift
nnoremap <S-f> za

"Flagging Unnecessary Whitespace
highlight BadWhitespace ctermbg=red guibg=red
match BadWhitespace /\s\+$/

" ----------------------------- Navigation -----------------------------
" Clear arrow Keys
noremap <Up> <Nop>
noremap <Down> <Nop>
noremap <Left> <Nop>
noremap <Right> <Nop>

"split navigations
nnoremap <S-J> <C-W><C-J>
nnoremap <S-K> <C-W><C-K>
nnoremap <S-L> <C-W><C-L>
nnoremap <S-H> <C-W><C-H>
" ----------------------------------------------------------------------

" ------------------------------- Design -------------------------------
" ----------------------------------------------------------------------

" -------------------------- Language specific -------------------------
au BufNewFile,BufRead *.py,*.c
    \ set tabstop=4 |
    \ set softtabstop=4 |
    \ set shiftwidth=4 |
"    \ set textwidth=79 |
    \ set expandtab |
    \ set autoindent |
    \ set fileformat=unix |

" ---------------------------------------------------------------------

