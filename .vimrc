" Colors
colorscheme kawaii256
syntax enable                   " Enable syntax highlighting

" Spaces and Tabs
set tabstop=4                   " Number of visual spaces per TAB
set softtabstop=4               " Number of spaces in tab when editing
set shiftwidth=4                " Indent by 4 spaces when using >>, <<, == etc.
set expandtab                   " Tabs are spaces

" UI Config
set number                      " Show line numbers
set showcmd                     " Show command in bottom bar
set wildmenu                    " Visual autocomplete for command menu
set showmatch                   " Highlight matching [{()}]
set wrap linebreak nolist       " Break lines without breaking words
" Change background color after 80 columns (requires colourcolumn in colorscheme)
let &colorcolumn=join(range(81,999),",")
set list                        " Displays unprintable characters
set listchars=trail:១           " Displays ១ for trailing characters

" Searching
set incsearch                   " Search as characters are entered
set hlsearch                    " Highlight matches
set ignorecase                  " Ignore case when searching

" Allow saving of files as sudo when I forget to start vim using sudo
cmap w!! w !sudo tee > /dev/null %

" Disable arrow keys
noremap <Up> <Nop>
noremap <Down> <Nop>
noremap <Left> <Nop>
noremap <Right> <Nop>
