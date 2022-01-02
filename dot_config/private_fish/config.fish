# Disable greeting message
set fish_greeting

# Default Editor
set -gx EDITOR nvim
set -gx VISUAL nvim

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
status is-login; and pyenv init --path | source
status is-interactive; and pyenv init - | source

# Fnm
fnm env | source

# Lf
[ -f $HOME/.config/lf/lf-icons.sh ]; and source $HOME/.config/lf/lf-icons.sh
