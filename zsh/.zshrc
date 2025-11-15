# Set XDG Base Directory for compliant apps
export XDG_CONFIG_HOME="$HOME/.config"
export XDG_CACHE_HOME="$HOME/.cache"
export XDG_DATA_HOME="$HOME/.local/share"
export XDG_STATE_HOME="$HOME/.local/state"

# Enable Powerlevel10k instant prompt. Should stay close to the top.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

##
# Oh My Zsh Configuration
##

# Set name of the theme
ZSH_THEME="powerlevel10k/powerlevel10k"

# Which plugins to load
plugins=(
  git
  zsh-autosuggestions
  zsh-syntax-highlighting
)

# Example of useful OMZ settings (uncomment to use)
# zstyle ':omz:update' mode disabled  # disable automatic updates
# ENABLE_CORRECTION="true"            # enable command auto-correction
# DISABLE_UNTRACKED_FILES_DIRTY="true" # speed up git prompts in large repos
# HIST_STAMPS="yyyy-mm-dd"            # set history timestamp format

# Load Oh My Zsh
source $ZSH/oh-my-zsh.sh

##
# User Configuration & PATH
##

# Add custom bin directories to PATH (Uncomment and modify if needed)
# export PATH=$HOME/bin:$HOME/.local/bin:$PATH

# Preferred editor
# if [[ -n $SSH_CONNECTION ]]; then
#   export EDITOR='vim'
# else
#   export EDITOR='nvim'
# fi

# Set language environment
# export LANG=en_US.UTF-8

# Aliases
# For many aliases, it's best to create a file like $ZSH_CUSTOM/aliases.zsh
# alias ...

##
# Zsh Environment & History (Using XDG)
##

# Use the ZDOTDIR variable set in .zshenv
export HISTFILE="$ZDOTDIR/.zsh_history"
export ZSH_COMPDUMP="$ZDOTDIR/.zcompdump"
export ZSH_SESSIONS_DIR="$ZDOTDIR/sessions"
export LESSHISTFILE="$ZDOTDIR/.lesshst"
export TERMINFO="$ZDOTDIR/terminfo"

##
# Load user configurations
##
if [ -d "$ZDOTDIR/rc.d" ]; then
  for file in "$ZDOTDIR"/rc.d/*.zsh; do
    [ -r "$file" ] && source "$file"
  done
  unset file
fi

##
# Prompt
##

# To customize prompt, run `p10k configure` or edit .p10k.zsh.
[[ ! -f "$ZDOTDIR/.p10k.zsh" ]] || source "$ZDOTDIR/.p10k.zsh"