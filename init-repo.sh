#!/bin/bash

# Initialize Git Repository for Dotfiles

cd "$(dirname "$0")"

echo "🚀 Initializing Galactus Dotfiles Repository..."

# Initialize git repo
git init

# Create .gitignore
cat > .gitignore << EOF
# Backup files
*.backup.*
*~

# OS generated files
.DS_Store
.DS_Store?
._*
.Spotlight-V100
.Trashes
ehthumbs.db
Thumbs.db

# Logs
*.log

# Temporary files
*.tmp
*.temp

# Personal files (add your own)
config/*/personal/
secrets/
EOF

# Add all files
git add .

# Initial commit
git commit -m "🎉 Initial commit: Galactus dotfiles

- Modern Arch Linux setup with niri compositor
- Comprehensive application configurations
- Automated installation scripts
- Complete documentation

Features:
- niri Wayland compositor with custom keybinds
- Dolphin file manager with transparency
- Konsole + Ghostty terminals
- Development environment (Python, Node.js, VS Code)
- Custom themes and icons (Breeze Dark + Papirus)
- Media controls and system integration"

echo "✅ Repository initialized!"
echo ""
echo "Next steps:"
echo "1. Create a GitHub repository"
echo "2. git remote add origin https://github.com/yourusername/dotfiles.git"
echo "3. git branch -M main"
echo "4. git push -u origin main"
echo ""
echo "Repository structure:"
tree -L 2 2>/dev/null || find . -type d -not -path './.git*' | head -20
