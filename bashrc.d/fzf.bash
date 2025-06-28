# Setup fzf
# ---------
if [[ ! "$PATH" == */home/thomas/.vim/plugged/fzf/bin* ]]; then
  export PATH="${PATH:+${PATH}:}/home/thomas/.vim/plugged/fzf/bin"
fi

# Auto-completion
# ---------------
[[ $- == *i* ]] && source "/home/thomas/.vim/plugged/fzf/shell/completion.bash" 2> /dev/null

# Key bindings
# ------------
source "/home/thomas/.vim/plugged/fzf/shell/key-bindings.bash"
