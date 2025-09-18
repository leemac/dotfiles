# Dotfiles

Personal dotfiles for macOS development environment setup.

## Quick Start

```bash
git clone https://github.com/your-username/dotfiles.git ~/dotfiles
cd ~/dotfiles
./install.sh
```

## What's Included

This dotfiles setup includes only the configurations I actually use:

- **🏠 Shell Configuration** - Zsh with Oh My Zsh (minimal setup)
- **📦 Package Management** - Homebrew with curated development tools
- **🔧 Git Configuration** - Personal Git settings and aliases
- **🔐 SSH Configuration** - Host configurations for development servers
- **🖥️ macOS Defaults** - System preferences optimized for development

## File Structure

```
dotfiles/
├── config/
│   ├── .gitconfig      # Git configuration and user settings
│   └── ssh_config      # SSH host configurations
├── zsh/
│   ├── .zshrc          # Zsh shell configuration with Oh My Zsh
│   └── .zshenv         # Environment variables (minimal)
├── bin/                # Custom scripts (empty, ready for future use)
├── Brewfile           # Homebrew packages and applications
├── install.sh         # Main installation script
├── macos-defaults.sh  # macOS system preferences
└── README.md          # This file
```

## Installation Process

The `install.sh` script will:

1. **Install Xcode Command Line Tools** (if not present)
2. **Install Homebrew** (if not present)
3. **Install packages** from Brewfile
4. **Install Oh My Zsh** (if not present)
5. **Backup existing dotfiles** to `~/dotfiles_backup_<timestamp>`
6. **Create symlinks** for all configuration files:
   - `zsh/.zshrc` → `~/.zshrc`
   - `zsh/.zshenv` → `~/.zshenv`
   - `config/.gitconfig` → `~/.gitconfig`
   - `config/ssh_config` → `~/.ssh/config`
7. **Apply macOS defaults** (system preferences)
8. **Install additional development tools** (Python/Node packages)
9. **Set up FZF** key bindings
10. **Set Zsh as default shell** (if needed)

## Customization

### Local Customizations
- Add personal shell customizations to `~/.zshrc.local` (automatically sourced)
- Add personal environment variables to `~/.zshenv.local` (automatically sourced)

### Modifying Packages
- Edit `Brewfile` to add/remove Homebrew packages
- Run `brew bundle install` to install new packages
- Run `brew bundle cleanup` to remove unused packages

### macOS Settings
- Modify `macos-defaults.sh` to adjust system preferences
- Re-run the script: `bash macos-defaults.sh`

## Key Features

### Minimal & Clean
- Only includes configurations I actually use
- No bloated templates or unused settings
- Focused on essential development tools

### Safe Installation
- Backs up existing configurations before making changes
- Uses symlinks (easy to update/remove)
- Non-destructive installation process

### Development-Focused
- Curated set of development tools and languages
- Git configuration with useful aliases
- SSH setup for development servers
- FZF integration for better command-line experience

## Included Tools & Languages

**Languages & Runtimes:**
- Node.js, Python, Ruby, Go, Rust
- Multiple Python versions with pyenv support

**Development Tools:**
- Git, GitHub CLI, Terraform, Ansible
- Docker support, AWS CLI, DigitalOcean CLI
- Neovim, tmux, ripgrep, fzf

**System Tools:**
- btop, htop for system monitoring
- Various compression and networking tools

**Applications:**
- Visual Studio Code, Google Chrome
- Alacritty terminal, Stats system monitor
- 1Password CLI, VLC, and more

## Backup & Recovery

- All existing dotfiles are backed up to `~/dotfiles_backup_<timestamp>`
- To restore: copy files from backup directory back to home directory
- To remove dotfiles: delete symlinks and restore from backup

## Testing & Development

See the testing section below for safe ways to test changes without affecting your current setup.

## License

Personal dotfiles - use at your own discretion.