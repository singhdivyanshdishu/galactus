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
    
    # Check Node.js version and warn about potential issues
    local node_version=$(node --version 2>/dev/null || echo "not found")
    log_info "Current Node.js version: $node_version"
    
    # Clear npm cache to prevent module resolution issues
    npm cache clean --force 2>/dev/null || true
    
    # Install common global packages with better error handling
    packages=(
        "yarn"
        "pnpm" 
        "typescript"
        "ts-node"
        "nodemon"
        "prettier"
        "eslint"
    )
    
    for package in "${packages[@]}"; do
        log_info "Installing $package..."
        if npm list -g "$package" &>/dev/null; then
            log_info "$package is already installed globally"
        else
            sudo npm install -g "$package" --no-audit --no-fund 2>/dev/null || {
                log_warning "Failed to install $package globally"
            }
        fi
    done
    
    log_success "Node.js development tools installation completed"
}

setup_vscode() {
    log_info "Setting up VS Code extensions..."
    
    if command_exists code; then
        # Check Node.js version compatibility
        local node_version=$(node --version 2>/dev/null | cut -d'v' -f2 | cut -d'.' -f1)
        if [[ -n "$node_version" && "$node_version" -lt 18 ]]; then
            log_warning "Node.js version $node_version may cause issues. Consider upgrading to v18+"
        fi
        
        # Install useful extensions with better error handling
        extensions=(
            "ms-python.python"
            "ms-vscode.vscode-typescript-next"
            "esbenp.prettier-vscode"
            "dbaeumer.vscode-eslint"
            "bradlc.vscode-tailwindcss"
        )
        
        for ext in "${extensions[@]}"; do
            log_info "Installing $ext..."
            
            # Check if extension is already installed
            if code --list-extensions | grep -q "^$ext$"; then
                log_info "$ext is already installed, skipping..."
                continue
            fi
            
            # Install with timeout and error handling
            timeout 60 code --install-extension "$ext" --force 2>/dev/null || {
                log_warning "Failed to install $ext (timeout or error)"
                # Try alternative installation method
                log_info "Retrying $ext installation..."
                timeout 30 code --install-extension "$ext" --no-verify 2>/dev/null || {
                    log_warning "Skipping $ext due to installation issues"
                }
            }
        done
        
        log_success "VS Code extensions installation completed"
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
