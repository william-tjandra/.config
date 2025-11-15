# ⚙️ Cross-Platform Configuration Repository (`.config`)

This repository serves as the single source of truth for all command-line and cross-platform developer configurations across your macOS and Linux machines. It utilizes **GNU Stow** to manage symlinks, ensuring a clean home directory and platform consistency.

---

## 🛠️ Prerequisites & Installation

These are the only **manual steps** required to bootstrap a new machine.

| Tool | Purpose | Installation (Mac Command) |
| :--- | :--- | :--- |
| **Homebrew** | The macOS package manager (required first). | `/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"` |
| **Git** | Cloning and version control. | `brew install git` |

---

## 🚀 Deployment

After the prerequisites are installed, the rest of the setup is automated.

1.  **Clone this repository** (use your SSH URL):
    ```bash
    git clone git@github.com:william-tjandra/.config.git ~/.config
    ```

2.  **Run the installation script:**
    ```bash
    cd ~/.config
    ./install.sh
    ```

The `install.sh` script will handle:
* Installing all other applications and tools (Stow, WezTerm, Python, Go, etc.).
* Installing Zsh plugins and frameworks.
* Running `stow` to symlink all necessary configuration files.

---

## 📂 Repository Structure & Logic

This repository is cloned directly to `~/.config`. It uses a hybrid approach:

### 1. Stow Packages (Target: `~/` or other root paths)

These packages contain configs that **must** be symlinked to specific locations outside of `~/.config`.

| Folder (Package) | Purpose | Target Location |
| :--- | :--- | :--- |
| `zsh-boot` | Contains `.zshenv` to bootstrap the `ZDOTDIR` variable. | Links to `~/` |
| `vim` | Contains `.vimrc` to configure Vim and its data path. | Links to `~/` |
| `ssh-mac` | **Mac-Specific Config.** Contains the `UseKeychain yes` SSH config. | Links to `~/.ssh/config` |

### 2. XDG/ZDOTDIR Compliant Packages (Target: `~/.config/`)

These packages live directly in the repo. **No Stow needed.** The applications are configured (via `ZDOTDIR` or `XDG_CONFIG_HOME`) to read them from here.

| Folder (Package) | Purpose |
| :--- | :--- |
| `zsh` | Main Zsh configs (`.zshrc`, `.p10k.zsh`), loaded via `ZDOTDIR`. |
| `git` | Git configuration (`config`, `gitignore_global`), loaded via `XDG_CONFIG_HOME`. |
| `wezterm` | WezTerm terminal configuration (`wezterm.lua`). |
| `karabiner` | Karabiner-Elements keyboard configuration. |
| `oh-my-zsh` | The Oh My Zsh framework itself (ignored by Git). |