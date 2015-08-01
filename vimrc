" Automatycznie przeladowywuje plik .vimrc.
autocmd! bufwritepost .vimrc source %

" automatyczne wciecia
set autoindent
set smartindent

" skladnia podswietlana
syntax on

" pokazywanie polozenia kursora
set ruler
set number

" nie lamie lini
set nowrap

" vim pamieta 1000 ostatnich wyszukiwan i cofa do 1000
set history=1000
set undolevels=1000

" pokazuje wpisywane polecenia
set showcmd

" niekompatybilny z Vi
set nocompatible

" ciemne tlo, jasny font
set background=dark

" unixowy koniec linii
set ff=unix

" maps
map QQ :q!<CR>
map W :w!<CR>

" Binduje <Leader> do klawisza ','
let mapleader = ","

" Jezeli wyszukales jakas fraze, to vim ja podkreslil, jesli chcesz pozbyć sie podswietlenia wcisnij CTRL+n.
noremap <C-n> :nohl<CR>
vnoremap <C-n> :nohl<CR>
inoremap <C-n> :nehl<CR>


" Szybki zapis pliku, CTRL+z. 
noremap <C-Z> :update<CR>
vnoremap <C-Z> <C-C>:update<CR>
inoremap <C-Z> <C-O>:update<CR>

" Sluzy do wygodniejszego poruszania sie po okienkach. Zamiast wciskania CTRL+w, a poźniej h/j/k/l, wciskasz sobie CTRL+h/j/k/l.
map <c-j> <c-w>j
map <c-k> <c-w>k
map <c-l> <c-w>l
map <c-h> <c-w>h

" Wygodniejsze przemieszczanie sie po zakladkach. ",n" (wczesniejsza), ",m" (nastepna).
map <Leader>n <esc>:tabprevious<CR>
map <Leader>m <esc>:tabnext<CR>

" Linia 80. w kolorze szarym
set colorcolumn=80
highlight ColorColumn ctermbg=233
set tw=79

" Uzywa tylko i wylacznie spacji, zero tabow.
set tabstop=4
set softtabstop=4
set shiftwidth=4
set shiftround
set expandtab

" Podswietla znaleziona fraze podczas szukania i rozroznia znaki.
" Podswietla znaleziona fraze podczas szukania i rozroznia znaki" Podswietla znaleziona fraze podczas szukania i rozroznia znaki" Podswietla znaleziona fraze podczas szukania i rozroznia znaki" Podswietla znaleziona fraze podczas szukania i rozroznia znaki" Podswietla znaleziona fraze podczas szukania i rozroznia znaki" Podswietla znaleziona fraze podczas szukania i rozroznia znaki" Podswietla znaleziona fraze podczas szukania i rozroznia znaki
set hlsearch
set incsearch
set ignorecase
set smartcase

" Wylacza pliki backup oraz swap.
set nobackup
set nowritebackup
set noswapfile

" Dzieli z prawej i z gory
set splitright
set splitbelow


" vim-plug
call plug#begin('~/.vim/plugged')

Plug 'bling/vim-airline'

Plug 'kien/ctrlp.vim'

Plug 'scrooloose/nerdtree'

Plug 'klen/python-mode'

Plug 'scrooloose/nerdcommenter'

call plug#end()

" nerdtree
autocmd vimenter * NERDTree
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTreeType") && b:NERDTreeType == "primary") | q | endif

" python-mode
let g:pymode_run_bind = "<F5>"
let g:pymode_rope_goto_definition_bind = "<Leader>g"
set completeopt=longest,menuone
function! OmniPopup(action)
    if pumvisible()
        if a:action == 'j'
            return "\<C-N>"
        elseif a:action == 'k'
            return "\<C-P>"
        endif
    endif
    return a:action
endfunction

inoremap <silent><C-j> <C-R>=OmniPopup('j')<CR>
inoremap <silent><C-k> <C-R>=OmniPopup('k')<CR>
