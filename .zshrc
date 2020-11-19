PROMPT='%F{139}%1d/%f🐈 '

# Turn off all beeps
unsetopt BEEP

# case insensitive path-completion
zstyle ':completion:*' matcher-list 'm:{a-z}={A-Za-z}'

autoload -Uz compinit && compinit

function node-project {
  git init
  npx license $(yarn config get init-license) --name "Courtney Pattison"
  npx gitignore node
  yarn init -y
  git add -A && git commit -m "Initial commit"
}