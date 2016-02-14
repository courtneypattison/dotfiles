# move to trash

function trash
    for arg in $argv
        mv $arg ~/.Trash/
    end
end

