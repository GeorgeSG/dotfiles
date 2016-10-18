# Colors
PS1='\[\e[1;32m\]\w\[\e[m\]\[\e[1;0m\]:\[\e[m\] \[\e[1;37m\]'
export TERM=xterm-256color

shopt -s autocd
shopt -s cdspell
# check the window size after each command and, if necessary,
# update the values of LINES and COLUMNS.
shopt -s checkwinsize

# Disable Caret-C output
stty -ctlecho

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

if [ -f ~/.bash-git-prompt/share/gitprompt.sh ]; then
    source ~/.bash-git-prompt/share/gitprompt.sh
fi

GIT_PROMPT_ONLY_IN_REPO=1
GIT_PROMPT_START="\[\e[1;32m\]\w\[\e[m\]"
GIT_PROMPT_END="\[\e[1;37m\]: \[\e[1;37m\]"
GIT_PROMPT_THEME=Georgi

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
alias ls='ls -G'
alias ll='ls -alFG'
alias la='ls -AG'
alias l='ls -CFG'

if [ -f ~/.bash_aliases ]; then
    . ~/.bash_aliases
fi

######################
# Completion         #
######################

# enable programmable completion features (you don't need to enable
# this, if it's already enabled in /etc/bash.bashrc and /etc/profile
# sources /etc/bash.bashrc).
if [ -f /etc/bash_completion ] && ! shopt -oq posix; then
    . /etc/bash_completion
fi

# Git completion
if [ -f ~/.git-completion.bash  ]; then
 . ~/.git-completion.bash
fi

######################
# Sources & exports  #
######################

if [ -f ~/.bashrc_local  ]; then
 . ~/.bashrc_local
fi

# Editor
export EDITOR='subl -w'
