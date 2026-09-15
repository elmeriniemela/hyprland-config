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

local applications = {
    terminal = { class = "^Alacritty$", command = "alacritty" },
    browser = { class = "^(brave-browser|Brave-browser)$", command = "brave" },
    files = { class = "^(thunar|Thunar)$", command = "thunar" },
    mail = { class = "^(thunderbird|org.mozilla.Thunderbird)$", command = "thunderbird" },
    signal = { class = "^(signal|Signal)$", command = "signal-desktop" },
    slack = { class = "^(slack|Slack)$", command = "/usr/bin/slack --gtk-version=3 -s" },
    zoom = { class = "^(zoom|Zoom)$", command = "/usr/bin/zoom" },
    code = { class = "^(code|Code)$", title = "Visual Studio Code", command = "code" },
}

local function focus_or_launch(name)
    return function()
        local application = applications[name]
        local window = hl.get_windows({ class = application.class })[1]
        if not window and application.title then
            window = hl.get_windows({ title = application.title })[1]
        end

        if window then
            hl.dispatch(hl.dsp.focus({ window = window }))
        else
            hl.exec_cmd(application.command)
        end
    end
end

bind("SUPER + space", helper("launcher"), "Application launcher")
bind("SUPER + r", helper("launcher"), "Application launcher")
bind("SUPER + F1", helper("keybind-help"), "Show keybindings")

bind("SUPER + Return", focus_or_launch("terminal"), "Focus or open terminal")
bind("ALT + Return", hl.dsp.exec_cmd("alacritty"), "Open a new terminal")
bind("SUPER + q", focus_or_launch("browser"), "Focus or open browser")
bind("SUPER + e", focus_or_launch("files"), "Focus or open file manager")
bind("SUPER + t", focus_or_launch("mail"), "Focus or open mail")
bind("SUPER + w", hl.dsp.window.close(), "Close active window")
bind("SUPER + a", focus_or_launch("signal"), "Focus or open Signal")
bind("SUPER + s", focus_or_launch("slack"), "Focus or open Slack")
bind("SUPER + z", focus_or_launch("zoom"), "Focus or open Zoom")
bind("SUPER + c", focus_or_launch("code"), "Focus or open VS Code")

bind("SUPER + Escape", hl.dsp.exec_cmd("hyprctl kill"), "Select a window to kill")
bind("SUPER + u", hl.dsp.focus({ urgent_or_last = true }), "Focus urgent or previous window")
bind("CTRL + SUPER + r", helper("reload-config"), "Reload Hyprland")
bind("CTRL + SHIFT + Escape", hl.dsp.exec_cmd("xfce4-taskmanager"), "Task manager")
bind("ALT + Tab", helper("window-switcher"), "Window switcher")
bind("Print", helper("screenshot"), "Capture a screen region")
bind("SUPER + v", helper("clipboard-menu"), "Clipboard history")

bind("XF86PowerOff", helper("power-menu"), "Session menu")
bind("XF86PowerDown", helper("power-menu"), "Session menu")
bind("XF86MonBrightnessUp", hl.dsp.exec_cmd("brightnessctl set 1%+"), "Increase brightness", { locked = true, repeating = true })
bind("XF86MonBrightnessDown", hl.dsp.exec_cmd("brightnessctl set 1%-"), "Decrease brightness", { locked = true, repeating = true })
bind("XF86AudioRaiseVolume", hl.dsp.exec_cmd("wpctl set-volume -l 1.5 @DEFAULT_AUDIO_SINK@ 1%+"), "Increase volume", { locked = true, repeating = true })
bind("XF86AudioLowerVolume", hl.dsp.exec_cmd("wpctl set-volume @DEFAULT_AUDIO_SINK@ 1%-"), "Decrease volume", { locked = true, repeating = true })
bind("XF86AudioMute", hl.dsp.exec_cmd("wpctl set-mute @DEFAULT_AUDIO_SINK@ toggle"), "Mute volume", { locked = true })

bind("SUPER + f", hl.dsp.window.float({ action = "toggle" }), "Toggle floating")
bind("SUPER + SHIFT + d", hl.dsp.window.close(), "Close window")

for workspace = 1, 9 do
    bind("SUPER + " .. workspace, hl.dsp.focus({ workspace = workspace }), "Open workspace " .. workspace)
    bind("SUPER + SHIFT + " .. workspace, hl.dsp.window.move({ workspace = workspace, follow = true }), "Move window to workspace " .. workspace)
end

bind("SUPER + mouse:272", hl.dsp.window.drag(), "Move window", { mouse = true })
bind("SUPER + mouse:273", hl.dsp.window.resize(), "Resize window", { mouse = true })
