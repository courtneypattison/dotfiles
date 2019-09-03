export CLICOLOR=1                               # adds colours to lists
export PS1='\[\e[0;36m\]\w\[\e[0;33m\[\e[0m\]🐈  ' 

alias grep="grep --color=auto"                  # adds colour to grep
alias mv="mv -i"                                # adds check before overwriting
alias gcc="gcc -Wall -pedantic"        # adds a few flags to gcc

# use trash command to move to trash
function trash () {
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

export ANDROID_HOME="$HOME/Library/Android/sdk"
export GO_PATH="$HOME/go"
export PYTHON_PATH="/usr/local/opt/python"
export PATH="$ANDROID_HOME/emulator:$ANDROID_HOME/platform-tools:$ANDROID_HOME/tools:$GO_PATH/bin:$PYTHON_PATH/libexec/bin:$(npm bin -g):$PATH"

ulimit -n 8096
export PATH="/usr/local/opt/node@10/bin:$PATH"
