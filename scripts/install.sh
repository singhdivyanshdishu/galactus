#!/bin/bash

# Galactus Dotfiles Installer
# Modern Arch Linux setup with niri compositor

set -e

# Colors for output
RED='\033[0;31m'
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
BLUE='\033[0;34m'
NC='\033[0m' # No Color

# Logging functions
log_info() { echo -e "${BLUE}[INFO]${NC} $1"; }
log_success() { echo -e "${GREEN}[SUCCESS]${NC} $1"; }
log_warning() { echo -e "${YELLOW}[WARNING]${NC} $1"; }
log_error() { echo -e "${RED}[ERROR]${NC} $1"; }

# Check if running on Arch Linux
check_arch() {
    if [[ ! -f /etc/arch-release ]]; then
        log_error "This script is designed for Arch Linux only!"
        exit 1
    fi
    log_success "Arch Linux detected"
}

# Update system
update_system() {
    log_info "Updating system packages..."
    sudo pacman -Syu --noconfirm
    log_success "System updated"
}

# Install yay AUR helper
install_yay() {
    if ! command -v yay &> /dev/null; then
        log_info "Installing yay AUR helper..."
        sudo pacman -S --needed --noconfirm base-devel git
        git clone https://aur.archlinux.org/yay.git /tmp/yay
        cd /tmp/yay
        makepkg -si --noconfirm
        cd -
        log_success "yay installed"
    else
        log_info "yay already installed"
    fi
}

# Install DMS (Critical for taskbar and shortcuts)
install_dms() {
    log_info "Installing DMS (Desktop Management System)..."
    yay -S --needed --noconfirm dms-git
    
    # Setup DMS config
    mkdir -p ~/.config/dms
    cat > ~/.config/dms/config.toml << 'EOF'
[general]
theme = "dark"
transparency = true
blur = true

[bar]
enabled = true
position = "top"
height = 32
background = "rgba(0, 0, 0, 0.8)"
foreground = "#ffffff"

[launcher]
enabled = true
fuzzy_search = true
max_results = 10

[notifications]
enabled = true
timeout = 5000
position = "top-right"

[audio]
enabled = true
step = 5

[brightness]
enabled = true
step = 5

[clipboard]
enabled = true
max_items = 50

[lock]
enabled = true
timeout = 300

[powermenu]
enabled = true
EOF
    
    # Start DMS
    dms run &
    log_success "DMS installed and configured"
}

# Main installation steps
main() {
    log_info "Starting Galactus dotfiles installation..."
    
    check_arch
    update_system
    install_yay
    
    # Run component installers
    log_info "Installing packages..."
    ./scripts/packages.sh
    
    log_info "Setting up niri..."
    ./scripts/setup-niri.sh
    
    log_info "Setting up applications..."
    ./scripts/setup-apps.sh
    
    log_info "Applying customizations..."
    ./scripts/setup-themes.sh
    
    log_info "Setting up development environment..."
    ./scripts/setup-dev.sh
    
    # Install and setup DMS
    install_dms
    
    log_success "Installation complete!"
    log_info "Please reboot to ensure all changes take effect."
    log_info "After reboot, select 'niri' from your login manager."
}

# Run main function
main "$@"
