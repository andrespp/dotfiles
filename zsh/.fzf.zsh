# Setup fzf
# ---------
if [[ ! "$PATH" == */home/andre/.fzf/bin* ]]; then
  PATH="${PATH:+${PATH}:}/home/andre/.fzf/bin"
fi

source <(fzf --zsh)
