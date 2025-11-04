#!/bin/bash

# DMS Troubleshooting Script
# Fixes common issues with DMS not working properly

set -e
source "$(dirname "$0")/common.sh"

check_dms_installation() {
    log_info "Checking DMS installation..."
    
    if ! command -v dms &> /dev/null; then
        log_error "DMS not installed! Installing now..."
        yay -S --needed --noconfirm dms-git
        log_success "DMS installed"
    else
        log_success "DMS is installed"
    fi
}

check_dms_config() {
    log_info "Checking DMS configuration..."
    
    local config_file="$HOME/.config/dms/config.toml"
    if [[ ! -f "$config_file" ]]; then
        log_warning "DMS config not found, creating default..."
        ensure_dir "$HOME/.config/dms"
        
        cat > "$config_file" << 'EOF'
# DMS Configuration for Galactus Setup
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
        log_success "DMS config created"
    else
        log_success "DMS config exists"
    fi
}

restart_dms() {
    log_info "Restarting DMS..."
    
    # Kill existing DMS processes
    pkill -f "dms" || true
    
    # Wait a moment
    sleep 2
    
    # Start DMS
    dms run &
    log_success "DMS restarted"
}

check_niri_config() {
    log_info "Checking niri configuration..."
    
    local niri_config="$HOME/.config/niri/config.kdl"
    if [[ ! -f "$niri_config" ]]; then
        log_error "niri config not found!"
        return 1
    fi
    
    # Check if DMS is configured to start
    if grep -q "spawn-at-startup.*dms" "$niri_config"; then
        log_success "DMS startup configured in niri"
    else
        log_warning "DMS startup not found in niri config"
    fi
}

fix_permissions() {
    log_info "Fixing permissions..."
    
    # Fix config directory permissions
    chmod -R 755 "$HOME/.config/niri" 2>/dev/null || true
    chmod -R 755 "$HOME/.config/dms" 2>/dev/null || true
    
    log_success "Permissions fixed"
}

main() {
    log_info "Starting DMS troubleshooting..."
    
    check_dms_installation
    check_dms_config
    check_niri_config
    fix_permissions
    restart_dms
    
    log_success "DMS troubleshooting complete!"
    log_info "If issues persist, try logging out and back in to niri"
}

main "$@"
