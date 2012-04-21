export WORKING_DIR=~/work/roboto
cd $WORKING_DIR; mvim; gitx

tmux start-server
tmux new-session -d -s Roboto -n work

tmux new-window -tRoboto:1 -n server
tmux new-window -tRoboto:2 -n guard

tmux send-keys -tRoboto:0 'cd $WORKING_DIR' C-m
tmux send-keys -tRoboto:1 'cd $WORKING_DIR && cd spec/dummy && rails s' C-m
tmux send-keys -tRoboto:2 'cd $WORKING_DIR && bundle exec guard' C-m


tmux select-window -tRoboto:0
tmux attach-session -d -tRoboto
