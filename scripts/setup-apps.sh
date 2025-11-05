#!/bin/bash

# Applications Setup Script

set -e
source "$(dirname "$0")/common.sh"

setup_dolphin() {
    log_info "Setting up Dolphin file manager..."
    
    local script_dir="$(dirname "$0")"
    local repo_root="$(dirname "$script_dir")"
    
    # Install Dolphin config
    if [[ -f "$repo_root/config/dolphin/dolphinrc" ]]; then
        install_config "$repo_root/config/dolphin/dolphinrc" "$HOME/.config/dolphinrc"
    fi
    
    log_success "Dolphin configured"
}

setup_konsole() {
    log_info "Setting up Konsole terminal..."
    
    local script_dir="$(dirname "$0")"
    local repo_root="$(dirname "$script_dir")"
    local konsole_dir="$HOME/.local/share/konsole"
    ensure_dir "$konsole_dir"
    
    # Install Konsole profiles and color schemes
    if [[ -f "$repo_root/config/konsole/DankProfile.profile" ]]; then
        install_config "$repo_root/config/konsole/DankProfile.profile" "$konsole_dir/DankProfile.profile"
    fi
    
    if [[ -f "$repo_root/config/konsole/DankColors.colorscheme" ]]; then
        install_config "$repo_root/config/konsole/DankColors.colorscheme" "$konsole_dir/DankColors.colorscheme"
    fi
    
    log_success "Konsole configured"
}

setup_ghostty() {
    log_info "Setting up Ghostty terminal..."
    
    local script_dir="$(dirname "$0")"
    local repo_root="$(dirname "$script_dir")"
    local ghostty_dir="$HOME/.config/ghostty"
    ensure_dir "$ghostty_dir"
    
    if [[ -f "$repo_root/config/ghostty/config" ]]; then
        install_config "$repo_root/config/ghostty/config" "$ghostty_dir/config"
    fi
    
    log_success "Ghostty configured"
}

setup_starship() {
    log_info "Setting up Starship prompt..."
    
    local script_dir="$(dirname "$0")"
    local repo_root="$(dirname "$script_dir")"
    
    if [[ -f "$repo_root/config/starship/starship.toml" ]]; then
        install_config "$repo_root/config/starship/starship.toml" "$HOME/.config/starship.toml"
    fi
    
    log_success "Starship prompt configured"
}

setup_bash_config() {
    log_info "Setting up bash configuration..."
    
    local script_dir="$(dirname "$0")"
    local repo_root="$(dirname "$script_dir")"
    
    # Install bashrc with fastfetch variants
    if [[ -f "$repo_root/config/bash/.bashrc" ]]; then
        install_config "$repo_root/config/bash/.bashrc" "$HOME/.bashrc"
    fi
    
    # Install bash_profile
    if [[ -f "$repo_root/config/bash/.bash_profile" ]]; then
        install_config "$repo_root/config/bash/.bash_profile" "$HOME/.bash_profile"
    fi
    
    # Install profile
    if [[ -f "$repo_root/config/bash/.profile" ]]; then
        install_config "$repo_root/config/bash/.profile" "$HOME/.profile"
    fi
    
    log_success "Bash configuration installed"
    
    # Add starship init to bashrc if not present
    if ! grep -q "starship init bash" "$HOME/.bashrc"; then
        echo 'eval "$(starship init bash)"' >> "$HOME/.bashrc"
        log_success "Starship init added to bashrc"
    fi
}

setup_git_config() {
    log_info "Setting up git configuration..."
    
    local script_dir="$(dirname "$0")"
    local repo_root="$(dirname "$script_dir")"
    
    if [[ -f "$repo_root/config/git/.gitconfig" ]]; then
        install_config "$repo_root/config/git/.gitconfig" "$HOME/.gitconfig"
        log_success "Git configuration installed"
    fi
}

setup_fastfetch() {
    log_info "Setting up fastfetch configuration..."
    
    local script_dir="$(dirname "$0")"
    local repo_root="$(dirname "$script_dir")"
    local fastfetch_dir="$HOME/.config/fastfetch"
    ensure_dir "$fastfetch_dir"
    
    if [[ -d "$repo_root/config/fastfetch" ]]; then
        cp -r "$repo_root/config/fastfetch/"* "$fastfetch_dir/"
        log_success "Fastfetch configuration installed"
    fi
}

setup_desktop_entries() {
    log_info "Setting up desktop entries..."
    
    local script_dir="$(dirname "$0")"
    local repo_root="$(dirname "$script_dir")"
    local apps_dir="$HOME/.local/share/applications"
    ensure_dir "$apps_dir"
    
    if [[ -f "$repo_root/config/applications/zen-optimized.desktop" ]]; then
        install_config "$repo_root/config/applications/zen-optimized.desktop" "$apps_dir/zen-optimized.desktop"
        log_success "Desktop entries installed"
    fi
}

main() {
    log_info "Setting up applications..."
    
    setup_dolphin
    setup_konsole
    setup_ghostty
    setup_bash_config
    setup_git_config
    setup_fastfetch
    setup_desktop_entries
    setup_starship
    
    log_success "Applications setup complete!"
}

main "$@"
