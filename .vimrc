" mliscourtney's .vimrc

set nocompatible              " be iMproved, required
filetype off                  " required

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

" let Vundle manage Vundle, required
Plugin 'VundleVim/Vundle.vim'

" plugins
Plugin 'tpope/vim-commentary'
Plugin 'tpope/vim-surround'
Plugin 'tpope/vim-ragtag'
Plugin 'wakatime/vim-wakatime'
" Plugin 'sheerun/vim-polyglot'

" All of your Plugins must be added before the following line
call vundle#end()            " required
filetype plugin indent on    " required
"
" Brief help
" :PluginList       - lists configured plugins
" :PluginInstall    - installs plugins; append `!` to update or just :PluginUpdate
" :PluginSearch foo - searches for foo; append `!` to refresh local cache
" :PluginClean      - confirms removal of unused plugins; append `!` to auto-approve removal
"
" see :h vundle for more details or wiki for FAQ

" colours
set t_Co=256                    " enable 256 colours
syntax enable                   " enable syntax highlighting
colorscheme forest256

" tabs
set tabstop=4                   " no. of spaces that <Tab> counts for in file
set softtabstop=4               " no. of spaces that <Tab> counts for when <BS>
set shiftwidth=4                " no. of spaces to use for autoindent
set expandtab                   " tabs are spaces

" searching
set incsearch                   " search as characters are entered
set hlsearch                    " highlight matches
set ignorecase                  " ignore case when searching
set smartcase                   " search becomes sensitive with capitals 

" UI
set number                      " show line numbers
set cursorline                  " so CursorLineNr will be highlighted
set showcmd                     " show current command in bottom bar
set wildmenu                    " visual autocomplete for command menu
set showmatch                   " highlight matching [{()}]
set wrap linebreak nolist       " break lines without breaking words
set laststatus=2                " always show status line
set listchars=tab:▸\ ,eol:¬,trail:•     " change characters for `:set list`
let &colorcolumn="81,82"        " add a two column colorstrip after 80 characters

" windows
set splitright                  " put new buffer to the right of current buffer
set splitbelow                  " put new buffer below current buffer

" miscellaneous
set autowrite                   " write buffer after any next/last commands
set backspace=indent,eol,start  " return works normally in insert mode
set mouse=a                     " enable mouse for window resizing
set nrformats=                  " treat numbers as decimals, not octals
set history=200                 " record last 200 commands
set suffixesadd+=.h             " add file extension to paths when using gf

" ensure tabs are tabs, not spaces, for make files
autocmd FileType make setlocal noet list

" set tabs to two spaces and textwidth to 0 for HTML and CSS files
autocmd FileType html setlocal ts=2 sts=2 sw=2
autocmd FileType css setlocal ts=2 sts=2 sw=2 tw=0

" tabs are tabs for txt files
autocmd FileType text setlocal noet

" open vim help in vertical split window
cabbrev h vert h

" enable matchit plugin
runtime macros/matchit.vim

" %% in command line prompt expands to path of active buffer
cnoremap <expr> %% getcmdtype() == ':' ? expand('%:h').'/' : '%%'

" allow saving of files as sudo when I forget to start vim using sudo
cmap w!! w !sudo tee > /dev/null %

" mute search highlighting with <C-l>
nnoremap <silent> <C-l> :<C-u>nohlsearch<CR><C-l>

" mappings to quickly traverse lists
nnoremap <silent> [b :bprevious<CR>
nnoremap <silent> ]b :bnext<CR>
nnoremap <silent> [B :bfirst<CR>
nnoremap <silent> ]B :blast<CR>

" function for removing trailing whitespaces using `:Tidy`
fun! TidyWhitespace()
    let l:save_cursor = getpos('.')
    %s/\s\+$//e
    call setpos('.', l:save_cursor)
endfun
command! Tidy call TidyWhitespace()

