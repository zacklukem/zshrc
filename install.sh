#!/bin/bash

if [ -f "$HOME/.zshrc" ]; then
    echo "Existing .zshrc file found. Backing it up to .zshrc.bak"
    cp "$HOME/.zshrc" "$HOME/.zshrc.bak"
fi

echo "Creating .zshrc file in $HOME"

cat > "$HOME/.zshrc" <<EOL
# This file is auto-generated. Do not edit it directly.
# edit ~/.config/zsh/init.zsh instead

source "$HOME/.config/zsh/init.zsh"
EOL



