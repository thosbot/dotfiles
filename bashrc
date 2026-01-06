# ~/.bashrc is only read by a shell that's both interactive and non-login,
# see /usr/share/doc/bash/examples/startup-files (in the package bash-doc)

# If not running interactively, don't do anything
[ -z "$PS1" ] && return

# Append to the history file, don't overwrite it
shopt -s histappend

# Save multi-line commands as one command
shopt -s cmdhist

shopt -s cdable_vars

export EDITOR='vim'

# Don't put duplicate lines in the history. See bash(1) for more options
export HISTTIMEFORMAT='[%F %T] '
export HISTCONTROL='ignorespace:erasedups:ignoredups'
export HISTIGNORE='history'
export HISTFILESIZE=100000000
export HISTSIZE=1000000

# Correct small errors in directory names given to the `cd` builtin
shopt -s cdspell

# Check the window size after each command and, if necessary,
# update the values of LINES and COLUMNS.
shopt -s checkwinsize

# Use programmable completion, if available
shopt -s progcomp

# Do not search PATH for completions on an empty line
shopt -s no_empty_cmd_completion

# These options only exist since Bash 4.0-alpha
if ((BASH_VERSINFO[0] >= 4)) ; then
    # Correct small errors in directory names during completion
    shopt -s dirspell
fi

# Prompt
PS1='${debian_chroot:+($debian_chroot)}\[\033[00;36m\]\u@\h\[\033[00m\]:\[\033[00;33m\]\w\[\033[00m\]\$ '
# PS1="[ \[\033[35m\]\t\[\033[m\] ] \[\033[36m\]\u\[\033[m\]@\[\033[32m\]\h:\[\033[33;1m\]\w\[\033[m\]\$ "

# Set xterm title
case $TERM in
xterm*)
    #PROMPT_COMMAND='echo -ne "\033]0;${USER}@${HOSTNAME}: ${PWD}\007"'
    ;;
screen*)
    SESSIONNAME=`echo $STY | sed "s/^[0-9]\+.//g"`
    PROMPT_COMMAND='echo -ne "\033]0;${SESSIONNAME}\007"'
    ;;
*)
    ;;
esac

# less man page colors
# export LESS_TERMCAP_mb=$'\E[01;31m'        # begin blinking
# export LESS_TERMCAP_md=$'\E[01;31m'        # begin bold
# export LESS_TERMCAP_me=$'\E[0m'            # end mode
# export LESS_TERMCAP_se=$'\E[0m'            # end standout-mode
# export LESS_TERMCAP_so=$'\E[01;44;33m'     # begin standout-mode - info box
# export LESS_TERMCAP_ue=$'\E[0m'            # end underline
# export LESS_TERMCAP_us=$'\E[01;32m'        # begin underline

# Enable bash completion in interactive shells
if ! shopt -oq posix; then
  if [ -f /usr/share/bash-completion/bash_completion ]; then
    . /usr/share/bash-completion/bash_completion
  elif [ -f /etc/bash_completion ]; then
    . /etc/bash_completion
  fi
fi

# GNU-readline tab completion
bind "set completion-ignore-case on"

# Perlbrew - Manage multiple Perl installations
source /opt/perl5/perlbrew/etc/bashrc

# Load Bash-specific startup files (if they exist)
for sh in "$HOME"/.bashrc.d/*.bash ; do
    [[ -e $sh ]] && source "$sh"
done
unset -v sh

# if the command-not-found package is installed, use it
if [ -x /usr/lib/command-not-found -o -x /usr/share/command-not-found/command-not-found ]; then
    function command_not_found_handle {
            # check because c-n-f could've been removed in the meantime
                if [ -x /usr/lib/command-not-found ]; then
           /usr/lib/command-not-found -- "$1"
                   return $?
                elif [ -x /usr/share/command-not-found/command-not-found ]; then
           /usr/share/command-not-found/command-not-found -- "$1"
                   return $?
        else
           printf "%s: command not found\n" "$1" >&2
           return 127
        fi
    }
fi

# REFERENCES
# [Better Bash history](http://blog.sanctum.geek.nz/better-bash-history/)
# [Shell config subfiles](http://blog.sanctum.geek.nz/shell-config-subfiles/)
