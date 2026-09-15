local config = os.getenv("HOME") .. "/.config/hypr"

hl.on("hyprland.start", function()
    hl.exec_cmd(config .. "/bin/clipboard-watch")
    hl.exec_cmd("nm-applet --indicator")
    hl.exec_cmd("blueman-applet")
end)
