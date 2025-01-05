#! /bin/bash

# Script to configure neovim setup from scratch

set -e

plugin_urls=(
    https://github.com/nvim-treesitter/nvim-treesitter.git
    https://github.com/navarasu/onedark.nvim.git
    https://github.com/neovim/nvim-lspconfig

)

# create the nvim directories
mkdir -p ~/.config/nvim
mkdir -p ~/.local/share/nvim/site/pack
# The package where the auto start plugins are supposed to be placed
mkdir -p ~/.local/share/nvim/site/pack/plugins/start

#copy the init.lua file to ~/.config/nvim
cp init.lua ~/.config/nvim

#clone the plugins' git repos
cd ~/.local/share/nvim/site/pack/plugins/start
for url in ${plugin_urls[@]}; do
    git clone $url
done


