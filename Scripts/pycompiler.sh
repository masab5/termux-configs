#!~/../usr/bin/bash

#tmux split-window
#tmux resize-p -D 6
tmux select-pane -t 1
tmux send 'python3 "$(<~/.filename.txt)"' ENTER;
tmux select-pane -t 0
tmux send ENTER;
tmux select-pane -t 1
