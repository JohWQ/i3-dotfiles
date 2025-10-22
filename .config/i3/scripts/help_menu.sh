#!/usr/bin/env bash
#
# Interactive Help Navigator (fzf + bat)
# Easier help entry definition using add_help() function
#

set -euo pipefail

# ---------- Dependencies ----------
if ! command -v fzf >/dev/null 2>&1; then
  echo "fzf is required. Install it and re-run." >&2
  exit 1
fi

# bat vs batcat
if command -v bat >/dev/null 2>&1; then
  BAT_BIN="bat"
elif command -v batcat >/dev/null 2>&1; then
  BAT_BIN="batcat"
else
  BAT_BIN=""
fi

# ---------- Help content ----------
declare -A HELP_CONTENT

# Helper: cleaner way to define help entries
add_help() {
  local key="$1"
  local content
  content="$(cat)"
  HELP_CONTENT["$key"]="$content"
}

# Example entries (now very readable!)
add_help "i3WM:Navigation" <<'EOF'
##### i3WM:Navigation #####
  $mod key = Super (Windows key)

  $mod + Enter                 → Open terminal
  $mod + D                     → Launch app (dmenu/rofi)
  $mod + h / j / k / l         → Move focus between windows
  $mod + Shift + h / j / k / l → Move window
  $mod + F                     → Toggle fullscreen
  $mod + R                     → Enter resize mode

##### i3WM:Navigation #####
EOF

add_help "i3WM:Window Management" <<'EOF'
# i3WM: Window Management

  $mod + V         → Split vertically
  $mod + H         → Split horizontally
  $mod + W         → Tabbed layout
  $mod + E         → Toggle split layout
  $mod + Shift + Q → Close focused window
  $mod + Shift + R → Restart i3 (reload config)
EOF

add_help "Software:Package Managers" <<'EOF'
# Software: Package Managers

Fedora:
  sudo dnf update / update
  sudo dnf install <package> / dnfi <package>

Universal:
  flatpak install <package>
  snap install <package>
EOF

#add_help "Software:Common Apps" <<'EOF'
## Software: Common Apps
#
#  firefox        → Web browser
#  thunar         → File manager
#  alacritty      → Terminal emulator
#  code           → Visual Studio Code
#  feh <image>    → Simple image viewer
#EOF

# Example nested subcategory
add_help "Software:Vim - Basics" <<'EOF'
# Vim Basics

:q / :w / :wq / :q!   → Quit / save
i / Esc               → Insert / Normal mode
h / j / k / l         → Move cursor
gg / G                → Top / bottom
u / Ctrl + r          → Undo / redo
EOF

add_help "Software:Vim - Editing" <<'EOF'
# Vim Editing

dd  → Delete line
yy  → Yank (copy) line
p   → Paste below
.   → Repeat last command
:set number → Show line numbers
EOF

add_help "System:Info Commands" <<'EOF'
# System: Info Commands

  neofetch        → Show system summary
  uname -a        → Kernel info
  df -h           → Disk usage
  free -h         → Memory usage
  top / htop      → Process viewer
EOF

add_help "System:Useful Tips" <<'EOF'
# System: Useful Tips

  sudo !!         → Re-run last command as root
  history | grep  → Search command history
  Ctrl + R        → Reverse search through history
EOF

# ---------- Helpers ----------
get_subcategories() {
  local category="$1"
  for key in "${!HELP_CONTENT[@]}"; do
    if [[ $key == "$category:"* ]]; then
      printf '%s\n' "${key#"$category:"}"
    fi
  done | sort -u
}

show_help() {
  local key="$1"
  local content="${HELP_CONTENT[$key]:-}"

  if [[ -z "$content" ]]; then
    printf "No help available for %s\n" "$key" | less -R
    return
  fi

  if [[ -n "$BAT_BIN" ]]; then
    printf '%s\n' "$content" | "$BAT_BIN" --paging=never --style=plain --language=markdown | less -R
  else
    printf '%s\n' "$content" | less -R
  fi
}

# ---------- Menus ----------
main_menu() {
  printf '%s\n' "i3WM" "Software" "System" "Search All help articles" "Exit" \
    | fzf --prompt="Open a help article: " --height=40% --border --ansi
}

subcategory_menu() {
  local category="$1"

  while true; do
    mapfile -t subs < <(get_subcategories "$category")

    if [[ ${#subs[@]} -eq 0 ]]; then
      echo "No subcategories for '$category'." >&2
      sleep 1
      return
    fi

    selection=$( { printf '%s\n' "${subs[@]}"; printf 'Back\n'; } \
      | fzf --prompt="$category → Select entry: " --height=40% --border --ansi ) || true

    if [[ -z "$selection" || "$selection" == "Back" ]]; then
      return
    fi

    local key="${category}:${selection}"

    if [[ -z "${HELP_CONTENT[$key]:-}" ]]; then
      printf "No help available for %s\n" "$key" | less -R
      continue
    fi

    clear
    show_help "$key"
  done
}

search_all() {
  while true; do
    mapfile -t allkeys < <(printf '%s\n' "${!HELP_CONTENT[@]}" | sort)

    selection=$( { printf '%s\n' "${allkeys[@]}"; printf 'Back\n'; } \
      | fzf --prompt="Search All help articles: " --height=50% --border --ansi ) || true

    if [[ -z "$selection" || "$selection" == "Back" ]]; then
      return
    fi

    clear
    show_help "$selection"
  done
}

# ---------- Main loop ----------
while true; do
  clear
  choice=$(main_menu) || exit 0

  case "$choice" in
    "Exit"|"")
      clear
      exit 0
      ;;
    "Search All help articles")
      search_all
      ;;
    "i3WM"|"Software"|"System")
      subcategory_menu "$choice"
      ;;
    *)
      ;;
  esac
done
