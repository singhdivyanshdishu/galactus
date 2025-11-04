#!/bin/bash

# niri Compositor Setup Script

set -e
source "$(dirname "$0")/common.sh"

setup_niri_config() {
    log_info "Setting up niri configuration..."
    
    local config_dir="$HOME/.config/niri"
    local script_dir="$(dirname "$0")"
    local repo_root="$(dirname "$script_dir")"
    
    ensure_dir "$config_dir"
    
    # Install niri config
    install_config "$repo_root/config/niri/config.kdl" "$config_dir/config.kdl"
    
    # Copy DMS configuration if it exists
    if [[ -d "$repo_root/config/niri/dms" ]]; then
        cp -r "$repo_root/config/niri/dms" "$config_dir/"
        log_success "Installed DMS configuration"
    fi
    
    log_success "niri configuration installed"
}

setup_sddm() {
    log_info "Configuring SDDM for niri..."
    
    # Enable SDDM service
    enable_service "sddm.service"
    
    # Create niri desktop entry
    sudo tee /usr/share/wayland-sessions/niri.desktop > /dev/null << EOF
[Desktop Entry]
Name=niri
Comment=A scrollable-tiling Wayland compositor
Exec=niri --session
Type=Application
EOF
    
    log_success "SDDM configured for niri"
}

setup_environment() {
    log_info "Setting up environment variables..."
    
    # Create environment file for niri
    ensure_dir "$HOME/.config/environment.d"
    
    cat > "$HOME/.config/environment.d/niri.conf" << EOF
# niri environment variables
XDG_CURRENT_DESKTOP=niri
QT_QPA_PLATFORM=wayland
ELECTRON_OZONE_PLATFORM_HINT=auto
QT_QPA_PLATFORMTHEME=gtk3
QT_QPA_PLATFORMTHEME_QT6=gtk3
TERMINAL=konsole
EOF
    
    log_success "Environment variables configured"
}

main() {
    log_info "Setting up niri compositor..."
    
    setup_niri_config
    setup_sddm
    setup_environment
    
    log_success "niri setup complete!"
    log_info "You can now select 'niri' from your login manager"
}

main "$@"
