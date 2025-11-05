# Base System Setup

## Prerequisites

- Fresh Arch Linux installation
- Internet connection
- User with sudo privileges

## Quick Start

```bash
git clone https://github.com/singhdivyanshdishu/galactus.git
cd galactus
chmod +x scripts/install.sh
./scripts/install.sh
```

The installer will:
1. Update system packages
2. Install yay AUR helper
3. Install all required packages
4. Configure niri compositor
5. Set up applications and themes
6. Configure development environment
7. Start DMS for taskbar and shortcuts

## Manual Steps (if needed)

If the automated installer fails, you can run components individually:

```bash
./scripts/packages.sh      # Install packages
./scripts/setup-niri.sh    # Configure niri
./scripts/setup-apps.sh    # Configure applications
./scripts/setup-themes.sh  # Apply themes
./scripts/setup-dev.sh     # Development tools
```

## Post-Installation

1. Reboot your system
2. Select "niri" from login manager
3. Log in to your new environment
