# Troubleshooting Guide

## No Taskbar/Panel Showing

The taskbar is provided by DMS (Desktop Management System). If it's not showing:

```bash
# Run the DMS fix script
./scripts/fix-dms.sh

# Or manually check DMS
dms --version
dms run
```

## Shortcuts Not Working

Most shortcuts depend on DMS. Ensure DMS is running:

```bash
# Check if DMS is running
ps aux | grep dms

# If not running, start it
dms run &
```

## After Fresh Install Issues

1. **Install DMS manually if missing:**
```bash
yay -S dms-git
```

2. **Check niri is selected in login manager:**
   - Look for "niri" option in SDDM/GDM
   - Select it before logging in

3. **Verify config files:**
```bash
ls ~/.config/niri/config.kdl
ls ~/.config/dms/config.toml
```

4. **Restart niri session:**
   - Log out completely
   - Select niri from login manager
   - Log back in

## Manual DMS Setup

If DMS still doesn't work:

```bash
# Create config directory
mkdir -p ~/.config/dms

# Copy config from repo
cp config/niri/dms/config.toml ~/.config/dms/

# Start DMS manually
dms run &
```

## Essential Shortcuts

Once DMS is working:
- `Super+Space` - App launcher
- `Super+T` - Terminal
- `Super+E` - File manager
- `Super+Z` - Browser
- `Super+X` - Power menu

## Getting Help

If issues persist:
1. Check DMS logs: `journalctl --user -u dms`
2. Check niri logs: `journalctl --user -u niri`
3. Verify all packages installed: `./scripts/packages.sh`
