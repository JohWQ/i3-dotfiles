#!/bin/bash

# Check if a package name was provided as an argument
if [ -z "$1" ]; then
    read -p "Enter the package name to search: " PACKAGE_NAME
else
    PACKAGE_NAME="$1"
fi

# Check if the package is available
echo -e "\nChecking availability for package: $PACKAGE_NAME"
AVAILABLE=$(dnf repoquery $PACKAGE_NAME)

if [ -z "$AVAILABLE" ]; then
    echo "Package '$PACKAGE_NAME' is not available in the repositories."
else
    echo -e "Available as:\n$AVAILABLE"
    
    # Check what requires the package
    echo -e "\nPackages that require '$PACKAGE_NAME':"
    REQUIRES=$(dnf repoquery --whatrequires=$PACKAGE_NAME)
    if [ -z "$REQUIRES" ]; then
        echo "No packages require '$PACKAGE_NAME'."
    else
        echo "$REQUIRES"
    fi

    # Check what the package requires
    echo -e "\nDependencies for '$PACKAGE_NAME':"
    DEPENDS=$(dnf repoquery --requires $PACKAGE_NAME)
    if [ -z "$DEPENDS" ]; then
        echo "No dependencies found for '$PACKAGE_NAME'."
    else
        echo "$DEPENDS"
    fi
fi

# Check if the package is installed
echo -e "\nChecking if '$PACKAGE_NAME' is installed:"
if dnf list --installed "$PACKAGE_NAME" &> /dev/null; then
    echo "Package '$PACKAGE_NAME' is installed. Details:"
    dnf list --installed "$PACKAGE_NAME"
else
    echo "Package '$PACKAGE_NAME' is not installed."
    
    # Offer to search through installed packages or repository
    echo -e "\nWould you like to search for similar packages?"
    echo "1) Search installed packages"
    echo "2) Search available packages in the repository"
    read -p "Select an option (1 or 2): " OPTION
    
    if [ "$OPTION" == "1" ]; then
        echo -e "\nSearching installed packages..."
        dnf list --installed | fzf --height 40% --reverse --preview "echo {}" --preview-window=up:30%:wrap
    elif [ "$OPTION" == "2" ]; then
        echo -e "\nSearching available packages in the repository..."
        dnf list | fzf --height 40% --reverse --preview "echo {}" --preview-window=up:30%:wrap
    else
        echo "Invalid option selected."
    fi
fi
