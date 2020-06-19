#                        _      _     
#  _   _ _ __ __ _ _   _| | ___( )___ 
# | | | | '__/ _` | | | | |/ _ \// __|
# | |_| | | | (_| | |_| | |  __/ \__ \
#  \__,_|_|  \__,_|\__, |_|\___| |___/
#                  |___/              
#    _               _                           __ _ _      
#   | |__   __ _ ___| |__       _ __  _ __ ___  / _(_) | ___ 
#   | '_ \ / _` / __| '_ \     | '_ \| '__/ _ \| |_| | |/ _ \
#  _| |_) | (_| \__ \ | | |    | |_) | | | (_) |  _| | |  __/
# (_)_.__/ \__,_|___/_| |_|____| .__/|_|  \___/|_| |_|_|\___|
#                        |_____|_|                           

# Enable vi mode
set -o vi

# Exporting environmental variables
export VISUAL="vim"
export EDITOR="$VISUAL"
export TERMINAL="st"
export BROWSER="brave"
export FZF_DEFAULT_COMMAND='ag --hidden --ignore .git --ignore r-packages --ignore arch-dotfiles -g ""'
export FZF_DEFAULT_OPTS="--layout=reverse --height 40%"

# Clean-up with XDG base specifications
export XDG_CONFIG_HOME="$HOME/.config"
export XDG_CACHE_HOME="$HOME/.cache"
export XDG_DATA_HOME="$HOME/.local/share"
export LESSHISTFILE="-"
export INPUTRC="$HOME/.config/inputrc"
export NOTMUCH_CONFIG="$HOME/.config/notmuch-config"
export PASSWORD_STORE_DIR="$XDG_DATA_HOME/password-store"
export R_LIBS_USER="$HOME/downloads/r-packages/4.0"

# Modifying the path
export PATH=$PATH:/home/urayle/documents/scripts
