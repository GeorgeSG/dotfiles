ZDOTDIR=$HOME/.zsh

source $ZDOTDIR/.zprompt


setopt AUTO_CD
setopt NO_CASE_GLOB
setopt GLOB_COMPLETE

setopt correct
setopt correct_all

autoload -Uz compinit && compinit


# --------
# History
# --------

HISTFILE=${ZDOTDIR:-$HOME}/.zsh_history
SAVEHIST=50000
HISTSIZE=10000

setopt extended_history   # record start time and elapsed time in history file
setopt share_history      # share history across multiple zsh sessions
setopt append_history     # append to history
setopt inc_append_history # adds commands as they are typed, not at shell exit
setopt hist_ignore_dups   # do not store duplications
setopt hist_reduce_blanks # removes blank lines from history
setopt hist_verify        # show !! before executing
setopt hist_ignore_space  # remove command lines beginning with a space from history

setopt no_beep            # Don't beep on command input error

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
