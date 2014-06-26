# Include my bash aliases
source ~/.bash_aliases

source ~/.zsh/git-prompt/zshrc.sh

bindkey -v

#so as not to be disturbed by Ctrl-S ctrl-Q in terminals:
stty -ixon

# enable color support of ls and also add handy aliases
if [ -x /usr/bin/dircolors ]; then
    test -r ~/.dircolors && eval "$(dircolors -b ~/.dircolors)" || eval "$(dircolors -b)"
    alias ls='ls --color=auto'
    #alias dir='dir --color=auto'
    #alias vdir='vdir --color=auto'

    alias grep='grep --color=auto'
    alias fgrep='fgrep --color=auto'
    alias egrep='egrep --color=auto'
fi

# some more ls aliases
alias ll='ls -alF'
alias la='ls -A'
alias l='ls -CF'


autoload -U compinit promptinit
autoload -U colors && colors
compinit
promptinit

setopt AUTO_CD
setopt AUTO_PUSHD
setopt PUSHD_IGNORE_DUPS
setopt PROMPT_SUBST

DIRSTACKSIZE=15

# Enable colors in prompt
autoload -U colors && colors


# Git Prompt colors
ZSH_THEME_GIT_PROMPT_PREFIX=" %{$fg_bold[cyan]%}("
ZSH_THEME_GIT_PROMPT_SUFFIX="%{$fg_bold[cyan]%})"
ZSH_THEME_GIT_PROMPT_SEPARATOR="%{$fg_bold[cyan]%}|"
ZSH_THEME_GIT_PROMPT_BRANCH=""
ZSH_THEME_GIT_PROMPT_STAGED="%{$fg_bold[green]%}●"
ZSH_THEME_GIT_PROMPT_CONFLICTS="%{$fg_bold[red]%}✖"
ZSH_THEME_GIT_PROMPT_CHANGED="%{$fg_bold[red]%}✚"
ZSH_THEME_GIT_PROMPT_REMOTE=""
ZSH_THEME_GIT_PROMPT_UNTRACKED="…"
ZSH_THEME_GIT_PROMPT_CLEAN="%{$fg_bold[cyan]%}✔"



PROMPT='%B%F{green}%~%b%F{white}$(git_super_status)%{$fg_bold[white]%}: '
RPROMPT='${${KEYMAP/vicmd/$VIM_PROMPT}/(main|viins)/} $EPS1'

export KEYTIMEOUT=1

# Arrow-driven completion
zstyle ':completion:*' menu select

# Complete Aliases
setopt completealiases

PATH=$PATH:$HOME/.rvm/bin # Add RVM to PATH for scripting

### Added by the Heroku Toolbelt
export PATH="/usr/local/heroku/bin:$PATH"

export PATH="$PATH:$HOME/.rvm/bin" # Add RVM to PATH for scripting
[[ -s "$HOME/.rvm/scripts/rvm" ]] && . "$HOME/.rvm/scripts/rvm"  # This loads RVM
