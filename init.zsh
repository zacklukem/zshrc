export ZSHCONF="$HOME/.config/zsh"
export ZSH="$ZSHCONF/deps/ohmyzsh"

# oh-my-zsh configuration
ZSH_THEME="eastwood"
plugins=(git vi-mode)

# Setup Editor
if which nvim &>/dev/null; then
  export VISUAL=nvim
  export EDITOR="$VISUAL"
else
  export VISUAL=vim
  export EDITOR="$VISUAL"
fi

# Setup PATH
if [[ ! -f "$ZSHCONF/path.zsh" ]]; then
    cp $ZSHCONF/path.zsh.default $ZSHCONF/path.zsh
fi

source $ZSHCONF/path.zsh

# Run oh-my-zsh
source $ZSH/oh-my-zsh.sh

