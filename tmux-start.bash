#!/bin/sh
SESSION="sensorWebView"

tmux -2 new-session -d -s $SESSION

tmux new-window -t $SESSION:1 -k -n main 
tmux send-keys -t $SESSION:1 'vim index.html' C-m
tmux split-window -h
tmux select-pane -t 1
tmux send-keys -t $SESSION: 'vim script/init_osm_map.js' C-m
tmux split-window -v
firefox index.html &
tmux attach -t $SESSION
