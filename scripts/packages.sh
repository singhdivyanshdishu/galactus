#!/bin/bash

# Package Installation Script
# Installs all necessary packages for the Galactus setup

set -e
source "$(dirname "$0")/common.sh"

# Core system packages
CORE_PACKAGES=(
    "niri"                    # Wayland compositor
    "sddm"                    # Display manager
    "konsole"                 # Terminal emulator
    "ghostty"                 # Modern terminal
    "dolphin"                 # File manager
    "thunar"                  # Lightweight file manager
    "ranger"                  # Terminal file manager
    "firefox"                 # Web browser
    "mpv"                     # Media player
    "pavucontrol"             # Audio control
    "playerctl"               # Media control
    "fastfetch"               # System info
    "git"                     # Version control
    "starship"                # Prompt
    "mate-polkit"             # Authentication agent
)

# Development packages
DEV_PACKAGES=(
    "python"                  # Python interpreter
    "python-pip"              # Python package manager
    "nodejs"                  # Node.js runtime
    "npm"                     # Node package manager
    "base-devel"              # Build tools
)

# Theme and customization packages
THEME_PACKAGES=(
    "breeze-icons"            # KDE icons
    "papirus-icon-theme"      # Modern icons
    "kdegraphics-thumbnailers" # Thumbnails
    "ffmpegthumbs"            # Video thumbnails
    "kio-extras"              # KDE I/O extras
)

# Media and utilities
UTILITY_PACKAGES=(
    "cliphist"                # Clipboard manager
    "wl-clipboard"            # Wayland clipboard
    "grim"                    # Screenshot tool
    "slurp"                   # Screen selection
    "lolcat"                  # Colorful output
    "htop"                    # Process monitor
)

# Flatpak packages
FLATPAK_PACKAGES=(
    "app.zen_browser.zen"     # Zen Browser
)

install_pacman_packages() {
    log_info "Installing core packages..."
    sudo pacman -S --needed --noconfirm "${CORE_PACKAGES[@]}"
    
    log_info "Installing development packages..."
    sudo pacman -S --needed --noconfirm "${DEV_PACKAGES[@]}"
    
    log_info "Installing theme packages..."
    sudo pacman -S --needed --noconfirm "${THEME_PACKAGES[@]}"
    
    log_info "Installing utility packages..."
    sudo pacman -S --needed --noconfirm "${UTILITY_PACKAGES[@]}"
    
    log_success "Pacman packages installed"
}

install_aur_packages() {
    log_info "Installing AUR packages..."
    
    # Install DMS Shell (Desktop Management System) - Critical for taskbar and shortcuts
    yay -S --needed --noconfirm dms-shell-bin
    
    # Check if visual-studio-code-bin is already installed
    if pacman -Qi visual-studio-code-bin &>/dev/null; then
        log_info "visual-studio-code-bin already installed, skipping..."
    else
        # Remove conflicting VS Code package if it exists
        if pacman -Qi code &>/dev/null; then
            log_info "Removing conflicting 'code' package..."
            sudo pacman -R --noconfirm code
        fi
        
        yay -S --needed --noconfirm visual-studio-code-bin
    fi
    
    log_success "AUR packages installed"
}

install_flatpak_packages() {
    log_info "Setting up Flatpak..."
    sudo pacman -S --needed --noconfirm flatpak
    flatpak remote-add --if-not-exists flathub https://flathub.org/repo/flathub.flatpakrepo
    
    log_info "Installing Flatpak packages..."
    for package in "${FLATPAK_PACKAGES[@]}"; do
        flatpak install -y flathub "$package"
    done
    log_success "Flatpak packages installed"
}

main() {
    log_info "Starting package installation..."
    
    install_pacman_packages
    install_aur_packages
    install_flatpak_packages
    
    log_success "All packages installed successfully!"
}

main "$@"
