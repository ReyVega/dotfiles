#!/bin/bash
conky_instances=$(pgrep -c "\<conky\>")

if [[ $conky_instances -gt 0 ]]
then
    killall conky
else
    conky &
fi
