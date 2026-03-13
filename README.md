# Ghostty Config for Claude Code

Ghostty terminal configuration optimized for daily [Claude Code](https://docs.anthropic.com/en/docs/claude-code) usage on macOS.

## Prerequisites

- [Ghostty](https://ghostty.org/) terminal
- macOS with zsh
- [JetBrains Mono Nerd Font](https://www.nerdfonts.com/)

```bash
brew install --cask font-jetbrains-mono-nerd-font
```

## Installation

Copy the config file to Ghostty's config directory:

```bash
mkdir -p ~/Library/Application\ Support/com.mitchellh.ghostty
cp config ~/Library/Application\ Support/com.mitchellh.ghostty/config
```

Then press `Cmd+Shift+,` in Ghostty to reload, or restart Ghostty.

## Configuration Details

### Theme

| Option | Value | Description |
|--------|-------|-------------|
| `theme` | `light:Flexoki Light, dark:Kanagawa Wave` | Automatically switches between a warm light theme and a cinematic dark theme based on system appearance |
| `window-theme` | `auto` | Window chrome follows system light/dark mode |
| `window-colorspace` | `display-p3` | Wide color gamut for richer colors on Apple displays |

### Font

| Option | Value | Description |
|--------|-------|-------------|
| `font-family` | `JetBrainsMono Nerd Font` | Nerd Font required for Claude Code status line icons to render correctly |
| `font-size` | `15` | Balanced readability for long coding sessions |
| `font-thicken` | `true` | Slightly bolder rendering for better legibility on Retina displays |
| `font-thicken-strength` | `120` | Fine-tuned thickness for Apple LCD/OLED screens |
| `adjust-cell-height` | `12%` | Extra line spacing for comfortable reading of Claude Code output |
| `minimum-contrast` | `1.1` | Ensures text remains readable against semi-transparent backgrounds |

### Window

| Option | Value | Description |
|--------|-------|-------------|
| `background-opacity` | `0.9` | Subtle transparency to keep context of windows behind |
| `background-blur` | `32` | Frosted glass effect behind the terminal |
| `window-padding-x` | `18` | Horizontal breathing room |
| `window-padding-y` | `16` | Vertical breathing room |
| `window-padding-balance` | `true` | Centers content when terminal is wider than needed |
| `window-padding-color` | `extend` | Padding area uses terminal background color |
| `macos-titlebar-style` | `transparent` | Clean, borderless titlebar integrated with terminal content |
| `macos-window-shadow` | `true` | macOS native window shadow |
| `window-inherit-working-directory` | `true` | New splits/tabs inherit current directory |
| `window-save-state` | `always` | Restores all windows, tabs, and splits on restart |

### Cursor & Input

| Option | Value | Description |
|--------|-------|-------------|
| `cursor-style` | `bar` | Thin bar cursor, less distracting during Claude Code output |
| `cursor-style-blink` | `false` | No blinking, reduces visual noise |
| `mouse-hide-while-typing` | `true` | Hides mouse cursor while typing for cleaner view |
| `unfocused-split-opacity` | `0.9` | Dims inactive splits slightly to focus on active pane |
| `copy-on-select` | `clipboard` | Select text to copy instantly, no Cmd+C needed |

### Scrollback

| Option | Value | Description |
|--------|-------|-------------|
| `scrollback-limit` | `100000` | 100K lines buffer for long Claude Code sessions - never lose output history |

### Clipboard

| Option | Value | Description |
|--------|-------|-------------|
| `clipboard-read` | `allow` | Allows Claude Code to read clipboard content |
| `clipboard-write` | `allow` | Allows Claude Code to write to clipboard |
| `clipboard-paste-protection` | `false` | Disables paste confirmation dialogs - essential for pasting large code blocks without interruption |

### Shell Integration

| Option | Value | Description |
|--------|-------|-------------|
| `shell-integration` | `zsh` | Enables Ghostty shell integration for zsh |
| `shell-integration-features` | `cursor,sudo,title` | Command tracking, sudo password prompt detection, and automatic window title |

### Quick Terminal

| Option | Value | Description |
|--------|-------|-------------|
| `quick-terminal-position` | `top` | Drop-down terminal slides from top of screen |
| `quick-terminal-screen` | `main` | Appears on main display |
| `quick-terminal-animation-duration` | `0.15` | Fast 150ms slide animation |
| **`global:alt+space`** | `toggle_quick_terminal` | **Press `Option+Space` anywhere on macOS to instantly summon/hide the terminal** |

### Keybindings

All keybindings are designed to not conflict with Claude Code's own shortcuts (which use `Ctrl` and `Escape`).

| Shortcut | Action | Description |
|----------|--------|-------------|
| `Cmd+D` | `new_split:right` | Split terminal to the right |
| `Cmd+Shift+D` | `new_split:down` | Split terminal downward |
| `Cmd+Alt+Arrow` | `goto_split:direction` | Navigate between splits |
| `Cmd+Shift+Enter` | `toggle_split_zoom` | Zoom/unzoom current split to full window |
| `Cmd+=` | `increase_font_size` | Increase font size |
| `Cmd+-` | `decrease_font_size` | Decrease font size |
| `Cmd+0` | `reset_font_size` | Reset font size to default |
| `Cmd+Shift+C` | `copy_to_clipboard` | Copy selected text |
| `Cmd+Shift+V` | `paste_from_clipboard` | Paste from clipboard |

## Why These Settings for Claude Code?

1. **Nerd Font** - Claude Code's status line uses special icons that only render with Nerd Fonts
2. **Large scrollback** - Claude Code sessions can produce thousands of lines of output; 100K lines ensures you never lose context
3. **Clipboard freedom** - No paste protection means you can freely paste large code blocks into Claude Code prompts
4. **Copy-on-select** - Quickly grab code snippets from Claude Code output by simply selecting them
5. **Quick Terminal** - `Option+Space` lets you summon Claude Code from any app instantly
6. **Split-friendly keybindings** - Run Claude Code in one split and your editor/tests in another, all using `Cmd` shortcuts that don't conflict with Claude Code's `Ctrl/Esc` bindings
7. **Session persistence** - `window-save-state = always` means your terminal layout survives Ghostty restarts

## License

MIT
