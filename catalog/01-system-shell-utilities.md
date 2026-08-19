# 01 — System & Shell Utilities

Statically-compiled **arm64** CLI utilities. Primary source:
[rafi/awesome-cli-binaries](https://github.com/rafi/awesome-cli-binaries)
(pre-made static amd64/arm64 binaries, built via Dockerfile).

> ✅ All of these have native **arm64** static binaries available.

## Shells & editors

| Tool | Version | Description | Install (arm64) |
|------|---------|-------------|-----------------|
| **tmux** | v3.5a | Terminal multiplexer (static, bundles ncurses+libevent) | `apt install tmux` or static build |
| **fish** | v4.8.0 | Friendly interactive shell | `apt install fish` |
| **neovim** | latest | Vim-fork editor (glibc 2.17 compatible) | `apt install neovim` |

## Utilities

| Tool | Description |
|------|-------------|
| **bat** | `cat` clone with syntax highlighting + Git integration |
| **eza** | Modern `ls` replacement |
| **lsd** | GNU `ls` rewrite with icons/colors |
| **fd** | Fast, friendly `find` alternative |
| **ripgrep (rg)** | Fast recursive regex search |
| **fzf** | General-purpose fuzzy finder |
| **jq** | JSON processor |
| **fx** | Interactive terminal JSON viewer |
| **btop** | Resource/process monitor |
| **duf** | Better `df` (disk free) |
| **dust** | Intuitive `du` |
| **dua** | Interactive disk usage analyzer |
| **erdtree** | Multi-threaded filesystem/disk analyzer |
| **delta** | Syntax-highlighting `git diff` pager |
| **diff-so-fancy** | Human-friendly git/diff/grep pager |
| **zoxide** | Smarter `cd` (z/autojump-style) |
| **starship** | Cross-shell prompt |
| **yazi** | Async terminal file manager |
| **hyperfine** | Command-line benchmarking |
| **hexyl** | Terminal hex viewer |
| **just** | Command runner (Makefile alternative) |
| **crane** | Container registry tool (go-containerregistry) |
| **bandwhich** | Live network utilization display |
| **chafa** | Terminal image/animation viewer |
| **havn** | Fast configurable port scanner |
| **rip2** | Safe/ergonomic `rm` alternative |

**Count: 26 utilities + 3 shells/editors.**

### Install the whole set (static arm64)

```bash
git clone https://github.com/rafi/awesome-cli-binaries.git
cd awesome-cli-binaries
just binaries arm64    # copies all to ./bin/
./sync.sh user@server  # rsync to remote ~/.local/bin
```

*License: each tool retains its own license (see upstream). Collector holds no rights.*
