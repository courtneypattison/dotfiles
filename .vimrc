" Courtney Bodi's .vimrc

" --- Colors ----------------------------------------------------------------- "
set t_Co=256                    " Enable 256 colours
colorscheme kawaii256           " Set colorscheme
syntax enable                   " Enable syntax highlighting

" --- Tabs ------------------------------------------------------------------- "
set tabstop=4                   " No. of spaces that <Tab> counts for in file
set softtabstop=4               " No. of spaces that <Tab> counts for when <BS>
set shiftwidth=4                " No. of spaces to use for autoindent
set expandtab                   " Tabs are spaces

" --- Searching -------------------------------------------------------------- "
set incsearch                   " Search as characters are entered
set hlsearch                    " Highlight matches
set ignorecase                  " Ignore case when searching

" --- UI --------------------------------------------------------------------- "
set number                      " Show line numbers
set showcmd                     " Show current command in bottom bar
set wildmenu                    " Visual autocomplete for command menu
set showmatch                   " Highlight matching [{()}]
set wrap linebreak nolist       " Break lines without breaking words
set listchars=tab:▸\ ,eol:¬     " Change tab and EOL characters for `:set list`

" Change background color after 80 columns (requires colorcolumn in colorscheme)
let &colorcolumn=join(range(81,999),",")

" --- Windows ---------------------------------------------------------------- "
set splitright                  " Put new buffer to the right of current buffer
set splitbelow                  " Put new buffer below current buffer

" Open vim help in vertical split window
cabbrev h vert h

" --- Buffers ---------------------------------------------------------------- "
set autowrite                   " Write buffer after any next/last commands

" --- Files ------------------------------------------------------------------ "
filetype on                     " Enable file type detection

" Ensure tabs are tabs, not spaces, for make files
autocmd FileType make setlocal noexpandtab

" Set tabs to two spaces for HTML and CSS files
autocmd FileType html setlocal ts=2 sts=2 sw=2
autocmd FileType css setlocal ts=2 sts=2 sw=2

" --- Miscellaneous ---------------------------------------------------------- "
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

