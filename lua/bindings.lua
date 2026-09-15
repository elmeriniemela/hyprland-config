local home = os.getenv("HOME")
local bin = home .. "/.config/hypr/bin/"

local function helper(name, arguments)
    local command = string.format("%q", bin .. name)
    if arguments then
        command = command .. " " .. arguments
    end
    return hl.dsp.exec_cmd(command)
end

local function bind(keys, dispatcher, description, flags)
    flags = flags or {}
    flags.description = description
    hl.bind(keys, dispatcher, flags)
end

bind("SUPER + space", helper("launcher"), "Application launcher")
bind("SUPER + r", helper("launcher"), "Application launcher")
bind("SUPER + F1", helper("keybind-help"), "Show keybindings")

bind("SUPER + Return", helper("native-app", "terminal"), "Focus or open terminal")
bind("ALT + Return", helper("native-app", "--new terminal"), "Open a new terminal")
bind("SUPER + q", helper("native-app", "browser"), "Focus or open browser")
bind("SUPER + e", helper("native-app", "files"), "Focus or open file manager")
bind("SUPER + t", helper("native-app", "mail"), "Focus or open mail")
bind("SUPER + w", helper("native-app", "whatsapp"), "Focus or open WhatsApp")
bind("SUPER + a", helper("native-app", "signal"), "Focus or open Signal")
bind("SUPER + s", helper("native-app", "slack"), "Focus or open Slack")
bind("SUPER + z", helper("native-app", "zoom"), "Focus or open Zoom")
bind("SUPER + c", helper("native-app", "code"), "Focus or open VS Code")

bind("SUPER + Escape", hl.dsp.exec_cmd("hyprctl kill"), "Select a window to kill")
bind("SUPER + u", hl.dsp.focus({ urgent_or_last = true }), "Focus urgent or previous window")
bind("CTRL + SUPER + r", helper("reload-config"), "Reload Hyprland")
bind("CTRL + SUPER + w", helper("monitor-layout"), "Reapply monitor layout")
bind("CTRL + SHIFT + Escape", hl.dsp.exec_cmd("xfce4-taskmanager"), "Task manager")
bind("ALT + Tab", helper("window-switcher"), "Window switcher")
bind("Print", helper("screenshot"), "Capture a screen region")
bind("SUPER + v", helper("clipboard-menu"), "Clipboard history")

bind("XF86PowerOff", hl.dsp.exec_cmd("systemctl poweroff"), "Power off")
bind("XF86PowerDown", hl.dsp.exec_cmd("systemctl poweroff"), "Power off")
bind("XF86MonBrightnessUp", hl.dsp.exec_cmd("brightnessctl set 1%+"), "Increase brightness", { locked = true, repeating = true })
bind("XF86MonBrightnessDown", hl.dsp.exec_cmd("brightnessctl set 1%-"), "Decrease brightness", { locked = true, repeating = true })
bind("XF86AudioRaiseVolume", hl.dsp.exec_cmd("wpctl set-volume -l 1.5 @DEFAULT_AUDIO_SINK@ 1%+"), "Increase volume", { locked = true, repeating = true })
bind("XF86AudioLowerVolume", hl.dsp.exec_cmd("wpctl set-volume @DEFAULT_AUDIO_SINK@ 1%-"), "Decrease volume", { locked = true, repeating = true })
bind("XF86AudioMute", hl.dsp.exec_cmd("wpctl set-mute @DEFAULT_AUDIO_SINK@ toggle"), "Mute volume", { locked = true })

bind("SUPER + f", hl.dsp.window.float({ action = "toggle" }), "Toggle floating")
bind("SUPER + m", helper("minimized-windows", "minimize"), "Minimize window")
bind("SUPER + SHIFT + d", hl.dsp.window.close(), "Close window")

for workspace = 1, 9 do
    bind("SUPER + " .. workspace, hl.dsp.focus({ workspace = workspace }), "Open workspace " .. workspace)
    bind("SUPER + SHIFT + " .. workspace, hl.dsp.window.move({ workspace = workspace, follow = true }), "Move window to workspace " .. workspace)
end

bind("SUPER + mouse:272", hl.dsp.window.drag(), "Move window", { mouse = true })
bind("SUPER + mouse:273", hl.dsp.window.resize(), "Resize window", { mouse = true })
