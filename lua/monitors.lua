local external = "desc:ASUSTek COMPUTER INC. ASUS MG28U"

-- Unknown projectors and docks get a safe automatic layout. Specific rules
-- below override it for the laptop panel and the normal desk monitor.
hl.monitor({
    output = "",
    mode = "highres",
    position = "auto",
    scale = 1,
})

hl.monitor({
    output = external,
    mode = "highres",
    position = "0x0",
    scale = 1,
})

hl.monitor({
    output = "eDP-1",
    mode = "highres",
    position = "960x2160",
    scale = 1,
})

return { external = external }
