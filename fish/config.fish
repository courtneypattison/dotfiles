set -g -x PATH /usr/local/bin $PATH
set fish_key_bindings fish_vi_key_bindings
set fish_greeting

alias mv "mv -i"

function tr
    for arg in $argv
        mv $arg ~/.Trash/
    end
end

