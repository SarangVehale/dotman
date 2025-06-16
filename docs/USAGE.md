# How to Use dotman (Without Screaming)

So you’ve installed dotman. Nice. Now what?

Just run:

```bash
dotman
````

That launches the TUI (Text User Interface). It’s like your favorite 90s terminal app — except this one actually saves your config.

---

## 🧭 Menu Overview

Let’s go over what each option does — so you’re not just pressing buttons and praying.

---

### 1️⃣ Add Dotfile

> “Hey dotman, track this file for me.”

* Pick a dotfile from anywhere (like `~/.zshrc` or `~/.config/kitty/kitty.conf`)
* It gets added to your dotman repo
* Symlinked or copied, depending on your `.dotmanrc` settings

This is your entry point to a more organized life.

---

### 2️⃣ List Dotfiles

> “Wait... what am I tracking again?”

Shows you all tracked dotfiles, their locations, and whether they’re symlinked or copied.

No more guessing.

---

### 3️⃣ Sync Home → Repo

> “I just changed my config — save it before I break something else.”

This takes the current version of your dotfiles from your system and syncs them to the repo.

Auto-commits if you’ve enabled `AUTO_COMMIT=true`.

---

### 4️⃣ Sync Repo → Home

> “Give me back the clean version that actually worked.”

This restores your dotfiles from the repo into your home directory.

Useful for new machines, or when you’ve “experimented” a little too hard.

---

### 5️⃣ Rollback File

> “Undo that one time I thought I knew Vim scripting.”

Lets you view previous Git versions of any file and restore a specific commit.

Safe. Simple. Sanity-preserving.

---

### 6️⃣ Verify Dotfiles

> “Trust, but verify.”

Checks for:

* Broken or missing symlinks
* Out-of-sync files
* Files that changed outside dotman

You’ll know exactly what’s working and what’s not.

---

### 7️⃣ Make Backup

> “Snapshot this moment. Just in case.”

Creates a full backup (tarball) of all tracked dotfiles. Time-stamped. Safe.

---

### 8️⃣ Restore Backup

> “Take me back to before I broke it.”

Pick any previous backup and restore it. Good for major resets or quick rollbacks.

---

### 9️⃣ Setup Wizard

> “It’s a fresh machine. Help me get set up.”

Automated onboarding:

* Clone your dotfiles
* Choose symlink or copy
* Apply everything in one go

Perfect for new installs, or when a friend wants your whole setup.

---

### 0️⃣ Exit

> “Okay, I’m done.”

Leaves the menu. You knew this one already.

---

## 💡 Quick Tips

* Run `dotman` often — small syncs = fewer surprises
* Use Git branches for different machines
* Auto-commit is great for people who forget to commit (everyone)
* Don't be afraid to make backups — they’re fast and save your butt

---

## “I use Arch btw” Advice

dotman was made with the Arch crowd in mind:

* TUI-based
* Lightweight
* Git-driven
* 100% hackable

So when things go sideways, you can still say:

> “It’s fine, I’ve got dotman.”
--

Next up: [→ Configuration Guide](./CONFIG.md)

