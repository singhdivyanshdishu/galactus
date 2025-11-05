# Development Environment

## Programming Languages

### Python
- **Version**: Latest from Arch repos
- **Package Manager**: pip (included)
- **Virtual Environments**: venv module available
- **Usage**: `python -m venv myproject`

### JavaScript/Node.js
- **Version**: Latest LTS from Arch repos
- **Package Manager**: npm (included)
- **Global packages**: Install with `npm install -g package`
- **Project setup**: `npm init` for new projects

### Build Tools
- **base-devel**: Essential compilation tools
- **GCC**: C/C++ compiler
- **Make**: Build automation
- **Git**: Version control

## Code Editor

### Visual Studio Code
- **Installation**: AUR binary package (faster startup)
- **Extensions**: Install from marketplace as needed
- **Settings**: Sync available with Microsoft account
- **Terminal**: Integrated terminal uses system shell

### Recommended Extensions
- **Language Support**: Python, JavaScript, etc.
- **Git**: GitLens for enhanced Git integration
- **Themes**: Material Theme, One Dark Pro
- **Productivity**: Bracket Pair Colorizer, Auto Rename Tag

## Terminal Development

### Shell: Bash + Starship
- **Prompt**: Starship for rich, informative prompt
- **Git integration**: Shows branch, status in prompt
- **Language detection**: Displays current project language
- **Performance**: Fast, responsive prompt

### Terminal Multiplexing
- **Built-in**: Use niri's window management
- **Alternative**: Install tmux if needed
- **Tabs**: Konsole and Ghostty support tabs

## Version Control

### Git Configuration
```bash
git config --global user.name "Your Name"
git config --global user.email "your.email@example.com"
git config --global init.defaultBranch main
```

### SSH Keys
```bash
ssh-keygen -t ed25519 -C "your.email@example.com"
eval "$(ssh-agent -s)"
ssh-add ~/.ssh/id_ed25519
```

## Package Management

### System Packages
- **pacman**: Official Arch packages
- **yay**: AUR helper for community packages

### Language-Specific
- **pip**: Python packages (`pip install package`)
- **npm**: Node.js packages (`npm install package`)

### Development Workflow

1. **Project Setup**: Create directory, initialize Git
2. **Environment**: Set up language-specific environment
3. **Dependencies**: Install required packages
4. **Development**: Use VS Code or terminal editors
5. **Version Control**: Regular commits with Git
6. **Testing**: Run tests in terminal or VS Code

## System Integration

### File Associations
- **Code files**: Open in VS Code by default
- **Text files**: Terminal editors available
- **Projects**: Easy navigation with Dolphin

### Clipboard Integration
- **cliphist**: Clipboard manager for code snippets
- **wl-clipboard**: Wayland clipboard utilities
- **VS Code**: Integrated clipboard support
