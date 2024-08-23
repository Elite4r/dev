#!/bin/bash

# Start a new tmux session
tmux new-session -d -s server

# Split the terminal horizontally
tmux split-window -v -t server

tmux split-window -h -t 0
# Run bungee server
tmux send-keys -t server:0.1 'cd bungee && java -Xmx128M -Xms128M -jar bungee.jar nogui && cd ..' C-m

# Run lobby server
tmux send-keys -t server:0.0 'cd lobby && java -Xmx1024M -Xms1024M -jar server.jar nogui && cd ..' C-m

# Run random server
tmux send-keys -t server:0.2 'cd random && java -Xmx256M -Xms256M -jar server2.jar nogui && cd ..' C-m
# Attach to the tmux session
tmux attach-session -t server