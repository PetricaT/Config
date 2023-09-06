# Path to your oh-my-zsh installation.
export ZSH="$HOME/.oh-my-zsh"

# Custom exports
export LESS_TERMCAP_mb=$'\e[1;32m'
export LESS_TERMCAP_md=$'\e[1;32m'
export LESS_TERMCAP_me=$'\e[0m'
export LESS_TERMCAP_se=$'\e[0m'
export LESS_TERMCAP_so=$'\e[01;33m'
export LESS_TERMCAP_ue=$'\e[0m'
export LESS_TERMCAP_us=$'\e[1;4;31m'
export PAGER="most"

# See https://github.com/ohmyzsh/ohmyzsh/wiki/Themes
# ` random `  for random
ZSH_THEME="powerlevel10k/powerlevel10k"
#ZSH_THEME_RANDOM_CANDIDATES=( "amuse" "bira" "bureau" "darkblood" "fino" "fox" "jonathan" )

# update automatically without asking
zstyle ':omz:update' mode auto

# Uncomment the following line to enable command auto-correction.
ENABLE_CORRECTION="true"

plugins=(
	zsh-autosuggestions
	zsh-z
)

source $ZSH/oh-my-zsh.sh

# User configuration

#alias sudo='doas'
alias ls='exa'
alias la='exa -la'
alias v='nvim'