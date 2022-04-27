# SOURCES

source ~/.config/fish/alias.fish
source (/usr/bin/starship init fish --print-full-init | psub)
source ~/.config/fish/functions.fish

# Bindings
bind \cd exit

# VARIABLES
set EDITOR nvim

