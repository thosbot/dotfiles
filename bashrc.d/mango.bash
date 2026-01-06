export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion

if type brew &>/dev/null
then
  HOMEBREW_PREFIX="$(brew --prefix)"
  if [[ -r "${HOMEBREW_PREFIX}/etc/profile.d/bash_completion.sh" ]]
  then
    source "${HOMEBREW_PREFIX}/etc/profile.d/bash_completion.sh"
  else
    for COMPLETION in "${HOMEBREW_PREFIX}/etc/bash_completion.d/"*
    do
      [[ -r "${COMPLETION}" ]] && source "${COMPLETION}"
    done
  fi
fi

source /opt/homebrew/opt/fzf/shell/completion.bash
source /opt/homebrew/opt/fzf/shell/key-bindings.bash

source /Users/thomas/.docker/init-bash.sh || true

source $HOME/google-cloud-sdk/path.bash.inc || true
source $HOME/google-cloud-sdk/completion.bash.inc || true

source <(kubectl completion bash) || true
source <(kustomize completion bash) || true
