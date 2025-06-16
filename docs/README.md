# dotman — a dotfiles manager that doesn't suck™

![iusearchbtw](archbtw.jpg)

> Because managing dotfiles is a pain in the a**  
> So this one's for the *"i use arch btw"* crowd

Welcome to **dotman** — a modular, TUI-based, Git-powered dotfiles manager made for hackers, tinkerers, and minimalists.  
No electron bloat. No obscure dependencies. Just plain Bash and dialog, done right.

---

## 📦 Features

- Text-based UI (TUI) built with `dialog`
- Symlink or copy mode — your choice
- Full Git versioning support (with rollback!)
- Setup wizard for new machines
- Verification tools and integrity checks
- Auto backups & restore options
- Modular code — easy to hack or extend
- Safe by default, fast when you want it to be

---

## ⚡ Quick Install

```bash
bash <(curl -s https://raw.githubusercontent.com/SarangVehale/dotman/main/install.sh)
````

You can also clone it manually:

```bash
git clone git@github.com:SarangVehale/dotman.git ~/.dotman
cd ~/.dotman
./install.sh
```

After install, just run:

```bash
dotman
```

Boom. You're managing dotfiles like a pro.

---

## 🧠 Why dotman?

* No need to reinvent the wheel with random shell scripts
* Portable: works on Arch, Debian, WSL, Alpine, etc.
* Uses Git behind the scenes — version everything
* Easy rollback when things go sideways
* Works the way *you* do — flexible and config-driven

---

## 📚 Documentation

We split the docs into logical files so you can dive in wherever you like:

| 📄 File                                 | 🔍 Description                          |
| --------------------------------------- | --------------------------------------- |
| [USAGE.md](docs/USAGE.md)               | How to use dotman (without screaming)   |
| [CONFIG.md](docs/CONFIG.md)             | Configuration via `.dotmanrc`           |
| [ARCHITECTURE.md](docs/ARCHITECTURE.md) | Internal layout and module design       |
| [HACKING.md](docs/HACKING.md)           | How to hack/extend/contribute to dotman |

---

## 🛑 Uninstall

We get it. Sometimes things change.

```bash
~/.dotman/uninstall.sh
```

Poof — clean removal, no junk left behind.

---

## 🙏 Acknowledgements

Inspired by:

* The frustration of restoring configs for the 100th time
* The Arch community’s obsession with clean dotfiles
* The idea that Bash is good enough, if you treat it right

---

## 🦾 Maintained by

**Sarang Vehale**
[github.com/SarangVehale](https://github.com/SarangVehale)

---

> dotman: for the minimalist who still likes their config curated, backed up, versioned, and under control.

```
