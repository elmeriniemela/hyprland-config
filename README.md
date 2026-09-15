# Hyprland configuration

Native-Wayland-only Hyprland configuration for this laptop. It preserves the
launcher, workspace, application, two-bar, and monitor workflows from the old
Awesome setup while using global workspaces 1–9.

Requires Hyprland 0.56 or newer. Hyprland's XWayland server is disabled.

## Install

Clone this repository to the standard Hyprland configuration location,
`~/.config/hypr`. The normal installer is bootstrap-linux:

```bash
bootstrap-linux laptop
```

The installer accepts the repository directly at `~/.config/hypr` and refuses
to replace an unrelated configuration, desktop entry, or launcher. Resolve
such conflicts explicitly, then rerun it.

For a one-off user-only setup, link its native launcher directly:

```bash
ln -s "$HOME/.config/hypr/bin/native-app" "$HOME/.local/bin/hypr-native-app"
```

## Keybindings

| Binding | Action |
| --- | --- |
| Super+Space / Super+R | Application launcher |
| Super+F1 | Searchable keybinding help |
| Super+Return | Focus or open terminal |
| Alt+Return | Open a new terminal |
| Super+Q/E/T/A/S/Z/C | Browser, files, mail, Signal, Slack, Zoom, code |
| Super+W | Close active window |
| Super+Escape | Click a window to kill it |
| Super+U | Focus urgent or previous window |
| Ctrl+Super+R | Reload and validate configuration |
| Ctrl+Super+W | Reapply monitor layout |
| Ctrl+Shift+Escape | Task manager |
| Alt+Tab | Window selector |
| Print | Region screenshot and annotation |
| Super+V | Clipboard history |
| Super+F | Toggle floating |
| Super+M | Minimize to the hidden workspace |
| Super+Shift+D | Close window |
| Super+1…9 | Select global workspace |
| Super+Shift+1…9 | Move window and follow it |
| Super+left/right mouse | Move/resize window |

The XF86 brightness, volume, mute, and power keys retain their previous
actions. The old multi-tag chords are intentionally not defined because
Hyprland windows belong to one normal workspace.

The Waybar uses the original Awesome theme icons. Click the clock to open the
current month with ISO week numbers; hover it for Waybar's built-in calendar.

## Displays and applications

An external display is placed above and centered with the laptop panel. Run
`bootstrap-linux monitor` after hotplugging a display to reapply the layout.
Workspace 1 and the browser live on the laptop; with the ASUS MG28U connected,
workspaces 2–9 use it, with VS Code on 2 and communication applications on 9.
With the ASUS display absent, Hyprland moves its workspaces to the laptop.

Applications are forced to native Wayland. Create `use-web-slack` or
`use-web-zoom` in this directory to use the corresponding Brave web client.
Signal has no configured web fallback.

## Validation

Run these inside the Hyprland session:

```bash
~/.config/hypr/bin/check-config
hyprctl configerrors
bootstrap-linux monitor
hyprctl clients -j | jq '[.[] | select(.xwayland)]'
pgrep -a Xwayland
systemctl --user status xdg-desktop-portal-hyprland
```

The first command and XWayland checks should produce no output or an empty
array. Test screen sharing, file selection, lock/resume, monitor hotplug,
clipboard images and text, screenshots, and every bound daily application
before removing the previous desktop packages.

## TTY recovery

Use Ctrl+Alt+F3, log in, and inspect:

```bash
journalctl --user -b -u xdg-desktop-portal-hyprland
journalctl -b -u sddm
```

To stop an autologin loop while repairing the configuration, stop SDDM from
the TTY with `sudo systemctl stop sddm`. Start Hyprland manually with:

```bash
dbus-run-session start-hyprland -- --config "$HOME/.config/hypr/hyprland.lua"
```
