eval `dircolors -b`
alias ls='ls --color=auto'

# List only dot files and dot directories
alias lsd='ls -d $( echo $( ls -a | egrep "^\." ) )'

# List directories
function lsdir () {
    ls -d ${1}*
}

alias free='free -h'

# 3-month calendar
alias cal3='cal -3'

# rm and mv aliases
alias rm='rm -i'
alias mv='mv -i'
alias cp='cp -i'

alias less='less -RFX'

# Create parents and print each created directory
alias mkdir='mkdir -pv'

# https://major.io/icanhazip-com-faq/
alias lsip='curl icanhazip.com'

alias lscodetags='ack -A 5 --color-match=RED --pager="less -RFX" "TODO|XXX|FIXME|HACK|OMG|LOL"'

# todo.sh
source $HOME/.config/todo/todo_completion
alias todo='todo -tn -d $HOME/.config/todo/todo.cfg'

# Parameterized ack
alias gack='ack --sort-files --smart-case --color-match=RED --pager="less -RFX"'

# Better directory traversing
source ~/.config/up/up.sh
