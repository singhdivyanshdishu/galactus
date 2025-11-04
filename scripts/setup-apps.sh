#!/bin/bash

# Applications Setup Script

set -e
source "$(dirname "$0")/common.sh"

setup_dolphin() {
    log_info "Setting up Dolphin file manager..."
    
    local script_dir="$(dirname "$0")"
    local repo_root="$(dirname "$script_dir")"
    
    # Install Dolphin config
    install_config "$repo_root/config/dolphin/dolphinrc" "$HOME/.config/dolphinrc"
    
    # Create window rules for transparency
    cat > "$HOME/.config/kwinrulesrc" << EOF
[1]
Description=Dolphin Transparency
clientmachine=localhost
clientmachinematch=0
opacityactive=85
opacityactiverule=2
opacityinactive=75
opacityinactiverule=2
wmclass=dolphin
wmclasscomplete=false
wmclassmatch=1

[General]
count=1
rules=1
EOF
    
    log_success "Dolphin configured with transparency"
}

setup_konsole() {
    log_info "Setting up Konsole terminal..."
    
    local konsole_dir="$HOME/.local/share/konsole"
    ensure_dir "$konsole_dir"
    
    # Create DankProfile
    cat > "$konsole_dir/DankProfile.profile" << EOF
[Appearance]
ColorScheme=Breeze
Font=Hack,12,-1,5,50,0,0,0,0,0

[General]
Name=DankProfile
Parent=FALLBACK/

[Interaction Options]
CopyTextAsHTML=false
TrimLeadingSpacesInSelectedText=true
TrimTrailingSpacesInSelectedText=true

[Scrolling]
HistoryMode=1
HistorySize=10000
ScrollBarPosition=2
EOF
    
    log_success "Konsole DankProfile created"
}

setup_ghostty() {
    log_info "Setting up Ghostty terminal..."
    
    local script_dir="$(dirname "$0")"
    local repo_root="$(dirname "$script_dir")"
    local ghostty_dir="$HOME/.config/ghostty"
    ensure_dir "$ghostty_dir"
    
    install_config "$repo_root/config/ghostty/config" "$ghostty_dir/config"
    
    log_success "Ghostty configured"
}

setup_fish() {
    log_info "Setting up Fish shell..."
    
    local script_dir="$(dirname "$0")"
    local repo_root="$(dirname "$script_dir")"
    local fish_dir="$HOME/.config/fish"
    ensure_dir "$fish_dir"
    
    install_config "$repo_root/config/fish/config.fish" "$fish_dir/config.fish"
    
    # Set Fish as default shell
    if command_exists fish; then
        log_info "Setting Fish as default shell..."
        chsh -s "$(which fish)"
        log_success "Fish set as default shell"
    fi
}

setup_starship() {
    log_info "Setting up Starship prompt..."
    
    local script_dir="$(dirname "$0")"
    local repo_root="$(dirname "$script_dir")"
    
    install_config "$repo_root/config/starship/starship.toml" "$HOME/.config/starship.toml"
    
    log_success "Starship prompt configured"
}

main() {
    log_info "Setting up applications..."
    
    setup_dolphin
    setup_konsole
    setup_ghostty
    setup_fish
    setup_starship
    
    log_success "Applications setup complete!"
}

main "$@"
