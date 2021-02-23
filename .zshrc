PROMPT='%F{139}%1d/%f🐈 '

# Turn off all beeps
unsetopt BEEP

# case insensitive path-completion
zstyle ':completion:*' matcher-list 'm:{a-z}={A-Za-z}'

autoload -Uz compinit && compinit