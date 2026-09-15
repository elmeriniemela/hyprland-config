# Hyprland configuration

Native-Wayland-only Hyprland configuration for this laptop. It preserves the
launcher, workspace, application, two-bar, and monitor workflows from the old
Awesome setup while using global workspaces 1–9. Xorg-specific launch wrappers,
desktop-entry overrides, and monitor scripts have been removed.

Requires Hyprland 0.56 or newer. Hyprland's XWayland server is disabled.

## Install

Clone this repository to the standard Hyprland configuration location,
`~/.config/hypr`. The normal installer is bootstrap-linux:

```bash
bootstrap-linux laptop
```

The installer accepts the repository directly at `~/.config/hypr`, links the
Waybar configuration, installs the two explicit web-app launchers, and enables
the packaged Waybar, hyprpaper, hypridle, and hyprpolkitagent user services. It
refuses to replace unrelated configurations or desktop entries.

For a one-off user-only setup, link Waybar and enable the same services:

```bash
ln -s "$HOME/.config/hypr/waybar" "$HOME/.config/waybar"
systemctl --user enable waybar hyprpaper hypridle hyprpolkitagent
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
| Ctrl+Shift+Escape | Task manager |
| Alt+Tab | Window selector |
| Print | Region screenshot and annotation |
| Super+V | Clipboard history |
| Super+F | Toggle floating |
| Super+Shift+D | Close window |
| Super+1…9 | Select global workspace |
| Super+Shift+1…9 | Move window and follow it |
| Super+left/right mouse | Move/resize window |

The XF86 brightness, volume, mute, and power keys retain their previous
actions. The old multi-tag chords are intentionally not defined because
Hyprland windows belong to one normal workspace.

Waybar uses Font Awesome glyphs instead of copied bitmap assets. Click the clock
to open the current month with ISO week numbers; hover it for Waybar's built-in
calendar. Clicking a taskbar item uses Waybar's native minimize-or-raise action.

## Displays and applications

An external display is placed automatically above and centered with the laptop
panel. Hyprland recomputes the layout on hotplug. Workspace 1 and the browser
live on the laptop. Other workspaces are created on demand and are not pinned
to an output; Waybar still displays selectors for workspaces 1–9. VS Code opens
on 2 and communication applications on 9.

Applications use their native Wayland defaults, with XWayland disabled as a
backstop. `Slack (Web)` and `Zoom (Web)` are separate launcher entries; the
packaged native launchers remain intact, including their MIME types and actions.

## Validation

Run these inside the Hyprland session:

```bash
~/.config/hypr/bin/check-config
hyprctl configerrors
hyprctl clients -j | jq '[.[] | select(.xwayland)]'
pgrep -a Xwayland
systemctl --user status waybar hyprpaper hypridle hyprpolkitagent
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
