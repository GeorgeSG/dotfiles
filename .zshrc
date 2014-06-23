# Include my bash aliases
source ~/.bash_aliases

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

GIT_PROMPT_SYMBOL="%{$fg[white]%}:"
GIT_PROMPT_PREFIX="%{$fg_bold[cyan]%}(" #"%{$fg[green]%}[%{$reset_color%}"
GIT_PROMPT_SUFFIX=')' #"%{$fg[green]%}]%{$reset_color%}"

parse_git_branch() {
  (git symbolic-ref -q HEAD || git name-rev --name-only --no-undefined --always HEAD) 2> /dev/null
}

git_prompt_string() {
    local git_where="$(parse_git_branch)"
    if [ -n "$git_where" ]; then
        echo " $GIT_PROMPT_PREFIX${git_where#(refs/heads/|tags/)}$GIT_PROMPT_SUFFIX$GIT_PROMPT_SYMBOL%{$fg[white]%}"
    else
        echo "%B:"
    fi
}

PROMPT='%B%F{green}%~%b%F{white}$(git_prompt_string) '
RPROMPT='%w, %t'

# Arrow-driven completion
zstyle ':completion:*' menu select

# Complete Aliases
setopt completealiases

PATH=$PATH:$HOME/.rvm/bin # Add RVM to PATH for scripting

### Added by the Heroku Toolbelt
export PATH="/usr/local/heroku/bin:$PATH"

export PATH="$PATH:$HOME/.rvm/bin" # Add RVM to PATH for scripting
[[ -s "$HOME/.rvm/scripts/rvm" ]] && . "$HOME/.rvm/scripts/rvm"  # This loads RVM
