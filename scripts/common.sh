#!/bin/bash

# Common functions for dotfiles installation scripts

# Colors for output
RED='\033[0;31m'
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
BLUE='\033[0;34m'
NC='\033[0m' # No Color

# Logging functions
log_info() { echo -e "${BLUE}[INFO]${NC} $1"; }
log_success() { echo -e "${GREEN}[SUCCESS]${NC} $1"; }
log_warning() { echo -e "${YELLOW}[WARNING]${NC} $1"; }
log_error() { echo -e "${RED}[ERROR]${NC} $1"; }

# Backup existing config
backup_config() {
    local config_path="$1"
    if [[ -e "$config_path" ]]; then
        local backup_path="${config_path}.backup.$(date +%Y%m%d_%H%M%S)"
        mv "$config_path" "$backup_path"
        log_warning "Backed up existing config to $backup_path"
    fi
}

# Create directory if it doesn't exist
ensure_dir() {
    local dir_path="$1"
    if [[ ! -d "$dir_path" ]]; then
        mkdir -p "$dir_path"
        log_info "Created directory: $dir_path"
    fi
}

# Copy config file with backup
install_config() {
    local source="$1"
    local destination="$2"
    
    ensure_dir "$(dirname "$destination")"
    backup_config "$destination"
    cp "$source" "$destination"
    log_success "Installed config: $(basename "$destination")"
}

# Check if command exists
command_exists() {
    command -v "$1" >/dev/null 2>&1
}

# Enable systemd service
enable_service() {
    local service="$1"
    local user_service="${2:-false}"
    
    if [[ "$user_service" == "true" ]]; then
        systemctl --user enable "$service"
        log_success "Enabled user service: $service"
    else
        sudo systemctl enable "$service"
        log_success "Enabled system service: $service"
    fi
}
