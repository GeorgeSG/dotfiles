# Custom Commands

alias grep="grep --color=auto"

alias logout="xfce4-session-logout --logout"
alias reboot="xfce4-session-logout --reboot"

alias install="sudo apt-get install"
alias purge="sudo apt-get purge"
alias search="sudo apt-cache search"
alias autoremove="sudo apt-get autoremove"

alias mountinfo="mount | column -t"
alias meminfo="free -mlt"
alias driveinfo="df -H"


# Launchers

alias minecraft='padsp java -Xmx2048M -Xms1024M -cp ~/Minecraft/minecraft.jar net.minecraft.LauncherFrame'
alias s="sublime"
alias m="clear; cmatrix -bs"

alias aliases="sublime ~/.bash_aliases"


# Functions

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

export PATH=${PATH}:~/Downloads/Apps/adt-bundle-mac-x86_64/sdk/tools
export PATH=${PATH}:~/Downloads/Apps/adt-bundle-mac-x86_64/sdk/platform-tools

