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
    animations = { enabled = false },
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
