#!/bin/bash

# Dotfiles Installation Script for macOS
# This script sets up a new Mac with all the essential tools and configurations

set -e

# Colors for output
RED='\033[0;31m'
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
BLUE='\033[0;34m'
NC='\033[0m' # No Color

# Logging functions
log_info() {
    echo -e "${BLUE}[INFO]${NC} $1"
}

log_success() {
    echo -e "${GREEN}[SUCCESS]${NC} $1"
}

log_warning() {
    echo -e "${YELLOW}[WARNING]${NC} $1"
}

log_error() {
    echo -e "${RED}[ERROR]${NC} $1"
}

# Check if running on macOS
if [[ "$OSTYPE" != "darwin"* ]]; then
    log_error "This script is designed for macOS only."
    exit 1
fi

log_info "Starting dotfiles installation for macOS..."

# Get the directory where this script is located
DOTFILES_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"

# Install Xcode Command Line Tools
log_info "Installing Xcode Command Line Tools..."
if ! xcode-select -p &>/dev/null; then
    xcode-select --install
    log_warning "Please complete the Xcode Command Line Tools installation and run this script again."
    exit 1
else
    log_success "Xcode Command Line Tools already installed"
fi

# Install Homebrew
log_info "Installing Homebrew..."
if ! command -v brew &>/dev/null; then
    /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
    
    # Add Homebrew to PATH for Apple Silicon Macs
    if [[ $(uname -m) == 'arm64' ]]; then
        echo 'eval "$(/opt/homebrew/bin/brew shellenv)"' >> ~/.zprofile
        eval "$(/opt/homebrew/bin/brew shellenv)"
    fi
    
    log_success "Homebrew installed successfully"
else
    log_success "Homebrew already installed"
    brew update
fi

# Install packages from Brewfile
log_info "Installing packages from Brewfile..."
if [[ -f "$DOTFILES_DIR/Brewfile" ]]; then
    cd "$DOTFILES_DIR"
    brew bundle install
    log_success "All Homebrew packages installed"
else
    log_error "Brewfile not found in $DOTFILES_DIR"
    exit 1
fi

# Install Oh My Zsh
log_info "Installing Oh My Zsh..."
if [[ ! -d "$HOME/.oh-my-zsh" ]]; then
    sh -c "$(curl -fsSL https://raw.github.com/ohmyzsh/ohmyzsh/master/tools/install.sh)" "" --unattended
    log_success "Oh My Zsh installed successfully"
else
    log_success "Oh My Zsh already installed"
fi

# Backup existing dotfiles
log_info "Backing up existing dotfiles..."
backup_dir="$HOME/dotfiles_backup_$(date +%Y%m%d_%H%M%S)"
mkdir -p "$backup_dir"

dotfiles=(".zshrc" ".zshenv" ".gitconfig")
for file in "${dotfiles[@]}"; do
    if [[ -f "$HOME/$file" ]]; then
        cp "$HOME/$file" "$backup_dir/"
        log_info "Backed up $file to $backup_dir"
    fi
done

# Also backup SSH config if it exists
if [[ -f "$HOME/.ssh/config" ]]; then
    mkdir -p "$backup_dir/.ssh"
    cp "$HOME/.ssh/config" "$backup_dir/.ssh/"
    log_info "Backed up SSH config to $backup_dir"
fi

# Create symlinks for dotfiles
log_info "Creating symlinks for dotfiles..."

# Link Zsh configuration files
if [[ -f "$DOTFILES_DIR/zsh/.zshrc" ]]; then
    ln -sf "$DOTFILES_DIR/zsh/.zshrc" "$HOME/.zshrc"
    log_success "Linked .zshrc"
else
    log_warning ".zshrc not found in zsh/ directory"
fi

if [[ -f "$DOTFILES_DIR/zsh/.zshenv" ]]; then
    ln -sf "$DOTFILES_DIR/zsh/.zshenv" "$HOME/.zshenv"
    log_success "Linked .zshenv"
else
    log_warning ".zshenv not found in zsh/ directory"
fi

# Link Git configuration
if [[ -f "$DOTFILES_DIR/config/.gitconfig" ]]; then
    ln -sf "$DOTFILES_DIR/config/.gitconfig" "$HOME/.gitconfig"
    log_success "Linked .gitconfig"
else
    log_warning ".gitconfig not found in config/ directory"
fi

# Set up SSH configuration
if [[ -f "$DOTFILES_DIR/config/ssh_config" ]]; then
    mkdir -p "$HOME/.ssh"
    chmod 700 "$HOME/.ssh"
    ln -sf "$DOTFILES_DIR/config/ssh_config" "$HOME/.ssh/config"
    chmod 600 "$HOME/.ssh/config"
    log_success "Linked SSH config"
else
    log_warning "ssh_config not found in config/ directory"
fi

# Set up macOS defaults
if [[ -f "$DOTFILES_DIR/macos-defaults.sh" ]]; then
    log_info "Applying macOS defaults..."
    bash "$DOTFILES_DIR/macos-defaults.sh"
    log_success "macOS defaults applied"
fi

# Install additional tools
log_info "Setting up additional development tools..."

# Install Python packages
if command -v pip3 &>/dev/null; then
    pip3 install --user --upgrade pip
    pip3 install --user pipenv virtualenv black flake8 mypy pytest
    log_success "Python packages installed"
fi

# Install Node.js packages
if command -v npm &>/dev/null; then
    npm install -g yarn pnpm typescript ts-node eslint prettier
    log_success "Node.js packages installed"
fi

# Set up FZF key bindings and fuzzy completion
if command -v fzf &>/dev/null; then
    $(brew --prefix)/opt/fzf/install --all --no-bash --no-fish
    log_success "FZF key bindings installed"
fi

# Change default shell to zsh
if [[ "$SHELL" != "/bin/zsh" ]] && [[ "$SHELL" != "/opt/homebrew/bin/zsh" ]]; then
    log_info "Changing default shell to zsh..."
    chsh -s /bin/zsh
    log_success "Default shell changed to zsh"
fi

# Final message
log_success "Dotfiles installation completed!"
log_info "Please restart your terminal or run 'source ~/.zshrc' to apply changes."
log_info "Backup of your previous dotfiles saved to: $backup_dir"

# Optional: Show next steps
echo ""
echo "🎉 Your Mac is now set up! Here are some next steps:"
echo "1. Restart your terminal"
echo "2. Git is already configured with your name and email"
echo "3. SSH config is already set up for your hosts"
echo "4. Customize your terminal theme and preferences if needed"
echo "5. Install any additional apps from the Mac App Store"
