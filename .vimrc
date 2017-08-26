" Show console
map ! :!<CR>

" Enable features from vim
set nocompatible

" Automatically reload .vimrc
autocmd! bufwritepost .vimrc source %

" Sets how many lines of history VIM has to remember
set history=1000
set undolevels=1000

" Enable filetype plugins
filetype plugin on
filetype indent on

" Run script
map <F2> :w<CR>:!./%<CR>

" Set to auto read when a file is changed from the outside
set autoread

" Change paste mode (pt)
set pastetoggle=<F10>

" Enable colors
set t_Co=256

" Saving & exiting
map QQ :q!

" With a map leader it's possible to do extra key combinations
let mapleader = ","
let g:mapleader = ","

" Turn on the WiLd menu (wmnu)
set wildmenu

" Ignore compiled files
set wildignore=*.o,*~,*.pyc

"Always show current position (ru, nu, so)
set ruler
set number
set scrolloff=4

" Searching (ic, scs, hls, is)
set ignorecase
set smartcase
set hlsearch
set incsearch

" Enable syntax highlighting (syn)
syntax enable

" Set utf8 as standard encoding and en_US as the standard language
set encoding=utf8

" Use Unix as the standard file type (ffs)
set fileformats=unix,dos,mac

" Turn backup off, since most stuff is in SVN, git et.c anyway... (bk, wb, swf)
set nobackup
set writebackup
set noswapfile

" Tab -> 4 spaces (et, sta, sw, ts)
set expandtab
set smarttab
set shiftwidth=4
set tabstop=4

" Set indent (ai, si, wrap)
set autoindent
set smartindent
set nowrap

" Treat long lines as break lines (useful when moving around in them)
map j gj
map k gk

" Disable highlight when <leader><cr> is pressed
map <silent> <leader><cr> :noh<cr>

" Smart way to move between windows
map <C-j> <C-W>j
map <C-k> <C-W>k
map <C-h> <C-W>h
map <C-l> <C-W>l

" (spr, sb)
set splitright
set splitbelow

" Underline current line and 80. column (cul, bg, ?, cc)
set cursorline
set background=dark
hi ColorColumn ctermbg=darkgrey
set colorcolumn=80

" Useful mappings for managing tabs
map <leader>tn :tabnew<cr>
map <leader>to :tabonly<cr>
map <leader>tc :tabclose<cr>
map <leader>tm :tabmove
map <leader>n <esc>:tabprevious<CR>
map <leader>m <esc>:tabnext<CR>

" Return to last edit position when opening files
autocmd BufReadPost *
     \ if line("'\"") > 0 && line("'\"") <= line("$") |
     \   exe "normal! g`\"" |
     \ endif

" Always show the status line
set laststatus=2

" Move a line of text using <Right Alt>+[jk]
nmap ə mz:m+<cr>`z
nmap … mz:m-2<cr>`z
vmap ə :m'>+<cr>`<my`>mzgv`yo`z
vmap … :m'<-2<cr>`>my`<mzgv`yo`z


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Spell checking
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Pressing ,ss will toggle and untoggle spell checking
map <leader>ss :setlocal spell!<cr>

" Shortcuts using <leader>
map <leader>sn ]s
map <leader>sp [s
map <leader>sa zg
map <leader>s? z=


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Plugins
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
call plug#begin('~/.vim/plugged')

Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'scrooloose/nerdcommenter'
Plug 'scrooloose/nerdtree'
Plug 'Xuyuanp/nerdtree-git-plugin'
Plug 'airblade/vim-gitgutter'
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-surround'
"Plug 'klen/python-mode'
Plug 'fatih/vim-go'
Plug 'dodie/vim-disapprove-deep-indentation'
Plug 'leafgarland/typescript-vim'
Plug 'ctrlpvim/ctrlp.vim'
Plug 'mxw/vim-jsx'
Plug 'c.vim'
Plug 'adimit/prolog.vim'

call plug#end()

" vim-airline
let g:airline_theme='wombat'
let g:airline#extensions#tabline#enabled = 1
let g:airline_left_sep = '▸'
let g:airline_right_sep = '◂'

let g:airline_section_z = '%b 0x%B :%3p%% %#__accent_bold#%{g:airline_symbols.linenr}%#__accent_bold#%4l%#__restore__#%#__restore__#%#__accent_bold#%#__accent_bold#/%L%{g:airline_symbols.maxlinenr} %#__restore__#%#__restore__# :%3v'

" nerdtree
autocmd vimenter * NERDTree
map <C-n> :NERDTreeToggle<CR><C-w>l
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif
autocmd VimEnter * wincmd p

" python-mode
"let g:pymode_rope_goto_definition_bind = "<Leader>g"
"set completeopt=longest,menuone
"function! OmniPopup(action)
"    if pumvisible()
"        if a:action == 'j'
"            return "\<C-N>"
"        elseif a:action == 'k'
"            return "\<C-P>"
"        endif
"    endif
"    return a:action
"endfunction

inoremap <silent><C-j> <C-R>=OmniPopup('j')<CR>
inoremap <silent><C-k> <C-R>=OmniPopup('k')<CR>

" dodie/vim-disapprove-deep-indentation
let g:LookOfDisapprovalTabTreshold=5
let g:LookOfDisapprovalSpaceTreshold=(&tabstop*5)

" jsx
let g:jsx_ext_required = 0 " Allow JSX in normal JS files
let g:syntastic_javascript_checkers = ['eslint']
