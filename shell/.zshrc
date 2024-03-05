ZDOTDIR=$HOME/.zsh

source $ZDOTDIR/.zprompt


setopt AUTO_CD
setopt NO_CASE_GLOB
setopt GLOB_COMPLETE

setopt CORRECT
setopt CORRECT_ALL

autoload -Uz compinit && compinit


# --------
# History
# --------

HISTFILE=${ZDOTDIR:-$HOME}/.zsh_history
SAVEHIST=50000
HISTSIZE=10000

setopt EXTENDED_HISTORY
# share history across multiple zsh sessions
setopt SHARE_HISTORY
# append to history
setopt APPEND_HISTORY
# adds commands as they are typed, not at shell exit
setopt INC_APPEND_HISTORY
# do not store duplications
setopt HIST_IGNORE_DUPS
# removes blank lines from history
setopt HIST_REDUCE_BLANKS
# show !! before executing
setopt HIST_VERIFY

# --------
# Source & include
# --------

# Include functions
fpath+=$HOME/Git/dotfiles/functions
autoload extract

# load bashcompinit for some old bash completions
autoload bashcompinit && bashcompinit

source $ZDOTDIR/.zshrc.local
source $HOME/.aliases
source $HOME/.aliases.local
