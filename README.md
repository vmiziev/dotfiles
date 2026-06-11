# GNU Stow — Dotfiles Quick Reference

## How it works

Each subdirectory in `~/.dotfiles` is a **package**. Stow mirrors its structure into the target directory (`~` by default), creating symlinks.

```
~/.dotfiles/
  kitty/
    .config/kitty/kitty.conf        →  symlinked to  ~/.config/kitty/kitty.conf
  zsh/
    .config/zsh/.zshrc              →  symlinked to  ~/.config/zsh/.zshrc
    .config/zsh/aliases.zsh         →  symlinked to  ~/.config/zsh/aliases.zsh
```

---

## Apply a saved config

```bash
cd ~/.dotfiles
stow zsh           # symlink a single package
stow zsh git tmux  # symlink multiple packages at once
stow */            # symlink everything
```

---

## Add a new config

1. **Move** the real config file/dir into `~/.dotfiles` under a package folder:

```bash
mkdir -p ~/.dotfiles/zsh/.config/zsh
mv ~/.config/zsh ~/.dotfiles/zsh/.config/zsh
```

2. **Stow** the package to re-create the symlink:

```bash
cd ~/.dotfiles
stow zsh
```

---

## Useful flags

| Flag          | Purpose                               |
| ------------- | ------------------------------------- |
| `stow -n zsh` | Dry run — show what _would_ be linked |
| `stow -R zsh` | Re-stow (delete + re-create symlinks) |
| `stow -D zsh` | Delete (un-stow) a package            |

---

## Bootstrap on a new machine

```bash
git clone git@github.com:<you>/dotfiles.git ~/.dotfiles
cd ~/.dotfiles
stow */
```
