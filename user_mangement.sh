function display_usage {
    echo "Usage: $0 [OPTIONS]"
    echo "Options:"
    echo "  -c, --create     Create a new user account."
    echo "  -d, --delete     Delete an existing user account."
    echo "  -r, --reset      Reset password for an existing user account."
    echo "  -l, --list       List all user accounts on the system."
    echo "  -h, --help       Display this help and exit."
}

# Function to create a new user account
function create_user {
    read -p "Enter the new username: " username

    # Check if the username already exists
    if id "$username" &>/dev/null; then
        echo "Error: The username '$username' already exists. Please choose a different sername."
    else
        # Prompt for password (Note: You might want to use 'read -s' to hide the passwor input)
        read -p "Enter the password for $username: " password

        # Create the user account
        useradd -m -p "$password" "$username"
        echo "User account '$username' created successfully."
    fi
}

# Function to delete an existing user account
function delete_user {
    read -p "Enter the username to delete: " username

    # Check if the username exists
    if id "$username" &>/dev/null; then
        userdel -r "$username"  # -r flag removes the user's home directory
