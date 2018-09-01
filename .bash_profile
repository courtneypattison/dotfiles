PATH=$PATH:$HOME/bin:$HOME/Library/Python/2.7/bin/:$HOME/Repositories/grt-next-ride

function gitbranch()
{
    git branch 2>/dev/null| grep '\* '| sed 's/\* \(.*\)/\[\1\]/'
}

export CLICOLOR=1                               # adds colours to lists
export PS1='\[\e[0;36m\]\w\[\e[0;33m\[\e[0m\]🐈  ' 

alias grep="grep --color=auto"                  # adds colour to grep
alias mv="mv -i"                                # adds check before overwriting
alias gcc="gcc -Wall -pedantic -std=c99"        # adds a few flags to gcc

# use tr command to move to trash
function tr () {
  local path
  for path in "$@"; do
    # ignore any arguments
    if [[ "$path" = -* ]]; then :
    else
      # remove trailing slash
      local mindtrailingslash=${path%/}
      # remove preceding directory path
      local dst=${mindtrailingslash##*/}
      # append the time if necessary
      while [ -e ~/.Trash/"$dst" ]; do
        dst="`expr "$dst" : '\(.*\)\.[^.]*'` `date +%H-%M-%S`.`expr "$dst" : '.*\.\([^.]*\)'`"
      done
      mv "$path" ~/.Trash/"$dst"
    fi
  done
}

eval "$(rbenv init -)"
