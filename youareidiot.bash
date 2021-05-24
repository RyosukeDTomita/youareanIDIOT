#!/bin/bash
#########################################################################
# Name: youareidiot.bash
#
# You are idiot animation
#
# Usage: ./youareidiot.bash
#
# Author: Ryosuke Tomita
# Date: 2021/03/09
##########################################################################
PKG="uareidiottmux"
readonly dirpath="/home/tomita/bash/toy/uareidiot"

function clonetmux()
{
    for ((n=0; n < $cnt; n++));
    do
        [ "$h_or_v" = "-v" ] && h_or_v="-h" || h_or_v="-v"
        if [ $cnt -eq 1 ]; then
            $dirpath/uareidiotwithtmux.bash
        else
            panes=$(tmux list-panes -t $PKG 2>/dev/null)
            splits=$(echo "$panes" | wc -l)
            pane=$((RANDOM % $splits))
            tmux split-window $h_or_v -t "${PKG}.$pane" $dirpath/uareidiotwithtmux.bash
            sleep 0.5
        fi
    done
}


#--------------------main--------------------
declare -i cnt=${1:-1}
echo $cnt > record

# tmux
arrangements="main-horizontal main-vertical tiled"
if [ -z "$TMUX" ]; then
    tmux_launcher=tmux
    $tmux_launcher new-session -d -s $PKG "/bin/bash"
    $tmux_launcher send-keys -t $PKG "$0 $1"
    $tmux_launcher send-keys -t $PKG Enter
    exec $tmux_launcher attach-session -t $PKG
    exit 1
fi

tmux new-window -n $PKG "$WIDGET_DIR/$widget1" \; \
    set-option -g pane-active-border-bg "default" \; \
    set-option -g pane-active-border-fg "default" >/dev/null 2>&1


clonetmux
