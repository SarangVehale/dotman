# Under the Hood: How dotman Works

This guide walks you through how dotman is structured internally, how its components interact, and how you can extend it without breaking stuff.

---

## 🧩 Overview

dotman is built as a **modular Bash application** with a simple TUI interface powered by `dialog`.

At a high level:

```

User ↔ dotman.sh (TUI menu) ↔ Modules ↔ dotfiles repo
↕
\~/.dotmanrc

```

---

## 🗃 File Structure

Here’s how the project is organized:

```

dotman/
├── dotman.sh           # Main entrypoint (TUI menu)
├── modules/            # Each TUI option is a separate, reusable module
│   ├── add.sh
│   ├── sync\_home\_to\_repo.sh
│   ├── sync\_repo\_to\_home.sh
│   ├── rollback.sh
│   ├── verify.sh
│   └── ...
├── install.sh          # Setup script
├── uninstall.sh        # Cleanup script
├── templates/          # Default dotfiles, optional base configs
├── utils.sh            # Shared utility functions
├── .dotmanrc           # User config (generated at install)
└── docs/               # This documentation

````

Each module does **one thing**, and gets called from `dotman.sh`. This keeps the logic separated and easy to maintain.

---

## 📂 Key Components

### `dotman.sh`

- The main TUI menu
- Calls dialog boxes and maps menu selections to modules

### `modules/`

Each script here corresponds to a feature:
- `add.sh`: Track a new dotfile
- `sync_home_to_repo.sh`: Sync local files to repo
- `sync_repo_to_home.sh`: Restore from repo
- `rollback.sh`: Restore older versions of a file
- `verify.sh`: Run integrity checks
- `backup.sh`, `restore.sh`, `setup_wizard.sh`: Additional core actions

### `utils.sh`

- Houses shared functions:
  - Logging
  - Prompting
  - Backup helpers
  - Git wrappers
- Sourced by all other scripts

---

## 🔄 Data Flow

A typical flow (syncing dotfiles):

1. You pick "Sync Home → Repo" in the menu.
2. `dotman.sh` triggers `modules/sync_home_to_repo.sh`
3. That script:
   - Reads tracked files from config
   - Copies/symlinks them to the repo
   - Commits changes if `AUTO_COMMIT=true`
   - Backs up originals if `ENABLE_BACKUPS=true`
4. You get a dialog confirmation.

Everything is traceable and reversible through Git and backups.

---

## ⚙️ Config Awareness

All modules load the config via:

```bash
source ~/.dotmanrc
````

So changing `.dotmanrc` dynamically affects dotman behavior across modules — no need to edit each script.

---

## 📦 Git Integration

Most core actions (sync, rollback) are Git-aware:

* `AUTO_COMMIT` auto stages & commits changes
* `rollback.sh` reads Git history and restores a previous version
* Dotman never forces Git actions — it wraps them safely

You can also:

* Use branches per-machine
* Use Git remotes to push/pull dotfiles across machines

---

## 🧠 Why Bash?

* Easy to install and run on any \*nix system
* No weird dependencies
* Portable, hackable, understandable

It’s designed to work on Arch, Debian, WSL, even embedded Linux systems.

---

## 🔧 Extending dotman

Want to add a new feature?

1. Create a new script in `modules/your-feature.sh`
2. Add an entry in the TUI menu (`dotman.sh`)
3. Source `utils.sh` to reuse helper functions
4. Stick to the conventions — dotman is modular on purpose

---

## 🧼 Summary

* Modular Bash design
* TUI-powered
* Git-integrated
* Configurable with `.dotmanrc`
* Easy to extend and customize

Next up: [→ Hacking & Contributions](./HACKING.md)




