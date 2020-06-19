#                        _      _     
#  _   _ _ __ __ _ _   _| | ___( )___ 
# | | | | '__/ _` | | | | |/ _ \// __|
# | |_| | | | (_| | |_| | |  __/ \__ \
#  \__,_|_|  \__,_|\__, |_|\___| |___/
#                  |___/              
#    _               _              
#   | |__   __ _ ___| |__  _ __ ___ 
#   | '_ \ / _` / __| '_ \| '__/ __|
#  _| |_) | (_| \__ \ | | | | | (__ 
# (_)_.__/ \__,_|___/_| |_|_|  \___|
#                                   

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

# Customise the prompt
PS1="\[$(tput bold)\]\[$(tput setaf 138)\]["
PS1+="\[$(tput setaf 3)\]\u"
PS1+="\[$(tput setaf 138)\]:"
PS1+="\[$(tput setaf 174)\]\h "
PS1+="\[$(tput setaf 4)\]\W"
PS1+="\[$(tput setaf 138)\]]"
PS1+="\[$(tput setaf 138)\]\\$"
PS1+="\[$(tput sgr0)\] "

# Modify lf so that directory changes upon exit
alias olf="/usr/local/bin/lf"
lf () {
    tmp="$(mktemp)"
    olf -last-dir-path="$tmp" "$@"
    if [ -f "$tmp" ]; then
        dir="$(cat "$tmp")"
        rm -f "$tmp"
        if [ -d "$dir" ]; then
            if [ "$dir" != "$(pwd)" ]; then
                cd "$dir"
            fi
        fi
    fi
}

# Set helpful aliases
alias ls='ls --color=auto'
alias mutt='neomutt'
alias se='fzf | xargs -ro vim'
alias config='/usr/bin/git --git-dir=$HOME/arch-dotfiles/ --work-tree=$HOME'
