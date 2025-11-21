git_ahead_behind() {
  local branch
  branch=$(git symbolic-ref --short HEAD 2>/dev/null) || return

  local upstream
  upstream=$(git rev-parse --abbrev-ref "@{upstream}" 2>/dev/null) || return

  local counts
  counts=$(git rev-list --left-right --count "${upstream}"...HEAD 2>/dev/null) || return

  local behind=${${(s:\t:)counts}[1]}
  local ahead=${${(s:\t:)counts}[2]}

  local out=""
  if (( ahead > 0 )); then
    out+="%F{green}${ahead}%f"
  fi
  if (( behind > 0 )); then
    [[ -n "$out" ]] && out+=" "
    out+="%F{red}${behind}%f"
  fi

  [[ -n "$out" ]] && echo " %F{magenta}${out}%f"
}

git_status_verbose() {
  local git_status_output=$(git status --porcelain=v1 2>/dev/null)
  [[ -z "$git_status_output" ]] && return

  local added=0 modified=0 deleted=0 untracked=0

  while IFS= read -r line; do
    [[ -z "$line" ]] && continue
    local code="${line:0:2}"
    case "$code" in
      '??') untracked=$((untracked + 1)) ;;
      'A '*) added=$((added + 1)) ;;
      ' M'|'AM'|' T'|'MT') modified=$((modified + 1)) ;;
      'M ') modified=$((modified + 1)) ;;
      'MM') modified=$((modified + 1)) ;;
      ' D'|'D ') deleted=$((deleted + 1)) ;;
      'AD') added=$((added + 1)); deleted=$((deleted + 1)) ;;
    esac
  done <<< "$git_status_output"

  local parts=()
  [[ $added -gt 0 ]]     && parts+="%F{green}+${added}%f "
  [[ $modified -gt 0 ]]  && parts+="%F{yellow}~${modified}%f "
  [[ $deleted -gt 0 ]]   && parts+="%F{red}-${deleted}%f "
  [[ $untracked -gt 0 ]] && parts+="%F{orange}?${untracked}%f "

  [[ ${#parts[@]} -gt 0 ]] && echo " %{$fg_bold[magenta]%}[ ${(j: :)parts}%{$fg_bold[magenta]%}]"
}

# the svn plugin has to be activated for this to work.
local ret_status="%(?:%{$fg_bold[green]%}➜ :%{$fg_bold[red]%}➜ %s)"
PROMPT='${ret_status}%{$fg_bold[green]%} %{$fg[cyan]%}%c %{$fg_bold[blue]%}$(git_prompt_info)$(git_ahead_behind)$(git_status_verbose)%{$fg_bold[blue]%}$(svn_prompt_info)%{$reset_color%}  '

ZSH_THEME_GIT_PROMPT_PREFIX=" 󰊢 git:( %{$fg[red]%} "
ZSH_THEME_GIT_PROMPT_SUFFIX="%{$reset_color%}"
ZSH_THEME_GIT_PROMPT_DIRTY="%{$fg[blue]%})%{$fg[yellow]%} ✘ %{$reset_color%}"
ZSH_THEME_GIT_PROMPT_CLEAN="%{$fg[blue]%}) "

ZSH_PROMPT_BASE_COLOR="%{$fg_bold[blue]%}"
ZSH_THEME_REPO_NAME_COLOR="%{$fg_bold[red]%}"

ZSH_THEME_SVN_PROMPT_PREFIX="svn:("
ZSH_THEME_SVN_PROMPT_SUFFIX=")"
ZSH_THEME_SVN_PROMPT_DIRTY="%{$fg[red]%} ✘ %{$reset_color%}"
ZSH_THEME_SVN_PROMPT_CLEAN=" "
