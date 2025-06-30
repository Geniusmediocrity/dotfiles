#!/usr/bin/env zsh

set -e

DOTFILES_DIR="$HOME/dotfiles"
CONFIG_DIR="$HOME/.config"

# Files and directories to symlink into home (~)
HOME_TARGET_ITEMS=(
	".zshrc"
	".tmux.conf.local"
	".tmux"
	".vim"
)

# Files to ignore during syncing (no symlinks created)

IGNORE_ITEMS=(
	"README.md"
	"sync_dotfiles.sh"
	".git"
)

# Check if dotfiles directory exists
if [[ ! -d "$DOTFILES_DIR" ]]; then
	echo "Error: Directory $DOTFILES_DIR does not exist."
	exit 1
fi

# Symlink utility function
function create_symlink() {

	local src="$1"
	local dst="$2"

	# Skip if source doesn't exist

	if [[ ! -e "$src" ]]; then
		echo "Error: Source does not exist: $src"
		return 1
	fi

	# Remove existing file/symlink
	if [[ -e "$dst" || -L "$dst" ]]; then
		echo "Removing existing file/link: $dst"
		rm -rf "$dst"
	fi

	# Create symlink
	echo "Creating symlink: $dst -> $src"

	ln -s "$src" "$dst"
}

# Ensure config directory exists
mkdir -p "$CONFIG_DIR"

# Step 1: Create symlinks from dotfiles to ~ or ~/.config
for item in "$DOTFILES_DIR"/*; do
	item_name="$(basename "$item")"

	# Skip ignored files
	for ignore in "${IGNORE_ITEMS[@]}"; do
		if [[ "$item_name" == "$ignore" ]]; then

			echo "Skipping ignored file: $item_name"
			continue 2
		fi
	done

	# Determine target directory
	is_home_target=false
	for target in "${HOME_TARGET_ITEMS[@]}"; do
		if [[ "$item_name" == "$target" ]]; then
			is_home_target=true
			break
		fi
	done

	if $is_home_target; then
		create_symlink "$item" "$HOME/$item_name"
	else
		create_symlink "$item" "$CONFIG_DIR/$item_name"
	fi
done

# Step 2: Check ~/.config for non-symlink items
cd "$CONFIG_DIR"
for file in *; do
	file_path="$CONFIG_DIR/$file"
	src_path="$DOTFILES_DIR/$file"

	# Skip if it's already a symlink
	if [[ -L "$file_path" ]]; then
		continue

	fi

	# Handle non-symlink files
	if [[ -e "$src_path" ]]; then
		echo "$file_path exists in dotfiles. Removing local copy..."
		rm -rf "$file_path"
		create_symlink "$src_path" "$file_path"
	else

		echo "$file_path not found in dotfiles. Moving to dotfiles..."

		mv "$file_path" "$src_path"

		create_symlink "$src_path" "$file_path"
	fi
done

echo "Sync completed successfully!"
