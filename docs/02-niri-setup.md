# niri Compositor Setup

## What is niri?

niri is a scrollable-tiling Wayland compositor that provides:
- Infinite horizontal scrolling workspaces
- Automatic window tiling
- Smooth animations
- Modern Wayland support

## Configuration

The niri configuration is located at `~/.config/niri/config.kdl` and includes:

### Window Management
- 5 preset column widths for flexible layouts
- Smart window placement
- Focus follows mouse

### Keybindings
- `Super+T` - Terminal (Konsole)
- `Super+E` - File Manager (Dolphin)
- `Super+Z` - Browser (Zen)
- `Super+Space` - App Launcher (DMS)
- `Super+Q` - Close window
- `Super+H/L` - Navigate workspaces

### DMS Integration
- Taskbar/panel provided by DMS
- Application launcher
- System tray
- Audio/brightness controls

## Display Manager

SDDM is configured to show niri as a session option. After installation:
1. Reboot
2. Look for "niri" in the session selector
3. Select it before logging in

## Troubleshooting

If niri doesn't start properly:
```bash
# Check niri logs
journalctl --user -u niri

# Verify config syntax
niri validate

# Reset to default config
cp config/niri/config.kdl ~/.config/niri/
```
