PATH=$PATH:$HOME/bin                            # adds ~/bin to the PATH variable

export CLICOLOR=1                               # adds colours to lists
export PS1="\h:\[\e[0;36m\]\W\[\e[0m\] \u$ "    # adds colour to command prompt

alias grep="grep --color=auto"                  # adds colour to grep
alias mv="mv -i"                                # adds check before overwriting

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
