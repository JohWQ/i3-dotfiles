#!/usr/bin/env sh
fd -t f . --exec-batch ls -t . ~ | fzf | xargs -I {} yazi {}
