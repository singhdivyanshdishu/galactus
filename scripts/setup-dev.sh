#!/bin/bash

# Development Environment Setup Script

set -e
source "$(dirname "$0")/common.sh"

setup_git() {
    log_info "Setting up Git configuration..."
    
    # Check if git is already configured
    if ! git config --global user.name &>/dev/null; then
        log_info "Git user not configured. Please set up manually with:"
        log_info "git config --global user.name 'Your Name'"
        log_info "git config --global user.email 'your.email@example.com'"
    else
        log_info "Git already configured for $(git config --global user.name)"
    fi
    
    # Set up some useful git aliases
    git config --global alias.st status
    git config --global alias.co checkout
    git config --global alias.br branch
    git config --global alias.ci commit
    git config --global alias.unstage 'reset HEAD --'
    git config --global alias.last 'log -1 HEAD'
    git config --global alias.visual '!gitk'
    
    log_success "Git aliases configured"
}

setup_python() {
    log_info "Setting up Python development environment..."
    
    # Install Python development tools via pacman
    sudo pacman -S --needed --noconfirm python-pipx python-virtualenv
    
    # Install development tools via pipx (isolated environments)
    pipx install black
    pipx install flake8
    pipx install mypy
    
    log_success "Python development tools installed"
}

setup_node() {
    log_info "Setting up Node.js development environment..."
    
    # Install common global packages
    npm install -g yarn pnpm typescript ts-node nodemon prettier eslint
    
    log_success "Node.js development tools installed"
}

setup_vscode() {
    log_info "Setting up VS Code extensions..."
    
    if command_exists code; then
        # Install useful extensions
        code --install-extension ms-python.python
        code --install-extension ms-vscode.vscode-typescript-next
        code --install-extension esbenp.prettier-vscode
        code --install-extension ms-vscode.vscode-eslint
        code --install-extension bradlc.vscode-tailwindcss
        code --install-extension ms-vscode.vscode-json
        
        log_success "VS Code extensions installed"
    else
        log_warning "VS Code not found, skipping extension installation"
    fi
}

main() {
    log_info "Setting up development environment..."
    
    setup_git
    setup_python
    setup_node
    setup_vscode
    
    log_success "Development environment setup complete!"
}

main "$@"
