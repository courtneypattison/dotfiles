function fish_greeting
    set tip '\033[35m<C-o>\033[39m Switch to Insert Normal mode'\
            '\033[35m<C-u>\033[39m Delete back to start of line'\
            '\033[35ms\033[39m Delete character and start insert'\
            '\033[35m*\033[39m Search for the next occurance of the word under the cursor'
    set tip_count (count $tip)
    set choice (math (random) \% $tip_count + 1)

    printf $tip[$choice]
end
