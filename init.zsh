export ZLM_ORIGINAL_PWD=$(pwd)
export ZSHCONF="$HOME/.config/zsh"
export ZSH="$ZSHCONF/deps/ohmyzsh"

cp "$ZSHCONF/yeastwood.zsh-theme" "$ZSH/custom/themes/yeastwood.zsh-theme"

# oh-my-zsh configuration
ZSH_THEME="yeastwood"
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

# Setup Local config
if [[ ! -f "$ZSHCONF/local.zsh" ]]; then
    cp $ZSHCONF/local.zsh.default $ZSHCONF/local.zsh
fi

source $ZSHCONF/local.zsh

# Functions
source $ZSHCONF/functions.zsh

# Run oh-my-zsh
source $ZSH/oh-my-zsh.sh

if [[ -z "$ZLM_DISBLE_SYNTAX_HIGHLIGHTING" ]]; then
    source "$ZSHCONF/deps/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh"
fi

