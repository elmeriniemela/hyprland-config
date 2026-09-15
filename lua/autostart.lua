local home = os.getenv("HOME")
local config = home .. "/.config/hypr"

hl.on("hyprland.start", function()
    hl.exec_cmd("waybar --config " .. config .. "/waybar/config.jsonc --style " .. config .. "/waybar/style.css")
    hl.exec_cmd("hyprpaper --config " .. config .. "/hyprpaper.conf")
    hl.exec_cmd("hypridle --config " .. config .. "/hypridle.conf")
    hl.exec_cmd(config .. "/bin/clipboard-watch")
    hl.exec_cmd("systemctl --user start hyprpolkitagent.service")
    hl.exec_cmd("nm-applet --indicator")
    hl.exec_cmd("blueman-applet")
end)
