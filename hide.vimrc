set autoindent          "automatyczne wciecia
set smartindent

syntax on               "skladnia podswietlana

set ruler               "pokazywanie polozenia kursora
set number

set history=50          "vim pamieta 50 ostatnich wyszukiwan

set showcmd             "pokazuje wpisywane polecenia

set nocompatible        "niekompatybilny z Vi

set background=dark

set ff=unix             "unixowy koniec linii

filetype on
filetype plugin on

let g:neocomplcache_enable_at_startup = 1

"maps
map Q :q!<CR>
map W :w!<CR>
map <F2> :!python %<CR>

"Pathogen load
filetype off
"call pathogen#infect()
"call pathogen#helptags()
filetype plugin indent on
syntax on


autocmd! bufwritepost .vimrc source %
" Automatycznie przeładowywuje plik .vimrc.

set pastetoggle=<F2>
set clipboard=unnamed
" Lepsze kopiowanie/wklejanie, jeżeli masz do wklejenia jakiś duży blok tekstu. Przechodzisz do trybu insert, wciskasz <F2> i wklejasz tekst.

set bs=2
set mouse=a
" Ustawia normalną obsługę backspace oraz włącza obsługę myszki.

let mapleader = ","
" Binduje <Leader> do klawisza "," . Później zobaczysz do czego może się przydać.

noremap <C-n> :nohl<CR>
vnoremap <C-n> :nohl<CR>
inoremap <C-n> :nohl<CR>
" Jeżeli wyszukałeś jakąś frazę, to vim ją podkreślił, jeśli chcesz pozbyć się podświetlenia wciśnij CTRL+n.

noremap <C-Z> :update<CR>
vnoremap <C-Z> <C-C>:update<CR>
inoremap <C-Z> <C-O>:update<CR>
" Szybki zapis pliku, CTRL+z. 

map <c-j> <c-w>j
map <c-k> <c-w>k
map <c-l> <c-w>l
map <c-h> <c-w>h
" Służy do wygodniejszego poruszania się po okienkach. Zamiast wciskania CTRL+w, a później h/j/k/l, wciskasz sobie CTRL+h/j/k/l.

map <Leader>n <esc>:tabprevious<CR>
map <Leader>m <esc>:tabnext<CR>
" Wygodniejsze przemieszczanie się po zakładkach. ",n" (wcześniejsza), ",m" (następna).

set colorcolumn=80
highlight ColorColumn ctermbg=233
" linia w kolorze szarym

set tabstop=4
set softtabstop=4
set shiftwidth=4
set shiftround
set expandtab
" W wielkim skrócie, używa tylko i wyłącznie spacji, zero tabów. Jak gdzieś użyjesz taba to ci go zamieni na cztery spacje, dziękuję.

set hlsearch
set incsearch
set ignorecase
set smartcase
" Podświetla znalezioną frazę podczas szukania i rozróżnia znaki ("oink" to nie to samo co "OinK").

set nobackup
set nowritebackup
set noswapfile
" Wyłącza pliki backup oraz swap. Nie są Ci do niczego potrzebne, a jak pracujesz z gitem czy mercurialem to tym bardziej.
