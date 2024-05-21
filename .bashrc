#
# ~/.bashrc
#

# For managing dotfiles
alias dots='/usr/bin/git --git-dir=$HOME/.dotfiles/ --work-tree=$HOME'

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

# Default bash prompt
PS1='[\u@\h \W]\$ '

# Alias
alias ls='ls --color=auto'

# Starship
eval "$(starship init bash)"

# FZF
source /usr/share/fzf/completion.bash && source /usr/share/fzf/key-bindings.bash
export FZF_DEFAULT_OPTS="--cycle --layout=reverse --border --height=90% --preview-window=wrap --marker="*""
export FZF_DEFAULT_COMMAND='fd --type f'
export FZF_CTRL_T_COMMAND="$FZF_DEFAULT_COMMAND"

# Zoxide
eval "$(zoxide init bash)"

# Pyenv
export PYENV_ROOT="$HOME/.pyenv"
export PATH="$PYENV_ROOT/bin:$PATH"
eval "$(pyenv init --path)"
eval "$(pyenv init -)"

# FNM
eval "$(fnm env)"
