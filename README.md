# Dot-files

_The **\<user\>** template means your user's name_

## Where to which files these links refer to

🖿 `/home/\<user\>/.tmux` -> `.tmux`

🖿 `/home/\<user\>/.tmux.conf.local` -> `.tmux.conf.local`

#! `/home/\<user\>/.zshrc` -> `.zshrc`

🖿 `/home/\<user\>/.config/alacritty` -> `alacritty`

🖿 `/home/\<user\>/.config/htop` -> `htop`

🖿 `/home/\<user\>/.config/neofetch` -> `neofetch`

🖿 `/home/\<user\>/.config/nvim` -> `nvim`

🖿 `/home/\<user\>/.vim` -> `.vim`

🖿 `/home/\<user\>/.config/procps` -> `procps`

## Fonts

In terminals such as alacritty or wezterm I use Dank Mono Nerd Font. You can install it <a href="https://eng.fontke.com/search/font/Dank%20Mono/">here</a> or you can use your own font.

## Script:

### sync_dotfiles – Dotfile Synchronization Script

#### Description

This script is designed to automatically synchronize configuration files from the `~/dotfiles` directory by creating symbolic links to them in appropriate system locations. It helps manage personal configuration files (dotfiles) in a centralized way, ideal for version control using Git.

#### Purpose

- Centralize and manage dotfiles in one place.
- Automate symlink creation for easy deployment.
- Keep system configs consistent and clean.
- Facilitate dotfile management through a Git repository.

#### What the script does:

1. **Creates symbolic links** for all files in `~/dotfiles`, except those listed in the ignore list.
   - Files specified in `HOME_TARGET_ITEMS` are symlinked into the home directory (`~`).

   - All other files are symlinked into `~/.config`.

2. **Checks `~/.config contents`:**
   - If a file/directory is not a symlink:
     - If it exists in `~/dotfiles`, it's removed locally and re-linked.
     - If it doesn't exist in `~/dotfiles`, it's moved there and linked.
3. **Ignores specific files** like `README.md`, .git and `sync_dotfiles.sh`.

#### How to use:

1. Save the script as `~/bin/sync_dotfiles`
2. Make it executable:
   ```bash
   chmod +x ~/bin/sync_dotfiles
   ```
3. Run it:
   ```zsh
   sync_dotfiles
   ```

**These script mean that the dotfiles directory is located along the path `~/dotfiles`, which contains these scripts.**

#### Tools for linux

delta -- prettier git diff. Install it by: `sudo pacman -S delta`
fzf -- the best fuzzy finder. Install it by: `sudo pacman -S fzf`
eza -- like ls but cooler. Install it by: `sudo pacman -S eza`
bat -- like bat but cooler. Install it by: `sudo pacman -S bat`
thefuck -- fuck. Install it by: `sudo pacman -S thefuck`
zoxide -- or z is like cd but more cooler and lazier. Install it by: `sudo pacman -S zoxide`
