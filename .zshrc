PROMPT='%F{139}%1d/%f🐝🐈 '

# Turn off all beeps
unsetopt BEEP

# case insensitive path-completion
zstyle ':completion:*' matcher-list 'm:{a-z}={A-Za-z}'

autoload -Uz compinit && compinit

# python
export PATH=/usr/local/share/python:$PATH

# virtualenv
export WORKON_HOME=$HOME/.virtualenvs
export VIRTUALENVWRAPPER_PYTHON=/opt/homebrew/bin/python3
export VIRTUALENVWRAPPER_VIRTUALENV=/opt/homebrew/bin/virtualenv
source /opt/homebrew/bin/virtualenvwrapper.sh

# Go
export GOPATH=$HOME/go
export PATH=$PATH:$GOPATH/bin
ulimit -n 8096
export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion

function init-ts {
  yarn init
  yarn add @types/node typescript 
  yarn add -D ts-node
  yarn tsc --init --rootDir src --outDir ./bin --esModuleInterop --lib ES2019 --module commonjs --noImplicitAny true
  mkdir src
  echo "console.log('Hello World\!')" > src/index.ts
  npmAddScript -k build -v "tsc"
  npmAddScript -k start -v "node ./bin/index.js"
  npmAddScript -k dev -v "ts-node ./src/index.ts"
}
