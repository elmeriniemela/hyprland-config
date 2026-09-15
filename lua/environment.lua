local home = os.getenv("HOME")
local path = os.getenv("PATH") or "/usr/local/bin:/usr/bin"

-- This session is intentionally native Wayland only. Keep these variables out
-- of /etc/environment so TTYs and non-Hyprland sessions are not affected.
hl.env("GDK_BACKEND", "wayland")
hl.env("QT_QPA_PLATFORM", "wayland")
hl.env("SDL_VIDEODRIVER", "wayland")
hl.env("CLUTTER_BACKEND", "wayland")
hl.env("ELECTRON_OZONE_PLATFORM_HINT", "wayland")
hl.env("XCURSOR_THEME", "Adwaita")
hl.env("XCURSOR_SIZE", "22")
hl.env("HYPRCURSOR_SIZE", "22")
hl.env("PATH", home .. "/.local/bin:" .. path)
