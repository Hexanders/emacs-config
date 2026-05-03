# Emacs Configuration

Personal Emacs config. Tested on Linux / Emacs 29+.

> **Note:** Original configuration written by me. README generated with [Claude Code](https://claude.ai/code) (Anthropic AI assistant), which also assisted with configuration tuning and debugging. Design decisions and package choices are my own or adapted from publicly available Emacs configs found online.

## Features

| Package | Purpose |
|---|---|
| `vertico` + `orderless` + `marginalia` | Fuzzy minibuffer completion |
| `consult` | Enhanced buffer/grep/navigation commands |
| `company` + `company-auctex` + `company-math` | Auto-completion |
| `lsp-mode` + `lsp-ui` | Language server (Python, Java) |
| `magit` | Git interface (`C-x g`) |
| `centaur-tabs` | Buffer tabs (`M-left/right`) |
| `swiper` | Incremental search (`C-s`) |
| `multiple-cursors` | Multi-cursor editing |
| `which-key` | Keybinding hints |
| `citar` | Citation insertion (`C-c b`) |
| AUCTeX | LaTeX editing + compile |
| `markdown-mode` + `markdown-preview-mode` | Markdown with pandoc |

## Requirements

- Emacs 27+
- `aspell` — spell checking
- `pandoc` — Markdown preview
- Python LSP server: `pip install python-lsp-server`
- Java LSP: [Eclipse JDT LS](https://github.com/eclipse/eclipse.jdt.ls)

## Install

```bash
git clone <repo-url> ~/.emacs.d
emacs
```

First launch downloads all packages from MELPA/GNU ELPA. Subsequent launches use local cache — no network.

## Open files in existing Emacs instance

Config starts an Emacs server on launch. Use `emacsclient` instead of `emacs` to open files in the running instance.

**Shell setup** — add to `~/.bashrc` or `~/.zshrc`:

```bash
export EDITOR="emacsclient -n"
export VISUAL="emacsclient -n"
alias e="emacsclient -n"        # open file, return to terminal immediately
alias ec="emacsclient -c"       # open file in new frame
```

**File manager / desktop** — create `~/.local/share/applications/emacsclient.desktop`:

```ini
[Desktop Entry]
Name=Emacs (Client)
GenericName=Text Editor
Exec=emacsclient -c -a emacs %F
Icon=emacs
Type=Application
Terminal=false
Categories=Development;TextEditor;
StartupWMClass=Emacs
MimeType=text/plain;text/x-c;text/x-c++;text/x-python;text/x-tex;
```

Set as default: `xdg-mime default emacsclient.desktop text/plain`

The `-a emacs` flag starts a fresh Emacs if no server is running yet.

## Key bindings

| Key | Action |
|---|---|
| `C-x g` | Magit status |
| `C-s` | Swiper search |
| `C-x b` | Consult buffer switcher |
| `M-s r` | Ripgrep |
| `M-y` | Consult yank history |
| `C->` / `C-<` | Multiple cursors next/prev |
| `C-c ,` | Comment/uncomment line or region |
| `C-+` / `C--` | Increase/decrease font size |
| `C-c b` | Insert citation (citar) |
| `M--` / `M-.` | Jump to next/prev punctuation |
| `M-left/right` | Switch tabs |
