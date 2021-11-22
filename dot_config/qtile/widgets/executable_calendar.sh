#!/bin/sh
icon=""

hour=$(date +%H:%M)
date=$(date +"%b %d %Y")

echo -n "$icon $date ($hour)"