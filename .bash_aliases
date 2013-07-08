# Custom Commands

alias grep="grep --color=auto"

alias c="clear"


alias install="sudo apt-get install"
alias purge="sudo apt-get purge"
alias search="sudo apt-cache search"
alias remove="sudo apt-get remove"
alias autoremove="sudo apt-get autoremove"

alias mountinfo="mount | column -t"
alias meminfo="free -mlt"
alias driveinfo="df -h"

# Launchers

alias minecraft='padsp java -Xmx2048M -Xms1024M -cp ~/Minecraft/minecraft.jar net.minecraft.LauncherFrame'
alias sass_watch="sass  --watch ./:./"
alias s="sublime"
alias m="clear; cmatrix -bs"

alias aliases="gvim ~/.bash_aliases"
alias vimrc="gvim ~/.vimrc"

# CD-ing to some commonly used folders
alias og="cd ~/Dropbox/Git"
alias showtracker="cd ~/Dropbox/Git/showtracker"

# Git Aliases
alias ga="git add"
alias gc="git commit"
alias gs="git status -s"
alias gss="git status"
alias gd="git diff"
alias gds="git diff --staged"

# monitor

alias monitor_enable="xrandr --output CRT1 --auto --right-of LVDS"
alias monitor_disable="xrandr --output CRT1 --off"

# Lampp

alias lstart="sudo /opt/lampp/lampp start"
alias lstop="sudo /opt/lampp/lampp stop"

# Various functions

cdl() {
  cd "$@";
  ls -a;
}

function tabname {
  printf "\e]1;$1\a"
}

function winname {
  printf "\e]2;$1\a"
}

