# Dotfiles

Personal dotfiles for macOS and Linux, managed with [dotbot](https://github.com/anishathalye/dotbot).

## Structure

```
dotfiles/
├── home/                     # Config files symlinked into $HOME
│   ├── config/               # ~/.config/* (alacritty, tmux, zsh, bash, etc.)
│   ├── claude/               # Claude Code config
│   ├── bashrc
│   ├── gitconfig
│   ├── tmux.conf
│   ├── vim/
│   ├── vimrc
│   └── zshenv
├── macos/                    # macOS-specific: Brewfile, Caskfiles, iTerm2 config
├── shell/                    # Shell scripts (setup, platform installers, clone, ssh)
├── functions/                # Utility scripts
├── fonts/                    # Fonts
├── dotbot/                   # Dotbot submodule
├── dotbot.default.yaml       # Main dotbot config (always applied)
├── dotbot.personal.yaml      # Personal brew casks
├── dotbot.setup-once.yaml    # One-time setup (macOS defaults, repo clones)
└── install                   # Main install script
```

## Installation

```sh
# Default setup (symlinks + shell plugins)
./install

# First-time macOS setup (run once: Xcode tools, macOS defaults, clone repos)
./install setup-once

# Personal apps (brew cask installs from Caskfile.personal)
./install personal
```

## How It Works

- `./install` runs dotbot with `dotbot.default.yaml` plus any additional configs passed as arguments
- Dotbot creates symlinks from `home/` into `$HOME`, creates directories, and runs shell commands. Folders in `home/config` are symlinked to `~/.config/<folder>`
- Platform detection: macOS runs `shell/install_apps_macos.sh`, Linux runs `shell/install_apps_linux.sh`
- Submodules: dotbot, tpm, Vundle.vim, and several zsh/bash plugins — run `git submodule update --init --recursive` if anything is missing

## Important: `.local` files

Files matching `*.local` (e.g. `.zshrc.local`, `.gitconfig.local`, `.bash_profile.local`) are **machine-specific overrides** that exist only on the local machine. They are gitignored and not part of this repo. Do not modify, reference, or suggest changes to `.local` files.

## Adding Config for a New Tool

1. Put the config file under `home/config/<tool>/` or directly in `home/`
2. Add a `link:` entry in `dotbot.default.yaml` pointing from the repo path to the target path in `$HOME`
3. If it needs a directory created first, add it under `create:` in the same file
4. Run `./install` to apply

## Key Configs

| File | Linked to |
|------|-----------|
| `home/zshenv` | `~/.zshenv` |
| `home/gitconfig` | `~/.gitconfig` |
| `home/config/alacritty/` | `~/.config/alacritty/` |
| `home/config/tmux/` | `~/.config/tmux/` |
| `home/config/vim/` | `~/.vim/` |
| `home/config/zsh/` | `~/.config/zsh/` |
| `home/config/bash/` | `~/.config/bash/` |
