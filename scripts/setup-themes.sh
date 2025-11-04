#!/bin/bash

# Theme and Customization Setup Script

set -e
source "$(dirname "$0")/common.sh"

setup_gtk_theme() {
    log_info "Setting up GTK theme..."
    
    # Create GTK config directories
    ensure_dir "$HOME/.config/gtk-3.0"
    ensure_dir "$HOME/.config/gtk-4.0"
    
    # GTK 3 settings
    cat > "$HOME/.config/gtk-3.0/settings.ini" << EOF
[Settings]
gtk-theme-name=Breeze-Dark
gtk-icon-theme-name=Papirus-Dark
gtk-font-name=Noto Sans 10
gtk-cursor-theme-name=breeze_cursors
gtk-cursor-theme-size=24
gtk-toolbar-style=GTK_TOOLBAR_BOTH_HORIZ
gtk-toolbar-icon-size=GTK_ICON_SIZE_LARGE_TOOLBAR
gtk-button-images=0
gtk-menu-images=0
gtk-enable-event-sounds=1
gtk-enable-input-feedback-sounds=0
gtk-xft-antialias=1
gtk-xft-hinting=1
gtk-xft-hintstyle=hintfull
gtk-xft-rgba=rgb
EOF
    
    # GTK 4 settings
    cat > "$HOME/.config/gtk-4.0/settings.ini" << EOF
[Settings]
gtk-theme-name=Breeze-Dark
gtk-icon-theme-name=Papirus-Dark
gtk-font-name=Noto Sans 10
gtk-cursor-theme-name=breeze_cursors
gtk-cursor-theme-size=24
EOF
    
    log_success "GTK theme configured"
}

setup_qt_theme() {
    log_info "Setting up Qt theme..."
    
    # Set Qt theme to use GTK
    echo "export QT_QPA_PLATFORMTHEME=gtk3" >> "$HOME/.profile"
    
    log_success "Qt theme configured"
}

setup_fonts() {
    log_info "Setting up fonts..."
    
    # Create fonts config directory
    ensure_dir "$HOME/.config/fontconfig"
    
    # Font configuration
    cat > "$HOME/.config/fontconfig/fonts.conf" << EOF
<?xml version="1.0"?>
<!DOCTYPE fontconfig SYSTEM "fonts.dtd">
<fontconfig>
    <alias>
        <family>sans-serif</family>
        <prefer>
            <family>Noto Sans</family>
            <family>DejaVu Sans</family>
        </prefer>
    </alias>
    <alias>
        <family>serif</family>
        <prefer>
            <family>Noto Serif</family>
            <family>DejaVu Serif</family>
        </prefer>
    </alias>
    <alias>
        <family>monospace</family>
        <prefer>
            <family>Hack</family>
            <family>DejaVu Sans Mono</family>
        </prefer>
    </alias>
</fontconfig>
EOF
    
    log_success "Fonts configured"
}

setup_wallpaper() {
    log_info "Setting up wallpaper..."
    
    # Create wallpapers directory
    ensure_dir "$HOME/Pictures/Wallpapers"
    
    log_info "Wallpaper directory created at ~/Pictures/Wallpapers"
    log_info "Add your wallpapers there and configure them in niri config"
}

main() {
    log_info "Setting up themes and customizations..."
    
    setup_gtk_theme
    setup_qt_theme
    setup_fonts
    setup_wallpaper
    
    log_success "Theme setup complete!"
}

main "$@"
