local external = "desc:ASUSTek COMPUTER INC. ASUS MG28U"

-- Put any external display above the laptop panel by default. The monitor
-- helper reapplies the same layout after hotplugging a display.
hl.monitor({
    output = "",
    mode = "preferred",
    position = "0x0",
    scale = 1,
})

hl.monitor({
    output = "eDP-1",
    mode = "preferred",
    position = "auto-center-down",
    scale = 1,
})

return { external = external }
