# Set prompt
IFS='.' read -ra split_hostname <<<$(hostname | tr '[:upper:]' '[:lower:]')
HOSTNAME=${split_hostname[0]}
PS1='\[\e[1;4;36m\]$HOSTNAME\[\e[1;0m\] \[\e[1;32m\]\w\[\e[m\]\[\e[1;0m\] \[\e[0m\] \[\e[1;0m\]'
export TERM=xterm-256color

shopt -s cdspell
# check the window size after each command and, if necessary,
# update the values of LINES and COLUMNS.
shopt -s checkwinsize

# Disable Caret-C output
stty -ctlecho

set -o vi
bind -m vi-insert "\C-l":clear-screen

#so as not to be disturbed by Ctrl-S ctrl-Q in terminals:
stty -ixon

######################
# History Management #
######################

# append to the history file, don't overwrite it
shopt -s histappend

# for setting history length see HISTSIZE and HISTFILESIZE in bash(1)
HISTSIZE=5000
HISTFILESIZE=2000

# don't put duplicate lines or lines starting with space in the history.
# See bash(1) for more options
HISTCONTROL=ignoreboth

######################
# Aliases            #
######################

# enable color support of ls and also add handy aliases
if [ -x /usr/bin/dircolors ]; then
  test -r ~/.dircolors && eval "$(dircolors -b ~/.dircolors)" || eval "$(dircolors -b)"
  alias grep='grep --color=auto'
  alias fgrep='fgrep --color=auto'
  alias egrep='egrep --color=auto'
fi

# some more ls aliases
alias ls='ls -hG'
alias ll='ls -alhFG'
alias la='ls -AG'
alias l='ls -CFG'

# Editor
export EDITOR='code -w'

# bash-git-prompt
GIT_PROMPT_ONLY_IN_REPO=1
GIT_PROMPT_START="\[\e[1;4;36m\]$HOSTNAME\[\e[1;0m\] \[\e[1;32m\]\w\[\e[m\]"
GIT_PROMPT_END="\[\e[1;m\]  \[\e[1;m\]"


# Disable deprecation warning on mac
export BASH_SILENCE_DEPRECATION_WARNING=1

######################
# Sources & exports  #
######################

if [ -f ~/.bash_aliases ]; then
  source ~/.bash_aliases
fi

if [ -f ~/.bashrc.local ]; then
  source ~/.bashrc.local
fi

# bash-git prompt
if [ -f ~/.bash-git-prompt/gitprompt.sh ]; then
  source ~/.bash-git-prompt/gitprompt.sh
fi

# enable programmable completion features (you don't need to enable
# this, if it's already enabled in /etc/bash.bashrc and /etc/profile
# sources /etc/bash.bashrc).
if [ -f /etc/bash_completion ] && ! shopt -oq posix; then
  source /etc/bash_completion
fi

# Git completion
if [ -f ~/.git-completion.bash ]; then
  source ~/.git-completion.bash
fi
