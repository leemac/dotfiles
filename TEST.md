# Testing Your Dotfiles Setup

Since you have only one Mac, here are safe ways to test your dotfiles without disrupting your current environment:

## Option 1: Test User Account (Recommended) ⭐

Create a temporary user account to test the full installation:

```bash
# 1. Create a new user account
# Go to: System Preferences > Users & Groups > Add Account (+)
# Create a new Standard account named "dotfiles-test"

# 2. Switch to the test account
# Log out and log in as "dotfiles-test"

# 3. Test your dotfiles
git clone https://github.com/your-username/dotfiles.git ~/dotfiles
cd ~/dotfiles
./install.sh

# 4. Verify everything works
# Test terminal, git, ssh connections, etc.

# 5. Clean up when done
# Log back to your main account
# Delete the test user account from System Preferences
```

**Pros:** Complete isolation, tests everything, safe
**Cons:** Requires creating/deleting user account

## Option 2: Docker Container Test

Test the installation in a macOS-like environment:

```bash
# This won't work perfectly since Docker containers can't fully replicate macOS,
# but you can test the script logic:

# Create a test script that simulates the environment
cp install.sh test-install.sh
# Edit test-install.sh to use echo/dry-run mode instead of actual installation
```

## Option 3: Backup & Restore Test

Test on your current account with full backup:

```bash
# 1. Create comprehensive backup
mkdir ~/dotfiles-backup-test
cp ~/.zshrc ~/.zshenv ~/.gitconfig ~/.ssh/config ~/dotfiles-backup-test/ 2>/dev/null || true

# 2. Test your dotfiles (they'll create their own backup too)
cd ~/dotfiles
./install.sh

# 3. Verify everything works
source ~/.zshrc
git status
ssh -T git@github.com  # Test SSH

# 4. If something goes wrong, restore from backup
cp ~/dotfiles-backup-test/* ~/
```

**Pros:** Tests on real environment
**Cons:** Small risk if backup fails

## Option 4: Dry Run Mode

Modify the install script to show what it would do without doing it:

```bash
# Add this to the top of install.sh for testing:
DRY_RUN=true

# Then modify commands like:
if [[ "$DRY_RUN" == "true" ]]; then
    echo "Would run: ln -sf $source $target"
else
    ln -sf "$source" "$target"
fi
```

## Option 5: Virtual Machine

If you have enough resources:

```bash
# 1. Install UTM or Parallels Desktop
# 2. Create a macOS VM
# 3. Test dotfiles in the VM
# 4. Take snapshots before/after for easy rollback
```

## Recommended Testing Flow

1. **Start with Option 1** (test user account) - safest and most thorough
2. **Use Option 3** (backup & restore) if you're confident
3. **Option 4** (dry run) to debug script issues

## What to Test

- ✅ Script runs without errors
- ✅ All symlinks are created correctly
- ✅ Terminal loads with your zsh config
- ✅ Git commands work with your config
- ✅ SSH connections work to your hosts
- ✅ Homebrew packages are installed
- ✅ macOS defaults are applied
- ✅ FZF integration works
- ✅ All development tools are accessible

## Quick Verification Commands

```bash
# After installation, run these to verify:
echo "Checking symlinks..."
ls -la ~/.zshrc ~/.zshenv ~/.gitconfig ~/.ssh/config

echo "Checking git config..."
git config --list | head -10

echo "Checking SSH config..."
ssh -T git@github.com

echo "Checking installed tools..."
which brew git node python3 rbenv

echo "Checking zsh plugins..."
echo $plugins
```

The **test user account approach** is your best bet - it's completely safe and tests everything exactly as it would work on a fresh Mac!

