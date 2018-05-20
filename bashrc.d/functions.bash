function bg-run() {
    cmd=$1; shift
    $cmd "$@" >/tmp/$cmd.out 2>/tmp/$cmd.err &
}

# Syntax highlighting in the terminal
function lesscode {
    filename=$1
    filetype=$2

    if [ "$filetype" ]; then
        highlight -O xterm256 -S "$filetype" "$filename" | less -R
    else
        highlight -O xterm256 "$filename" | less -R
    fi
}

# Convert Markdown file to HTML and open in Lynx
function readmarkdown {
    pandoc --from markdown --to html5 "$1" | lynx -stdin
}

# List only directory names that begin with the arg provided
# E.g. `ls a` lists all directories that begin with "a"
function lsdir () {
    ls -d $1*/
}
