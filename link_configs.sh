#! /usr/bin/bash

set -euo pipefail

# Colors
RED='\033[0;31m'
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
BLUE='\033[0;34m'
MAGENTA='\033[1;35m'
NC='\033[0m' # No Color

script_name=$(basename "$0")
version="1.0.0"

usage() {
	cat <<EOF
$(printf '\033[0;34m')Usage:$(printf '\033[0m') $script_name [OPTIONS]

$(printf '\033[0;34m')Options:$(printf '\033[0m')
  $(printf '\033[1;35m') -h, --help    $(printf '\033[0m')          Show this help and exit
  $(printf '\033[1;35m') -v, --version $(printf '\033[0m')          Show version and exit
  $(printf '\033[1;35m') -n, --dry-run $(printf '\033[0m')          Show what would be linked, without making changes
  $(printf '\033[1;35m') -f, --force   $(printf '\033[0m')          Skip confirmation and overwrite existing symbolic links
                          (but NOT regular files/dirs — safe by default!)
EOF
}

dry_run=false
force=false

while [[ $# -gt 0 ]]; do
	case $1 in
	-h | --help)
		usage
		exit 0
		;;
	-v | --version)
		echo "$script_name v$version"
		exit 0
		;;
	-f | --force)
		force=true
		;;
	-n | --dry-run)
		dry_run=true
		;;
	*)
		echo -e "${RED}[ERROR]  Unknown option: $1${NC}" >&2
		usage >&2
		exit 1
		;;
	esac
done

dotfiles_home="$HOME/dotfiles/home"
dotfiles_config="$HOME/dotfiles/.config"
target_home="$HOME"
target_config="$HOME/.config"

link_file() {
	local src="$1"
	local dst="$2"
	if [[ "$dry_run" == true ]]; then
		echo -e "${BLUE}[INFO]   Would link:${NC} $dst ${GREEN}→${NC} $src"
	else
		if [[ -L "$dst" ]]; then
			cur_target=$(readlink "$dst" 2>/dev/null || true)
			if [[ "$cur_target" == "$src" ]]; then
				echo -e "${GREEN}[SUCCESS]󰄳  Already linked:${NC} $dst"
				return 0
			elif [[ "$force" == false ]]; then
				echo -e "${YELLOW}[WARNING]⚠  Skipping (already symlinked, different target):${NC} $dst → $cur_target"
				return 0
			fi
		elif [[ -e "$dst" ]]; then
			if [[ "$force" == false ]]; then
				echo -e "${YELLOW}[WARNING]⚠  Skipping (exists as file/dir):${NC} $dst"
				return 0
			fi
		fi

		# create a parrent directory, if needed (for ~/.config/subdir/file)
		mkdir -p "$(dirname "$dst")"

		if ln -sf "$src" "$dst"; then
			echo -e "${GREEN}[SUCCESS]󰄳  Linked:${NC} $dst ${GREEN}→${NC} $src"
		else
			echo -e "${RED}[ERROR]  Failed to link:${NC} $dst"
			return 1
		fi
	fi
}

plan=()
# making a plan

echo -e "${BLUE}[INFO]  Scanning dotfiles...${NC}"

# ~/dotfiles/home → ~
if [[ -d "$dotfiles_home" ]]; then
	while IFS= read -r -d '' file; do
		rel_path="${file#dotfiles_home}"
		dst="$target_home/$rel_path"
		src="$(realpath "$file")"
		plan+=("$src|$dst")
	done < <(find "$dotfiles_home" -mindepth 1 -print0 2>/dev/null)
fi

# ~/dotfiles/.config → ~/.config
if [[ -d "$dotfiles_config" ]]; then
	while IFS= read -r -d '' file; do
		rel_path="${file#$dotfiles_config/}"
        dst="$target_config/$rel_path"
        src="$(realpath "$file")"
        plan+=("$src|$dst")
	done < <(find "$dotfiles_config" -mindepth 1 -print0 2>/dev/null)
fi

if [[ ${#plan[@]} -eq 0 ]]; then
	echo -e "${YELLOW}[WARNING]⚠   No dotfiles found to link.${NC}"
	exit 0;
fi

echo -e "\n${BLUE}Plan:${NC}"
for item in "${plan[@]}"; do
	IFS='|' read -r src dst <<< "$item"
	echo -e "  ${BLUE}[INFO]   ${NC} $dst ${BLUE}→${NC} $src"
done

if [[ "$dry_run" == true ]]; then
    echo -e "\n${BLUE}[INFO]   Dry run complete — no changes made.${NC}"
    exit 0
fi

if [[ "$force" == false ]]; then
	echo -e "\n${YELLOW}Proceed? [y/N] ${NC}\c"
	read -r confirm
	if [[ ! "$confirm" =~ ^[Yy]$ ]]; then
		echo "${RED}Aborted.${NC}"
		exit 0
	fi
fi

echo -e "\n${BLUE}[INFO]   Linking...${NC}"
for item in "${plan[@]}"; do
	IFS='|' read -r src dst <<< "$item"
	link_file "$src" "$dst" || echo -e "${RED}Failed linking for ${dst}${NC}"
done

echo -e "\n${GREEN}Done!${NC}"
