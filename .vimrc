" Courtney Bodi's .vimrc

" Colours
set t_Co=256                    " Enable 256 colours
colorscheme sea256              " Set colorscheme
syntax enable                   " Enable syntax highlighting

" Tabs
set tabstop=4                   " No. of spaces that <Tab> counts for in file
set softtabstop=4               " No. of spaces that <Tab> counts for when <BS>
set shiftwidth=4                " No. of spaces to use for autoindent
set expandtab                   " Tabs are spaces

" Searching
set incsearch                   " Search as characters are entered
set hlsearch                    " Highlight matches
set ignorecase                  " Ignore case when searching

" UI
set number                      " Show line numbers
set cursorline                  " So CursorLineNr will be highlighted
set showcmd                     " Show current command in bottom bar
set wildmenu                    " Visual autocomplete for command menu
set showmatch                   " Highlight matching [{()}]
set wrap linebreak nolist       " Break lines without breaking words
set listchars=tab:▸\ ,eol:¬,trail:•     " Change characters for `:set list`

" Windows
set splitright                  " Put new buffer to the right of current buffer
set splitbelow                  " Put new buffer below current buffer

" Miscellaneous
set autowrite                   " Write buffer after any next/last commands
set mouse=a                     " Enable mouse for window resizing
set backspace=indent,eol,start  " Delete functions normally in insert mode
set textwidth=80                " Set the textwidth to 80 columns
set colorcolumn=+1,+2           " Add a two column colorstrip after textwidth

" Open vim help in vertical split window
cabbrev h vert h

" Files
filetype on                     " Enable file type detection

" Ensure tabs are tabs, not spaces, for make files
autocmd FileType make setlocal noexpandtab

" Set tabs to two spaces and textwidth to 0 for HTML and CSS files
autocmd FileType html setlocal ts=2 sts=2 sw=2 tw=0
autocmd FileType css setlocal ts=2 sts=2 sw=2 tw=0

" Set colorscheme based on the day of the week
let s:weekday = strftime("%A")
if s:weekday == "Monday"
    colorscheme kawaii256
elseif s:weekday == "Tuesday"
    colorscheme sorbet256
elseif s:weekday == "Wednesday"
    colorscheme sea256
elseif s:weekday == "Thursday"
    colorscheme kawaii256
elseif s:weekday == "Friday"
    colorscheme sorbet256
elseif s:weekday == "Saturday"
    colorscheme sea256
elseif s:weekday == "Sunday"
    colorscheme kawaii256
endif
unlet s:weekday

" Allow saving of files as sudo when I forget to start vim using sudo
cmap w!! w !sudo tee > /dev/null %

" Disable arrow keys
noremap <Up> <Nop>
noremap <Down> <Nop>
noremap <Left> <Nop>
noremap <Right> <Nop>

" Function for removing trailing whitespaces using `:Tidy`
fun! TidyWhitespace()
    let l:save_cursor = getpos('.')
    %s/\s\+$//e
    call setpos('.', l:save_cursor)
endfun
command! Tidy call TidyWhitespace()

