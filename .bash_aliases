##### Platform independent #####
# Git Aliases
alias g="git"
alias ga="git add"
alias gr="git rm"
alias gc="git commit"
alias gs="git status -s"
alias gss="git status"
alias gd="git diff"
alias gds="git diff --staged"
alias gco="git checkout"
alias gcm="git checkout master"
alias gpom="git pull origin master"
alias gbd="git branch -D"
alias gm="git mergetool"

# tmux
alias tm="tmux -2 attach-session -t "default" || tmux -2 new-session -s \"default\""
alias tmv="tmux -2 attach-session -t "vscode" || tmux -2 new-session -s \"vscode\""
alias tmk="tmux kill-session -t"
alias tma="tmux attach-session -t"
alias tmls="tmux list-sessions"

# Docker
alias de="docker exec"
alias dr="docker run"
alias db="docker build"
alias ds="docker stop"
alias drm="docker rm"
alias drmi="docker rmi"
alias dps="docker ps"
alias dl="docker logs"

# Editing files
alias aliases="code ~/.bash_aliases"
alias vimrc="vim ~/.vimrc"

# NPM
alias npr="npm run"

# CD-ing to some commonly used folders
alias og="cd ~/Git"

alias sass_watch="sass --watch ./:./"
alias grep="grep --color=auto"
alias c="clear"
alias be="bundle exec"
alias share="python -m SimpleHTTPServer"

##### Mac OS Specific #####
alias cask="brew cask"
alias fl="open -a ForkLift"

if [ -f ~/.bash_local_aliases ]; then
    . ~/.bash_local_aliases
fi
