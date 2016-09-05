
[[ -s "$HOME/.profile" ]] && source "$HOME/.profile" # Load the default .profile

[[ -s "$HOME/.rvm/scripts/rvm" ]] && source "$HOME/.rvm/scripts/rvm" # Load RVM into a shell session *as a function*

# if [[ "$TERM" != "screen-256color" ]]
# then
#     tmux -2 attach-session -t "default" || tmux -2 new-session -s "default"
#     exit
# fi

alias tm="tmux -2 attach-session -t "default" || tmux -2 new-session -s \"default\""
