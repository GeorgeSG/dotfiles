alias grep="grep --color=auto"
alias c="clear"

# Easier APT
alias install="sudo apt-get install"
alias purge="sudo apt-get purge"
alias search="sudo apt-cache search"
alias remove="sudo apt-get remove"
alias autoremove="sudo apt-get autoremove"

# PC Info
alias mountinfo="mount | column -t"
alias meminfo="free -mlt"
alias driveinfo="df -h"

# Launchers
alias sass_watch="sass  --watch ./:./"
alias s="sublime"
alias minecraft='padsp java -Xmx2048M -Xms1024M -cp ~/Minecraft/minecraft.jar net.minecraft.LauncherFrame'
alias m="clear; cmatrix -bs"

# Git Aliases
alias ga="git add"
alias gc="git commit"
alias gs="git status -s"
alias gss="git status"
alias gd="git diff"
alias gds="git diff --staged"

# Editing files
alias aliases="gvim ~/.bash_aliases"
alias vimrc="gvim ~/.vimrc"

# CD-ing to some commonly used folders
alias og="cd ~/Dropbox/Git"
alias showtracker="cd ~/Dropbox/Git/showtracker"

# Monitor

alias monitor_enable="xrandr --output CRT1 --auto --right-of LVDS"
alias monitor_disable="xrandr --output CRT1 --off"

# Lampp

alias lstart="sudo /opt/lampp/lampp start"
alias lstop="sudo /opt/lampp/lampp stop"
