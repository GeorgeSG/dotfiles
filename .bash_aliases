##### Platform independent #####
# Git Aliases
alias g="git"
alias much="git"
alias such="git"
alias very="git"
alias so="git"

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

alias tm="tmux -2 attach-session -t "default" || tmux -2 new-session -s \"default\""

# Editing files
alias aliases="vim ~/.bash_aliases"
alias vimrc="vim ~/.vimrc"

# CD-ing to some commonly used folders
alias og="cd ~/Git"

alias sass_watch="sass --watch ./:./"
alias s="sublime"
alias grep="grep --color=auto"
alias c="clear"
alias be="bundle exec"
alias share="python -m SimpleHTTPServer"

##### Mac OS Specific #####
alias showfiles="defaults write com.apple.finder AppleShowAllFiles YES; killall Finder /System/Library/CoreServices/Finder.app"
alias hidefiles="defaults write com.apple.finder AppleShowAllFiles NO; killall Finder /System/Library/CoreServices/Finder.app"
alias startvpn="sudo launchctl load -w /Library/LaunchDaemons/net.juniper.AccessService.plist; open -a '/Applications/Junos Pulse.app/Contents/Plugins/JamUI/PulseTray.app/Contents/MacOS/PulseTray'"
alias quitvpn="osascript -e 'tell application \"PulseTray.app\" to quit';sudo launchctl unload -w /Library/LaunchDaemons/net.juniper.AccessService.plist"

alias cask="brew cask"

##### Ubuntu/Linux Specific #####
# Easier APT
alias install="sudo apt-get install"
alias purge="sudo apt-get purge"
alias search="sudo apt-cache search"
alias remove="sudo apt-get remove"
alias autoremove="sudo apt-get autoremove"

# Secondary Monitor
alias monitor_enable="xrandr --output CRT1 --auto --right-of LVDS"
alias monitor_disable="xrandr --output CRT1 --off"

# PC Info
alias mountinfo="mount | column -t"
alias meminfo="free -mlt"
alias driveinfo="df -h"

# Launchers
alias lstart="sudo /opt/lampp/lampp start"
alias lstop="sudo /opt/lampp/lampp stop"
alias pgstart="sudo service postgresql start"
alias pgstop="sudo service postgresql stop"


if [ -f ~/.bash_local_aliases ]; then
    . ~/.bash_local_aliases
fi
