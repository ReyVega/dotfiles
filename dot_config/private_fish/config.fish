# Disable greeting message
set fish_greeting


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
