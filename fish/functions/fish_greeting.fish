function fish_greeting
    set tip (cat ~/.config/fish/functions/vim_tips.txt)
    set tip_count (count $tip)
    set choice (math (random) \% $tip_count + 1)
    set tipchoice $tip[$choice]
    set IFS '	' 
    echo $tipchoice | read command description ;
    printf '\033[35m'
    printf $command
    printf '\033[39m '
    printf $description
end

