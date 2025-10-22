#!/usr/bin/env sh
mpd-mpris -host 127.0.0.1 > /dev/null 2>&1 & ~/.cargo/bin/rmpc; pkill mpd-mpris
