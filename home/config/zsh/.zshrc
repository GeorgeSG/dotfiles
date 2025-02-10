
setopt auto_cd
setopt no_case_glob
setopt glob_complete

# setopt correct
# setopt correct_all

setopt completeinword # not just at the end

# --------
# Comp init
# --------

# The following lines were added by compinstall
zstyle ':completion:*' completer _complete _ignored _correct _approximate
zstyle :compinstall filename '~/.config/zsh/.zshrc'

autoload -Uz compinit
compinit
# End of lines added by compinstall

# Load bashcompinit for some old bash completions
autoload bashcompinit && bashcompinit


# --------
# History
# --------

HISTFILE=${ZDOTDIR:-~}/.zsh_history
SAVEHIST=50000
HISTSIZE=10000
HISTORY_IGNORE="(ls|cd|pwd|zsh|exit|cd ..)"

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
fpath+=~/Git/dotfiles/functions
autoload extract
autoload set_overwrite_alias

[ -f $ZDOTDIR/.zshrc.local ] && source $ZDOTDIR/.zshrc.local
[ -f ~/.config/.aliases ] && source ~/.config/.aliases
[ -f ~/.config/.aliases.local ] && source ~/.config/.aliases.local

# --------
# Plugins
# --------
if type brew >/dev/null 2>&1; then
  source $(brew --prefix)/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
fi

source "$ZDOTDIR/plugins/zsh-vim-mode/zsh-vim-mode.plugin.zsh"

# https://github.com/arzzen/calc.plugin.zsh
source "$ZDOTDIR/plugins/calc.plugin.zsh/calc.plugin.zsh"

# https://github.com/lukechilds/zsh-better-npm-completion
source "$ZDOTDIR/plugins/zsh-better-npm-completion/zsh-better-npm-completion.plugin.zsh"

# https://github.com/sunlei/zsh-ssh
source "$ZDOTDIR/plugins/zsh-ssh/zsh-ssh.zsh"

# https://github.com/Tarrasch/zsh-bd
source "$ZDOTDIR/plugins/bd/bd.zsh"



# Prompt
source $ZDOTDIR/.zprompt

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh
