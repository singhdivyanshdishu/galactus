# Galactus Dotfiles

Modern Arch Linux setup with niri compositor, optimized for development and productivity.

## 🖥️ System Overview

- **OS**: Arch Linux x86_64
- **Compositor**: niri (Wayland)
- **Theme**: Breeze Dark + Papirus Icons
- **Terminal**: Konsole + Ghostty
- **File Manager**: Dolphin (customized)
- **Browser**: Zen Browser + Firefox
- **Shell**: Bash + Starship

## 🚀 Quick Setup

```bash
git clone https://github.com/singhdivyanshdishu/galactus.git
cd galactus
chmod +x scripts/install.sh
./scripts/install.sh
```

## 📁 Structure

```
galactus/
├── config/           # Configuration files
│   ├── niri/         # niri compositor config
│   ├── konsole/      # terminal profiles
│   ├── dolphin/      # file manager settings
│   ├── ghostty/      # terminal config
│   ├── starship/     # shell prompt config
│   └── bash/         # bash configuration
├── scripts/          # Installation scripts
│   ├── install.sh    # Main installer
│   ├── packages.sh   # Package installation
│   └── setup-*.sh    # Component setups
└── docs/             # Documentation
    ├── KEYBINDS.md   # Keyboard shortcuts
    └── APPS.md       # Application list
```

## ⚡ Features

- **Modern Wayland Setup**: niri tiling compositor
- **Transparency Effects**: Dolphin with 85%/75% opacity
- **Rich Keybindings**: Comprehensive shortcuts
- **Development Ready**: Python, Node.js, VS Code
- **Media Controls**: MPV, playerctl integration
- **Custom Themes**: Dank colors throughout
- **Random Fastfetch**: 6 variants on terminal startup

## 📋 Installation Steps

1. [Base System Setup](docs/01-base-system.md)
2. [niri Installation](docs/02-niri-setup.md)
3. [Applications](docs/03-applications.md)
4. [Customization](docs/04-customization.md)
5. [Development Environment](docs/05-development.md)

## 🎯 Key Applications

| Category | Application | Purpose |
|----------|-------------|---------|
| Compositor | niri | Wayland tiling WM |
| Terminal | Konsole/Ghostty | Primary terminals |
| File Manager | Dolphin | Customized with transparency |
| Browser | Zen Browser | Privacy-focused |
| Editor | VS Code | Development |
| Media | MPV | Video player |

## ⌨️ Essential Keybinds

- `Super+T` - Terminal
- `Super+E` - File Manager
- `Super+Z` - Browser
- `Super+Space` - App Launcher
- `Super+P` - Media Player
- `Super+Ctrl+P` - Audio Control

## 🛠️ Customizations

- **Dolphin**: Transparency + Papirus icons
- **niri**: 5 preset column widths
- **Konsole**: DankProfile theme
- **Starship**: Custom prompt
- **Fastfetch**: Multiple variants

## 📝 License

MIT License - Feel free to use and modify!
