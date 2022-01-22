# Disable greeting message
set fish_greeting

# Default Editor
set -gx EDITOR nvim
set -gx VISUAL nvim
set -gx PYENV_ROOT $HOME/.pyenv
set -gx fish_user_paths $PYENV_ROOT/bin $fish_user_paths

# For managing dotfiles
alias dots='/usr/bin/git --git-dir=$HOME/.dotfiles/ --work-tree=$HOME'

# Alias
alias lf=lfrun

if status is-interactive
    # Commands to run in interactive sessions can go here
end

# Starship (Customize shell)
starship init fish | source

# Commands
zoxide init fish | source

# Pyenv
pyenv init --path | source
pyenv init - | source

# Fnm
fnm env | source

# Lf
[ -f $HOME/.config/lf/lf-icons.sh ]; and source $HOME/.config/lf/lf-icons.sh
