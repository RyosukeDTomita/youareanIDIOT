#!/bin/bash
#kill -KILL $(ps -e | grep uareidiot | cut -d ' ' -f 3)
kill -KILL $(pgrep idiot)
