#
# ~/.profile
#

# Default Editor
export EDITOR=nvim
export VISUAL=nvim

# Default XDG paths
export XDG_CONFIG_HOME=$HOME/.config
export XDG_CACHE_HOME=$HOME/.cache
export XDG_DATA_HOME=$HOME/.local/share

# Default browser
export BROWSER=brave

# Default terminal
export TERMINAL="kitty";

# Default reader
export READER="zathura"

# Add .local/bin to path to use funny stuff
export PATH="$HOME/.local/bin:$PATH"

# Disable the creation of .lesshst file
export LESSHISTFILE="-"
