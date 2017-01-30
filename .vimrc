
" This setting prevents vim from emulating the original vi's bugs and limitations.
set nocompatible
" Stop search on begins or ends of file
"set nowrapscan
set ignorecase
set smartcase
" Resalta lo que encontré
set hlsearch
" Will search for text as you enter it
set incsearch
set showmatch
" Permite recorrer la pantalla con el cursor sin parar en el fin de linea, los
" tabs, etc.
"set virtualedit=all
set nobackup
set nowritebackup
set smartindent
"To keep vim from converting eight spaces into tabs
set expandtab
"To automatically indent braces, use
set cindent
"To indent four spaces (instead of one tab of eight spaces, the vim default):
set tabstop=4
set softtabstop=4
set shiftwidth=4
set nu


" Press F2 during insert mode to enable or disable the set paste, when paste code from external non console sources
set pastetoggle=<F2>

" para el javascript indent
let g:js_indent_log = 0

" Only do this part when compiled with support for autocommands.
if has("autocmd")
    " Enable file type detection.
    " Use the default filetype settings, so that mail gets 'tw' set to 72,
    " 'cindent' is on in C files, etc.
    " Also load indent files, to automatically do language-dependent indenting.
    filetype plugin indent on

    " Enable phtml syntax highlight
    " phtml files
    augroup module
        autocmd BufRead,BufNewFile *.mustache set filetype=html.twig
        autocmd BufRead,BufNewFile *.phtml set filetype=phtml
    augroup END

    " Enable twig syntax highlight
    " twig files
    "augroup module
    "    autocmd BufRead,BufNewFile *.twig set filetype=twig
    "augroup END

    " Put these in an autocmd group, so that we can delete them easily.
    augroup vimrcEx
        au!

        " For all text files set 'textwidth' to 78 characters.
        autocmd FileType text setlocal textwidth=78

        " When editing a file, always jump to the last known cursor position.
        " Don't do it when the position is invalid or when inside an event handler
        " (happens when dropping a file on gvim).
        autocmd BufReadPost *
        \ if line("'\"") > 0 && line("'\"") <= line("$") |
        \   exe "normal! g`\"" |
        \ endif

    augroup END
else
    set autoindent    " always set autoindenting on
endif " has("autocmd")

set nowrap

" Folding commands mapping , MAP F9
inoremap <F9> <C-O>za
nnoremap <F9> za
onoremap <F9> <C-C>za
vnoremap <F9> zf
set foldmethod=manual

" Folding and unfolding
map ,f :set foldmethod=indent<cr>zM<cr>
map ,F :set foldmethod=manual<cr>zR<cr>

let mapleader = ","

nnoremap <silent> <Leader>l ml:execute 'match Search /\%'.line('.').'l/'<CR>

set encoding=utf-8
set fileencoding=utf-8

"
" C O L O R S
"
syntax on

hi Search cterm=underline,bold ctermbg=black ctermfg=green

" Vim con 256 colores
"set t_Co=256

" Para elegir entre varios desde el vim
":color <TAB> y completa solo con los que hay disponibles, sino en ~/.vim/colors se ponen los esquemas de colores bajados de Internet

" schema clasico
"colorscheme ron

"color darkblue
"color elflord

color greens


" enable hi current line , and change color
"set cursorline  
"hi CursorLine cterm=NONE ctermbg=black ctermfg=white

"highlight StatusLine ctermfg=black ctermbg=1
" http://vim.wikia.com/wiki/Change_statusline_color_to_show_insert_or_normal_mode

"
" S T A T U S   L I N E
"
" Enable status line always
set laststatus=2
" Remove the status line
"set laststatus=0
"set statusline=%F%m%r%h%w\ (%{&ff}){%Y}[%l,%v][%p%%]\ %{strftime(\"%d/%m/%y\ -\ %H:%M\")}
"set statusline=%<%F%h%m%r%h%w%y\ %{&ff}\ %{strftime(\"%c\",getftime(expand(\"%:p\")))}%=\ lin:%l\,%L\ col:%c%V\ pos:%o\ ascii:%b\ %P
set statusline=%<%F%h%m%r%h%w\ [%Y]\ [%{&ff}]\ %{strftime(\"%d/%m/%Y-%H:%M\")}%=\ col:%c%V\ ascii:%b\ pos:%o\ lin:%l\,%L\ %P


" abro vimdiff desde la terminal, no con diffsplit
if &diff
    "color greens

    "una combinacion de colores
    "highlight DiffAdd cterm=none ctermfg=bg ctermbg=Green gui=none guifg=bg guibg=Green 
    "highlight DiffDelete cterm=none ctermfg=bg ctermbg=Red gui=none guifg=bg guibg=Red 
    "highlight DiffChange cterm=none ctermfg=bg ctermbg=Yellow gui=none guifg=bg guibg=Yellow 
    "highlight DiffText cterm=none ctermfg=bg ctermbg=Magenta gui=none guifg=bg guibg=Magenta 

    ""otra combinacion de colores
    "highlight DiffAdd       cterm=none          ctermbg=darkblue    ctermfg=white
    "highlight DiffChange    cterm=underline     ctermbg=black       ctermfg=red
    "highlight DiffDelete    cterm=none          ctermbg=darkcyan    ctermfg=bg
    "highlight DiffText      cterm=bold          ctermbg=white       ctermfg=red
endif

