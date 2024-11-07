#!/bin/bash

# This script should be placed in your chezmoi scripts directory
# Exit on error
set -e

# Function to detect package manager
detect_package_manager() {
    if command -v apt &>/dev/null; then
        echo "apt"
    elif command -v dnf &>/dev/null; then
        echo "dnf"
    elif command -v yum &>/dev/null; then
        echo "yum"
    elif command -v pacman &>/dev/null; then
        echo "pacman"
    elif command -v brew &>/dev/null; then
        echo "brew"
    else
        echo "unknown"
    fi
}

# Install ZSH based on package manager
install_zsh() {
    local pkg_manager=$(detect_package_manager)
    echo "Installing ZSH using $pkg_manager..."
    
    case $pkg_manager in
        "apt")
            sudo apt update
            sudo apt install -y zsh
            ;;
        "dnf"|"yum")
            sudo $pkg_manager install -y zsh
            ;;
        "pacman")
            sudo pacman -Sy --noconfirm zsh
            ;;
        "brew")
            brew install zsh
            ;;
        *)
            echo "Unsupported package manager. Please install ZSH manually."
            exit 1
            ;;
    esac
}


# Set ZSH as default shell
set_zsh_default() {
    if [ "$SHELL" != "$(which zsh)" ]; then
        echo "Setting ZSH as default shell..."
        chsh -s "$(which zsh)"
    fi
}

main() {
    # Check if ZSH is already installed
    if ! command -v zsh &>/dev/null; then
        install_zsh
    else
        echo "ZSH is already installed"
    fi

    # Set ZSH as default shell
    set_zsh_default

    echo "ZSH installation and configuration completed!"
    echo "Please log out and log back in for the changes to take effect."
}

main
