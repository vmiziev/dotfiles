# Better ls
alias ls='eza --icons'

# Detailed listing
alias ll='eza -lh --icons --git'

# Detailed listing including hidden files
alias la='eza -lah --icons --git'

# Tree view
# alias tree='eza --tree --icons'
tree() {
    # Level fallback: Use first argument if provided, otherwise default to 2
    local level="${1:-2}"

    eza --tree --all --level="$level" --no-git --ignore-glob="node_modules" --group-directories-first
}

# Reuse ls completions for eza (avoids defining a separate completion function)
compdef eza=ls

# Better cat
alias cat='bat'

# =========================================================
# Core utilities
# =========================================================

alias grep='rg --color=auto'
alias diff='diff --color=auto'
alias df='df -h'
alias upd='sudo apt update && sudo apt upgrade -y && sudo apt autoremove -y && sudo snap refresh'

# =========================================================
# Navigation
# =========================================================

alias -- -='cd -'  # -- prevents - being parsed as a flag; cd - jumps to previous directory

lf() { # zsh follow lf navigation
    tmp=$(mktemp)
    command lf -last-dir-path="$tmp" "$@"
    if [ -f "$tmp" ]; then
        dir=$(cat "$tmp")
        rm -f "$tmp"
        [ -d "$dir" ] && [ "$dir" != "$(pwd)" ] && cd "$dir"
    fi
}

# =========================================================
# Editor
# =========================================================

alias vim='nvim'

# =========================================================
# Git
# =========================================================

alias glog='PAGER="less -F -X" git log'                              # -F quit if one screen, -X no clear on exit
alias gadog='PAGER="less -F -X" git log --all --decorate --oneline --graph'
alias dotfiles='git --git-dir=$HOME/.dotfiles --work-tree=$HOME'

# =========================================================
# Video
# =========================================================

alias stream='mpv av://v4l2:/dev/video4 --fullscreen --demuxer-lavf-o=input_format=mjpeg,framerate=30 --profile=low-latency --untimed'

# =======================

alias nf='neofetch'

# =========================================================
# Docker
# =========================================================

# POSTGRES
alias pg-start='docker compose -f ~/.config/docker/postgres/compose.yaml up -d'
alias pg-stop='docker compose -f ~/.config/docker/postgres/compose.yaml down'
alias pg-logs='docker compose -f ~/.config/docker/postgres/compose.yaml logs -f'
