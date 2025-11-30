# Dotfiles

My personal dotfiles for Arch Linux with Hyprland.

## What's Included

| Package | Description |
|---------|-------------|
| `zsh` | Zsh config with Powerlevel10k theme |
| `bash` | Bash config |
| `tmux` | Tmux with vim-style navigation |
| `nvim` | Neovim with Lazy plugin manager |
| `hypr` | Hyprland window manager |
| `waybar` | Status bar |
| `rofi` | Application launcher with custom menus |
| `git` | Global gitignore |

## Requirements

- [GNU Stow](https://www.gnu.org/software/stow/)
- [Oh My Zsh](https://ohmyz.sh/) (for zsh config)
- [Powerlevel10k](https://github.com/romkatv/powerlevel10k) (zsh theme)

## Installation

```bash
# Clone the repo
git clone git@github.com:Machilio/dotfiles.git ~/dotfiles

# Install stow
sudo pacman -S stow

# Install all configs
cd ~/dotfiles
stow zsh bash tmux nvim hypr waybar rofi git

# Or install specific packages
stow nvim
stow hypr waybar
```

## Uninstalling

```bash
cd ~/dotfiles
stow -D zsh bash tmux nvim hypr waybar rofi git
```

## Updating

After editing configs in `~/dotfiles/`, commit and push:

```bash
cd ~/dotfiles
git add .
git commit -m "Update configs"
git push
```

## Structure

```
~/dotfiles/
├── zsh/
│   ├── .zshrc
│   └── .p10k.zsh
├── bash/
│   ├── .bashrc
│   └── .bash_profile
├── tmux/
│   └── .tmux.conf
├── nvim/
│   └── .config/nvim/
├── hypr/
│   └── .config/hypr/
├── waybar/
│   └── .config/waybar/
├── rofi/
│   └── .config/rofi/
└── git/
    └── .config/git/
```

Each directory is a "stow package" that mirrors the home directory structure.
