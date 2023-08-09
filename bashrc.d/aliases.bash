eval `dircolors -b`
alias ls='ls --color=auto'

# List only dot files and dot directories
alias lsdot='ls -d $( echo $( ls -a | egrep "^\." ) )'

alias free='free --wide --human'

# 3-month calendar
alias cal3='cal -3'

# Prompt before removing or overwriting a file
alias rm='rm -i'
alias mv='mv -i'
alias cp='cp -i'

# Display ANSI color escape sequences, quit if one screen, disable sending the
# termcap initialization and deinitialization strings
alias less='less -RFX'
alias bat='batcat'

# Create parent dirs and print a message for each created directory
alias mkdir='mkdir -pv'

# https://major.io/icanhazip-com-faq/
alias lsip='curl icanhazip.com'

# Find all code tags
alias codetags='ack -A 5 --color-match=RED --pager="less -RSFX" "TODO|XXX|FIXME|HACK|OMG|LOL"'

# Parameterized ack
alias ack='ack --sort-files --smart-case --color-match=RED --pager="less -RSFX"'

# Audio only MPV
alias aud='mpv --vid=no'

# Check a command run as sudo for alias expansion (courtesy jellingwood)
# From the bash manual:
#   > If the last character of the alias value is a blank, then the next
#   > command word following the alias is also checked for alias expansion.
alias sudo='sudo '

alias pretty='jq . | pager'
alias yt-dlp='yt-dlp --add-metadata --format bestvideo[ext=mp4]+bestaudio[ext=m4a]/bv*+ba/b'
# alias yt-dlp='yt-dlp --add-metadata --write-info-json --write-description --write-thumbnail --write-sub --format bestvideo[ext=mp4]+bestaudio[ext=m4a]/bv*+ba/b'
