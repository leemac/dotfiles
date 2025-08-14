# ~/.zshenv - Zsh environment variables
# This file is loaded for all zsh shells (login, interactive, non-interactive)

# Homebrew paths (Apple Silicon Mac)
export PATH="/opt/homebrew/bin:/opt/homebrew/sbin:$PATH"

# User binaries
export PATH="$HOME/.local/bin:$PATH"
export PATH="$HOME/bin:$PATH"

# Ruby (rbenv)
export PATH="$HOME/.rbenv/bin:$PATH"

# Python
export PATH="$HOME/.pyenv/bin:$PATH"

# Node.js
export PATH="$HOME/.nvm/bin:$PATH"

# Go
export GOPATH="$HOME/go"
export PATH="$GOPATH/bin:$PATH"

# Rust
export PATH="$HOME/.cargo/bin:$PATH"

# Dotnet
export PATH="/opt/homebrew/opt/dotnet@6/bin:$PATH"

# PostgreSQL
export PATH="/opt/homebrew/opt/postgresql@14/bin:$PATH"

# Common environment variables
export EDITOR="nvim"
export VISUAL="nvim"
export PAGER="less"
export BROWSER="open"

# Development
export EXECJS_RUNTIME="Node"

# GPG
export GPG_TTY=$(tty)

# XDG Base Directory Specification
export XDG_CONFIG_HOME="$HOME/.config"
export XDG_DATA_HOME="$HOME/.local/share"
export XDG_CACHE_HOME="$HOME/.cache"

# History
export HISTFILE="$HOME/.zsh_history"
export HISTSIZE=10000
export SAVEHIST=10000

# Less configuration
export LESS='-R'
export LESSOPEN='|~/.lessfilter %s'
