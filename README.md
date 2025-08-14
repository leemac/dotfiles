# Dotfiles

Personal dotfiles for macOS development environment setup.

## Installation

```bash
git clone <your-repo-url> ~/dotfiles
cd ~/dotfiles
./install.sh
```

## Post-Installation Setup

After running the installation script, you'll need to configure a few personal settings:

### Git Configuration
Set your Git name and email:
```bash
git config --global user.name "Your Name"
git config --global user.email "your.email@example.com"
```

### Additional Setup
1. Restart your terminal or run `source ~/.zshrc`
2. Set up SSH keys for GitHub/GitLab
3. Configure any additional personal preferences

## What's Included

- **Homebrew packages** - Essential development tools and applications
- **Zsh configuration** - Oh My Zsh with useful plugins and aliases
- **Git configuration** - Sensible defaults, aliases, and global gitignore
- **macOS defaults** - System preferences optimized for development
- **Development environments** - Python, Node.js, Ruby, Go, Rust support

## Files

- `.zshrc` - Zsh shell configuration
- `.zshenv` - Environment variables and PATH setup
- `.gitconfig` - Git configuration and aliases
- `.gitignore_global` - Global gitignore patterns
- `Brewfile` - Homebrew packages and applications
- `install.sh` - Main installation script
- `macos-defaults.sh` - macOS system preferences

## Customization

- Add personal aliases to `~/.zshrc.local` (automatically sourced)
- Modify `Brewfile` to add/remove packages
- Adjust macOS defaults in `macos-defaults.sh`

## Backup

The installation script automatically backs up existing dotfiles to `~/dotfiles_backup_<timestamp>` before creating symlinks.
