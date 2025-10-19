#!/usr/bin/env sh
# This wrapper script is invoked by xdg-desktop-portal-termfilechooser.
#
# For more information about input/output arguments read `xdg-desktop-portal-termfilechooser(5)`

set -e

if [ "$6" -ge 4 ]; then
    set -x
fi

multiple="$1"
directory="$2"
save="$3"
path="$4"
out="$5"

cmd="yazi"
termcmd="${TERMCMD:-alacritty -t 'File chooser'}"

if [ "$save" = "1" ]; then
    # save a file
    set -e --chooser-file="$out" "$path"
elif [ "$directory" = "1" ]; then
    # upload files from a directory
    set -e --chooser-file="$out" --cwd-file="$out"".1" "$path"
elif [ "$multiple" = "1" ]; then
    # upload multiple files
    set -e --chooser-file="$out" "$path"
else
    # upload only 1 file
    set -e --chooser-file="$out" "$path"
fi

command="$termcmd -e $cmd"
for arg in "$@"; do
    # escape double quotes
    escaped=$(printf "%s" "$arg" | sed 's/"/\\"/g')
    # escape special
    command="$command \"$escaped\""
done

sh -c "$command"

if [ "$directory" = "1" ]; then
    if [ ! -s "$out" ] && [ -s "$out"".1" ]; then
        cat "$out"".1" > "$out"
        rm "$out"".1"
    else
        rm "$out"".1"
    fi
fi
