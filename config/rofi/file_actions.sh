#!/bin/bash

#Vibes
# Get the selected file from stdin
selected_file="$1"

# Define the main options
options=("Open" "Copy File to ~/" "Copy Path" "Modify" "Show File Properties")

# Use rofi to display options
chosen=$(printf "%s\n" "${options[@]}" | rofi -dmenu -i -p "Choose an action for $selected_file")

# Perform the chosen action
case "$chosen" in
    "Open")
        xdg-open "$selected_file"
        ;;
    "Copy File to ~/")
        cp "$selected_file" ~/  # Change ~/ to your desired destination
        ;;
    "Copy Path")
        full_path=$(realpath "$selected_file")
        echo -n "$full_path" | xclip -selection clipboard
        ;;
#    "Copy Path")
#        echo -n "$selected_file" | xclip -selection clipboard
#        ;;
    "Modify") #options
        modify_options=("Rename File" "Move File to ~/" "⚠️Delete File")
        modify_chosen=$(printf "%s\n" "${modify_options[@]}" | rofi -dmenu -i -p "Modify $selected_file")
        case "$modify_chosen" in
            "Rename File")
                new_name=$(rofi -dmenu -p "Enter new name for $selected_file")
                mv "$selected_file" "$(dirname "$selected_file")/$new_name"
                ;;
            "Move File to ~/")
                mv "$selected_file" ~/
                ;;
            "⚠️Delete File")
                rm "$selected_file"
                ;;
            *)
                echo "No valid option selected."
                ;;
        esac
        ;;
    "Show File Properties")
        stat "$selected_file" | rofi -dmenu -p "Properties of $selected_file"
        ;;
    *)
        echo "No valid option selected."
        ;;
esac
