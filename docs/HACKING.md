# Hacking on dotman

Want to tweak dotman? Add a new feature? Fork it and make it your own? Awesome.

This guide will walk you through:
- How to safely modify or extend dotman
- Coding conventions
- Testing and debugging tips
- Contribution best practices

---

## 🧠 Philosophy

dotman is intentionally simple:
- One feature per script
- Minimal dependencies (just Bash, Git, and `dialog`)
- Transparent behavior — no hidden magic

You can break it. You can also easily fix it.

---

## 🗃 Directory Structure Recap

If you haven’t already, check out [ARCHITECTURE.md](./ARCHITECTURE.md) for a detailed file overview.

To summarize the important bits:

```

dotman/
├── dotman.sh        # Entry point (menu)
├── modules/         # Feature scripts (one per action)
├── utils.sh         # Reusable helper functions
└── .dotmanrc        # Config sourced by all modules

````

---

## ✨ Adding a New Feature

Say you want to add a new "diff mode" to view changes before syncing. Here's how:

1. **Create a module script:**
   - Example: `modules/diff_preview.sh`
   - Start with:

     ```bash
     #!/bin/bash
     source "$DOTMAN_ROOT/utils.sh"
     source "$HOME/.dotmanrc"
     ```

2. **Use reusable functions from `utils.sh`:**
   - Use `log_info`, `prompt_user`, etc.
   - Use `$DOTFILES_DIR`, `$USE_SYMLINKS`, and other config vars

3. **Update the menu:**
   - Edit `dotman.sh`
   - Add your new entry with a `dialog` option
   - Map the selection to your module

4. **Test it:**
   - Run dotman, navigate to the new option, and confirm it works
   - Handle edge cases (missing files, no Git repo, etc.)

---

## 🧼 Code Style

It’s Bash. We keep it:
- POSIX where possible
- Safe (quote your variables!)
- Commented (people should understand what’s going on)
- Modular (don’t bake logic into `dotman.sh` — use `modules/`)

---

## 🧪 Debugging Tips

- Set `set -x` in any script to trace execution
- Logs go to `~/.dotman/logs`
- Run modules manually:  
  ```bash
  ./modules/sync_home_to_repo.sh
````

---

## 🤝 Contributing

If you want to contribute upstream:

1. Fork the repo
2. Create a feature branch:

   ```bash
   git checkout -b feat/new-feature
   ```
3. Follow the project conventions
4. Test across:

   * Clean installs
   * Symlink vs copy mode
   * Git on/off
5. PRs should be small and focused

---

## 📌 Design Rules (aka "Don't Break It")

* dotman should never overwrite without user intent or backup
* Always respect `.dotmanrc`
* If using Git commands, check if the repo exists first
* Avoid hardcoding paths — rely on config variables
* Make all new features *opt-in* unless clearly safe

---

## 🧪 Coming Soon: Test Suite

We’re working on an optional `bats` test suite for core modules. Stay tuned.

---

## Final Thought

This project started because managing dotfiles shouldn’t be a black hole of shell scripts and broken symlinks.

If you’ve got improvements, ideas, or fixes — dive in.

Happy hacking. 🚀

→ Back to [Main Menu](../README.md)

