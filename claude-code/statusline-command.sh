#!/bin/sh
# Claude Code status line - robbyrussell Oh My Zsh theme style
# Displays: ➜ current-dir git:(branch) x | model | ctx%
# Uses grep/sed instead of jq for zero-dependency parsing

input=$(cat)

# Simple JSON field extraction (no jq needed)
json_str() { echo "$input" | grep -o "\"$1\"[[:space:]]*:[[:space:]]*\"[^\"]*\"" | head -1 | sed "s/\"$1\"[[:space:]]*:[[:space:]]*\"//;s/\"$//"; }
json_num() { echo "$input" | grep -o "\"$1\"[[:space:]]*:[[:space:]]*[0-9.]*" | head -1 | sed "s/\"$1\"[[:space:]]*:[[:space:]]*//"; }

cwd=$(json_str current_dir)
dir=$(basename "$cwd")
model=$(json_str display_name)
used_pct=$(json_num used_percentage)

# Colors (ANSI)
GREEN='\033[1;32m'
CYAN='\033[0;36m'
BLUE='\033[1;34m'
RED='\033[0;31m'
YELLOW='\033[0;33m'
RESET='\033[0m'

# Git branch and dirty status
git_info=""
if [ -n "$cwd" ] && git -C "$cwd" rev-parse --git-dir > /dev/null 2>&1; then
  branch=$(git -C "$cwd" symbolic-ref --short HEAD 2>/dev/null || git -C "$cwd" rev-parse --short HEAD 2>/dev/null)
  if [ -n "$branch" ]; then
    if git -C "$cwd" status --porcelain 2>/dev/null | grep -q .; then
      dirty=" ${YELLOW}x${RESET}"
    else
      dirty=""
    fi
    git_info=" ${BLUE}git:(${RED}${branch}${BLUE})${RESET}${dirty}"
  fi
fi

# Build context info
if [ -n "$used_pct" ]; then
  used_int=$(printf "%.0f" "$used_pct")
  ctx_info="ctx:${used_int}%%"
else
  ctx_info=""
fi

printf "${GREEN}➜${RESET}  ${CYAN}${dir}${RESET}${git_info} | ${YELLOW}${model}${RESET} | ${ctx_info}"
