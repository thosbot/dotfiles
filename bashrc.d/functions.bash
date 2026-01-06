bg-run() {
    cmd=$1; shift
    $cmd "$@" >/tmp/$cmd.out 2>/tmp/$cmd.err &
}

# Syntax highlighting in the terminal
lesscode() {
    filename=$1
    filetype=$2

    if [ "$filetype" ]; then
        highlight -O xterm256 -S "$filetype" "$filename" | less -R
    else
        highlight -O xterm256 "$filename" | less -R
    fi
}

# List only dot files and dot directories
lsdot() {
    find . -maxdepth 1 -name '.*' | cut -c3- | xargs lsd -d
}

# Convert Markdown file to HTML and open in Lynx
readmarkdown() {
    pandoc --from markdown --to html5 "$1" --self-contained | lynx -stdin
}

# Convert Markdown file to HTML and open in Firefox
openmarkdown() {
    filename=$(basename -- ${1%.*})
    htmlfile="/tmp/${filename}_${RANDOM}.html"
    pandoc --from markdown --to html5 $1 --css $HOME/.pandoc/css/md.css --self-contained > $htmlfile
    firefox $htmlfile
}

# List only directory names that begin with the arg provided
# E.g. `ls a` lists all directories that begin with "a"
lsdir() {
    ls -d $1*/
}
