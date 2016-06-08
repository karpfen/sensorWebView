#!/bin/sh
SESSION="sensorWebView"

tmux -2 new-session -d -s $SESSION

tmux new-window -t $SESSION:1 -k -n main 
tmux send-keys -t $SESSION:1 'vim index.jsp' C-m
tmux split-window -h
tmux select-pane -t 1
tmux send-keys -t $SESSION: 'vim js/init_osm_map.js' C-m
tmux split-window -v
xdg-open http://localhost:8080/sensorWebView/ &
tmux attach -t $SESSION
