" Colors
colorscheme kawaii256
syntax enable                   " Enable syntax highlighting
        
set tabstop=4                   " No. of spaces that <Tab> counts for in file
set softtabstop=4               " No. of spaces that <Tab> counts for when <BS> 
set shiftwidth=4                " No. of spaces to use for autoindent 
set expandtab                   " Tabs are spaces
" Set tabstop, softtabstop and shiftwidth to the same value
command! -nargs=* Stab call Stab()
function! Stab()
  let l:tabstop = 1 * input('set tabstop = softtabstop = shiftwidth = ')
  if l:tabstop > 0
    let &l:sts = l:tabstop
    let &l:ts = l:tabstop
    let &l:sw = l:tabstop
  endif
  call SummarizeTabs()
endfunction

function! SummarizeTabs()
  try
    echohl ModeMsg
    echon 'tabstop='.&l:ts
    echon ' shiftwidth='.&l:sw
    echon ' softtabstop='.&l:sts
  finally
    echohl None
  endtry
endfunction

" UI Config
set number                      " Show line numbers
set showcmd                     " Show command in bottom bar
set wildmenu                    " Visual autocomplete for command menu
set showmatch                   " Highlight matching [{()}]
set wrap linebreak nolist       " Break lines without breaking words
" Change background color after 80 columns (requires colourcolumn in colorscheme)
let &colorcolumn=join(range(81,999),",")
set listchars=tab:▸\ ,trail:-

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
