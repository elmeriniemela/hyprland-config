hl.monitor({
    output = "eDP-1",
    mode = "preferred",
    position = "0x0",
    scale = 1,
})

-- Put any external display above the laptop panel by default. Directional
-- placement is ignored for the first output, so anchor the built-in panel and
-- apply the direction to subsequently matched external outputs.
hl.monitor({
    output = "",
    mode = "preferred",
    position = "auto-center-up",
    scale = 1,
})
