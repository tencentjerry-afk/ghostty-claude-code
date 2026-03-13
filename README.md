# Ghostty 配置 - 为 Claude Code 优化

针对 macOS 上日常使用 [Claude Code](https://docs.anthropic.com/en/docs/claude-code) 场景优化的 [Ghostty](https://ghostty.org/) 终端配置。

## 前置要求

- [Ghostty](https://ghostty.org/) 终端
- macOS + zsh
- [JetBrains Mono Nerd Font](https://www.nerdfonts.com/) 字体

```bash
brew install --cask font-jetbrains-mono-nerd-font
```

## 安装方法

将配置文件复制到 Ghostty 配置目录：

```bash
mkdir -p ~/Library/Application\ Support/com.mitchellh.ghostty
cp config ~/Library/Application\ Support/com.mitchellh.ghostty/config
```

在 Ghostty 中按 `Cmd+Shift+,` 重新加载配置，或直接重启 Ghostty。

## 配置详解

### 主题

| 配置项 | 值 | 说明 |
|--------|---|------|
| `theme` | `light:Flexoki Light, dark:Kanagawa Wave` | 跟随系统外观自动切换：浅色模式使用温暖的 Flexoki，深色模式使用电影感的 Kanagawa |
| `window-theme` | `auto` | 窗口边框跟随系统明暗模式 |
| `window-colorspace` | `display-p3` | 使用 Display P3 广色域，Apple 显示器色彩更丰富 |

### 字体

| 配置项 | 值 | 说明 |
|--------|---|------|
| `font-family` | `JetBrainsMono Nerd Font` | Nerd Font 字体，Claude Code 状态栏图标必须使用此类字体才能正确显示 |
| `font-size` | `15` | 适合长时间编码的字号，兼顾信息密度和可读性 |
| `font-thicken` | `true` | 略微加粗渲染，在 Retina 屏幕上更清晰 |
| `font-thicken-strength` | `120` | 针对 Apple LCD/OLED 屏幕微调的加粗强度 |
| `adjust-cell-height` | `12%` | 增加行间距，阅读 Claude Code 输出更舒适 |
| `minimum-contrast` | `1.1` | 确保文字在半透明背景下仍然可读 |

### 窗口

| 配置项 | 值 | 说明 |
|--------|---|------|
| `background-opacity` | `0.9` | 轻微透明，可以看到后方窗口内容 |
| `background-blur` | `32` | 毛玻璃模糊效果 |
| `window-padding-x` | `18` | 水平内边距，留出呼吸空间 |
| `window-padding-y` | `16` | 垂直内边距 |
| `window-padding-balance` | `true` | 终端较宽时自动居中内容 |
| `window-padding-color` | `extend` | 边距区域使用终端背景色填充 |
| `macos-titlebar-style` | `transparent` | 透明标题栏，与终端内容融为一体 |
| `macos-window-shadow` | `true` | macOS 原生窗口阴影 |
| `window-inherit-working-directory` | `true` | 新建分屏/标签页继承当前工作目录 |
| `window-save-state` | `always` | 重启 Ghostty 时自动恢复所有窗口、标签页和分屏布局 |

### 光标与输入

| 配置项 | 值 | 说明 |
|--------|---|------|
| `cursor-style` | `bar` | 细竖线光标，Claude Code 输出时不干扰视线 |
| `cursor-style-blink` | `false` | 关闭闪烁，减少视觉干扰 |
| `mouse-hide-while-typing` | `true` | 打字时自动隐藏鼠标指针 |
| `unfocused-split-opacity` | `0.9` | 非活动分屏轻微变暗，聚焦当前面板 |
| `copy-on-select` | `clipboard` | 选中文本即复制到剪贴板，无需 Cmd+C |

### 回滚缓冲区

| 配置项 | 值 | 说明 |
|--------|---|------|
| `scrollback-limit` | `100000` | 10 万行缓冲区，Claude Code 长会话不丢失任何输出历史 |

### 剪贴板

| 配置项 | 值 | 说明 |
|--------|---|------|
| `clipboard-read` | `allow` | 允许 Claude Code 读取剪贴板内容 |
| `clipboard-write` | `allow` | 允许 Claude Code 写入剪贴板 |
| `clipboard-paste-protection` | `false` | 关闭粘贴确认对话框，粘贴大段代码不会被打断 |

### Shell 集成

| 配置项 | 值 | 说明 |
|--------|---|------|
| `shell-integration` | `zsh` | 启用 Ghostty 的 zsh shell 集成 |
| `shell-integration-features` | `cursor,sudo,title` | 命令追踪、sudo 密码提示检测、自动窗口标题 |

### 快捷终端

| 配置项 | 值 | 说明 |
|--------|---|------|
| `quick-terminal-position` | `top` | 下拉终端从屏幕顶部滑出 |
| `quick-terminal-screen` | `main` | 在主显示器上显示 |
| `quick-terminal-animation-duration` | `0.15` | 150ms 快速滑入动画 |
| **`global:alt+space`** | `toggle_quick_terminal` | **在 macOS 任何位置按 `Option+Space` 即可呼出/隐藏终端** |

### 快捷键

所有快捷键均使用 `Cmd` 组合键，不会与 Claude Code 自身的快捷键（`Ctrl` 和 `Escape` 系列）冲突。

| 快捷键 | 功能 | 说明 |
|--------|------|------|
| `Cmd+D` | 右侧分屏 | 在右侧新建一个终端分屏 |
| `Cmd+Shift+D` | 下方分屏 | 在下方新建一个终端分屏 |
| `Cmd+Alt+方向键` | 切换分屏 | 在各分屏之间导航 |
| `Cmd+Shift+Enter` | 全屏切换 | 将当前分屏放大到整个窗口，再按恢复 |
| `Cmd+=` | 放大字体 | 增大字号 |
| `Cmd+-` | 缩小字体 | 减小字号 |
| `Cmd+0` | 重置字体 | 恢复默认字号 |
| `Cmd+Shift+C` | 复制 | 复制选中文本到剪贴板 |
| `Cmd+Shift+V` | 粘贴 | 从剪贴板粘贴 |

## 为什么这些配置适合 Claude Code？

1. **Nerd Font 字体** — Claude Code 状态栏使用特殊图标，只有 Nerd Font 才能正确渲染
2. **超大回滚缓冲区** — Claude Code 会话可能产生数千行输出，10 万行缓冲确保你不会丢失任何上下文
3. **剪贴板无阻碍** — 关闭粘贴保护，可以自由粘贴大段代码到 Claude Code 提示符
4. **选中即复制** — 从 Claude Code 输出中选中代码片段即自动复制，高效便捷
5. **全局快捷终端** — `Option+Space` 随时从任何应用呼出 Claude Code，无需切换窗口
6. **分屏友好快捷键** — 一边运行 Claude Code，一边查看代码或测试结果，`Cmd` 系快捷键与 Claude Code 的 `Ctrl/Esc` 系完全不冲突
7. **会话持久化** — `window-save-state = always` 让你的终端布局在 Ghostty 重启后自动恢复

## 许可证

MIT
