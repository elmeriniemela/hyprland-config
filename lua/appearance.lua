hl.config({
    general = {
        gaps_in = 3,
        gaps_out = 3,
        border_size = 1,
        col = {
            active_border = "rgb(464646)",
            inactive_border = "rgb(1c2022)",
        },
        resize_on_border = true,
        allow_tearing = false,
        layout = "master",
    },
    decoration = {
        rounding = 0,
        active_opacity = 1.0,
        inactive_opacity = 1.0,
        shadow = { enabled = false },
        blur = { enabled = false },
    },
    animations = { enabled = true },
    master = {
        new_status = "slave",
        orientation = "left",
        mfact = 0.55,
    },
    misc = {
        disable_hyprland_logo = true,
        force_default_wallpaper = 0,
    },
    xwayland = {
        enabled = false,
    },
})

hl.curve("quick", {
    type = "bezier",
    points = { { 0.2, 0.8 }, { 0.2, 1.0 } },
})

hl.animation({ leaf = "global", enabled = true, speed = 12, bezier = "quick" })
hl.animation({ leaf = "windows", enabled = true, speed = 14, bezier = "quick" })
hl.animation({ leaf = "workspaces", enabled = true, speed = 14, bezier = "quick", style = "fade" })
