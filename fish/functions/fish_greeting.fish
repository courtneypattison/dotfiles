function fish_greeting
    set tip '\033[35m<C-o>\033[39m Switch to Insert Normal mode - Visual'\
            '\033[35m<C-u>\033[39m Delete back to start of line - Visual'\
            '\033[35m<C-w>\033[39m Delete back one word - Visual'\
            '\033[35m<C-r>\033[39m Paste from register - Visual'\
            '\033[35m<C-r>=\033[39m Opens a prompt for an expression - Visual'\
            '\033[35m<C-a>\033[39m Performs addition on number at or after cursor'\
            '\033[35m<C-x>\033[39m Performs subtraction on number at or after cursor'\
            '\033[35ms\033[39m Delete character and start insert'\
            '\033[35mg~\033[39m Swap case'\
            '\033[35m=\033[39m Autoindent'\
            '\033[35m.\033[39m Repeat last change'\
            '\033[35m;\033[39m Repeat latest f, t, F, or T'\
            '\033[35m,\033[39m Repeat latest f, t, F, or T in opposite direction'\
            '\033[35m@x\033[39m Repeat a sequence of changes'\
            '\033[35mqx{changes}q\033[39m execute a sequence of changes'\
            '\033[35mgu\033[39m Make lowercase'\
            '\033[35mgU\033[39m Make uppercase'\
            '\033[35mdb\033[39m Delete from cursor\'s position to beginning of word'\
            '\033[35m*\033[39m Search for the next occurance word under the cursor'
    set tip_count (count $tip)
    set choice (math (random) \% $tip_count + 1)

    printf $tip[$choice]
end

