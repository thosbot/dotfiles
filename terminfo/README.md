# TERMINFO

Add escape sequences for italic, and overwrite conflicting sequences for
standout text.

```sh
# Compile
tic -o ~/.terminfo tmux.terminfo.txt

# Test
echo `tput sitm`italics`tput ritm` `tput smso`standout`tput rmso`
```

## Source

- [Vim screencast #22: Italics](https://www.youtube.com/watch?v=n1cKtZfwOgQ&list=PLwJS-G75vM7kFO-yUkyNphxSIdbi_1NKX&t=17s)
- [wincent "dotfiles" and system configuration](https://github.com/wincent/wincent)
- [Apple SE: How to show italic in vim in iTerm2](https://apple.stackexchange.com/questions/266333/how-to-show-italic-in-vim-in-iterm2)
