" Courtney Bodi's .vimrc
set nocompatible
filetype off

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

" let Vundle manage Vundle, required
Plugin 'VundleVim/Vundle.vim'

" plugins

call vundle#end()
filetype plugin indent on

" colours
set t_Co=256                    " enable 256 colours
syntax enable                   " enable syntax highlighting

" set colorscheme based on the day of the week
let s:weekday = strftime("%A")
if s:weekday == "Monday"
    colorscheme sorbet256
elseif s:weekday == "Tuesday"
    colorscheme sea256
elseif s:weekday == "Wednesday"
    colorscheme sea256
elseif s:weekday == "Thursday"
    colorscheme ghibli256
elseif s:weekday == "Friday"
    colorscheme ghibli256
elseif s:weekday == "Saturday"
    colorscheme kawaii256
elseif s:weekday == "Sunday"
    colorscheme kawaii256
endif
unlet s:weekday

" tabs
set tabstop=4                   " No. of spaces that <Tab> counts for in file
set softtabstop=4               " No. of spaces that <Tab> counts for when <BS>
set shiftwidth=4                " No. of spaces to use for autoindent
set expandtab                   " Tabs are spaces

" searching
set incsearch                   " search as characters are entered
set hlsearch                    " highlight matches
set ignorecase                  " ignore case when searching

" UI
set number                      " show line numbers
set cursorline                  " so CursorLineNr will be highlighted
set showcmd                     " show current command in bottom bar
set wildmenu                    " visual autocomplete for command menu
set showmatch                   " highlight matching [{()}]
set wrap linebreak nolist       " break lines without breaking words
set listchars=tab:▸\ ,eol:¬,trail:•     " change characters for `:set list`

" windows
set splitright                  " put new buffer to the right of current buffer
set splitbelow                  " put new buffer below current buffer

" miscellaneous
set autowrite                   " write buffer after any next/last commands
set mouse=a                     " enable mouse for window resizing
set backspace=indent,eol,start  " delete functions normally in insert mode
set textwidth=80                " set the textwidth to 80 columns
set colorcolumn=+1,+2           " add a two column colorstrip after textwidth

" open vim help in vertical split window
cabbrev h vert h

" files
filetype on                     " enable file type detection

" ensure tabs are tabs, not spaces, for make files
autocmd FileType make setlocal noet

" set tabs to two spaces and textwidth to 0 for HTML and CSS files
autocmd FileType html setlocal ts=2 sts=2 sw=2 tw=0
autocmd FileType css setlocal ts=2 sts=2 sw=2 tw=0
" tabs are tabs and there is no textwidth for txt files
autocmd FileType txt setlocal noet tw=0

" allow saving of files as sudo when I forget to start vim using sudo
cmap w!! w !sudo tee > /dev/null %

" disable arrow keys
noremap <Up> <Nop>
noremap <Down> <Nop>
noremap <Left> <Nop>
noremap <Right> <Nop>

" function for removing trailing whitespaces using `:Tidy`
fun! TidyWhitespace()
    let l:save_cursor = getpos('.')
    %s/\s\+$//e
    call setpos('.', l:save_cursor)
endfun
command! Tidy call TidyWhitespace()

Bundle 'wakatime/vim-wakatime'
