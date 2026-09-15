hl.window_rule({
    name = "floating-utilities",
    match = {
        class = "^(Alacritty|pavucontrol|org.pulseaudio.pavucontrol|blueman-manager|veracrypt|org.freedesktop.impl.portal.desktop.*)$",
    },
    float = true,
    center = true,
})

hl.window_rule({
    name = "floating-dialogs",
    match = { modal = true },
    float = true,
    center = true,
})

hl.window_rule({
    name = "browser-workspace",
    match = { class = "^(brave-browser|Brave-browser)$" },
    workspace = "1 silent",
})

hl.window_rule({
    name = "editor-workspace",
    match = { class = "^(code|Code)$" },
    workspace = "2 silent",
})

hl.window_rule({
    name = "communications-workspace",
    match = { class = "^(signal|Signal|Slack|slack|zoom|Zoom|thunderbird|org.mozilla.Thunderbird)$" },
    workspace = "9 silent",
})

hl.layer_rule({
    name = "rofi-no-animation",
    match = { namespace = "^rofi$" },
    no_anim = true,
})
