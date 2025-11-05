# Troubleshooting Guide

## Installation Issues

### Script Fails to Run
```bash
# Ensure you're in the right directory
cd galactus
ls scripts/install.sh  # Should exist

# Make sure script is executable
chmod +x scripts/install.sh
```

### VS Code Extension Installation Errors
**Problem**: `FATAL ERROR: v8::ToLocalChecked Empty MaybeLocal` during extension installation

**Causes**:
- Node.js version compatibility issues
- Corrupted npm cache
- Memory issues during module resolution

**Solutions**:
```bash
# 1. Clear npm cache
npm cache clean --force

# 2. Update Node.js to LTS version
sudo pacman -S nodejs-lts-iron

# 3. Reinstall VS Code extensions manually
code --list-extensions | xargs -L 1 echo code --install-extension

# 4. Reset VS Code extensions
rm -rf ~/.vscode/extensions
```

### Package Installation Fails
```bash
# Update system first
sudo pacman -Syu

# Install yay manually if needed
sudo pacman -S --needed base-devel git
git clone https://aur.archlinux.org/yay.git
cd yay && makepkg -si
```

## Runtime Issues

### No Taskbar/Panel After Login
The installer now automatically configures DMS. If issues persist:

```bash
# Check if DMS is running
ps aux | grep dms

# Restart DMS if needed
pkill dms
dms run &
```

### niri Session Not Available
```bash
# Verify niri desktop entry exists
ls /usr/share/wayland-sessions/niri.desktop

# If missing, run setup again
./scripts/setup-niri.sh
```

### Applications Not Opening
```bash
# Check if applications are installed
which konsole ghostty dolphin

# Verify keybindings in niri config
grep -A 5 "binds" ~/.config/niri/config.kdl
```

## Recovery Steps

### Reset Configuration
```bash
# Backup current configs
mv ~/.config/niri ~/.config/niri.backup
mv ~/.config/dms ~/.config/dms.backup

# Reinstall configs
./scripts/setup-niri.sh
./scripts/setup-apps.sh
```

### Complete Reinstall
```bash
# Remove installed packages (optional)
# Then run installer again
./scripts/install.sh
```

## Getting Help

If problems persist:
1. Check system logs: `journalctl --user -xe`
2. Verify all packages: `pacman -Q | grep -E "(niri|dms|konsole)"`
3. Test in a new user account to isolate issues
