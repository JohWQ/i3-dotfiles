#!/usr/bin/env sh

#Vibes
# Get the selected file from stdin
selected_file="$1"

# Define the main options
options=("Open" "Copy File to ~/Downloads/" "Copy Path" "Modify" "Show File Properties")

# Check if the selected file has a .rpm extension
if [[ "$selected_file" == *.rpm ]]; then
    options=("Install program" "${options[@]}")  # Add the Install program option as the first element
fi

# Use rofi to display options
###chosen=$(printf "%s\n" "${options[@]}" | rofi -dmenu -i -p "Choose an action for $selected_file")
chosen=$(printf "%s\n" "${options[@]}" | rofi -config ~/.config/rofi/launchers/type-1/style-05.rasi -dmenu -i -p "Choose an action for $selected_file")

# Perform the chosen action
case "$chosen" in
    "Open")
        xdg-open "$selected_file"
        ;;
    "Copy File to ~/Downloads/")
        cp "$selected_file" ~/Downloads/  # Change ~/ to your desired destination
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
        modify_chosen=$(printf "%s\n" "${modify_options[@]}" | rofi -config ~/.config/rofi/launchers/type-1/style-05.rasi -dmenu -i -p "Modify $selected_file")
        case "$modify_chosen" in
            "Rename File")
                new_name=$(rofi -config ~/.config/rofi/launchers/type-1/style-05.rasi -dmenu -p "Enter new name for $selected_file")
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
        stat "$selected_file" | rofi -config ~/.config/rofi/launchers/type-1/style-05.rasi -dmenu -p "Properties of $selected_file"
        ;;
    "Install program")
        alacritty -e bash -c "sudo dnf install '$selected_file'; read -p 'Press enter to exit...'"
        ;;
    *)
        echo "No valid option selected."
        ;;
esac
