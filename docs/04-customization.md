# Customization Guide

## Theme System

### Overall Theme
- **Base**: Breeze Dark (KDE theme)
- **Icons**: Papirus (modern, colorful icons)
- **Colors**: DankColors (custom dark theme)

### Terminal Themes
- **Konsole**: DankColors.colorscheme
- **Ghostty**: config-dankcolors variant
- **Consistent**: Same color palette across terminals

## Transparency Effects

### Dolphin File Manager
- **Active window**: 85% opacity
- **Inactive window**: 75% opacity
- **Background blur**: Enabled where supported

### Terminal Transparency
- **Konsole**: Configurable in DankProfile
- **Ghostty**: Set in config file

## Starship Prompt

### Features
- **Git integration**: Branch, status, ahead/behind
- **Language detection**: Python, Node.js, etc.
- **Performance**: Fast, minimal latency
- **Customization**: Easy to modify colors/symbols

### Configuration
Located at `~/.config/starship/starship.toml`:
- Custom colors matching DankColors theme
- Relevant modules for development
- Clean, informative layout

## DMS Customization

### Panel/Taskbar
- **Position**: Top of screen
- **Transparency**: Semi-transparent background
- **Modules**: Launcher, workspaces, system tray, clock

### Launcher
- **Fuzzy search**: Type to find applications
- **Recent apps**: Quick access to frequently used
- **Categories**: Organized application menu

## Icon Themes

### Papirus Icons
- **Style**: Modern, flat design
- **Coverage**: Extensive application support
- **Colors**: Matches dark theme aesthetic
- **Folders**: Custom folder colors available

## Fastfetch Variants

Multiple fastfetch configurations for different use cases:
- **Default**: Standard system information
- **Minimal**: Clean, essential info only
- **Detailed**: Comprehensive system details

## Customizing Further

### Colors
Edit the DankColors files to change:
- Terminal color schemes
- Application themes
- Accent colors

### Keybindings
Modify `~/.config/niri/config.kdl` for:
- Window management shortcuts
- Application launchers
- System controls

### Applications
Add or remove applications by editing:
- `scripts/packages.sh` - Package lists
- `scripts/setup-apps.sh` - Application configs
