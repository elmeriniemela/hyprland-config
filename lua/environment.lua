local home = os.getenv("HOME")
local path = os.getenv("PATH") or "/usr/local/bin:/usr/bin"

-- Keep session-specific cursor and PATH settings out of /etc/environment.
-- Modern GTK, Qt, SDL and Electron applications select Wayland themselves.
hl.env("XCURSOR_THEME", "Adwaita")
hl.env("XCURSOR_SIZE", "22")
hl.env("HYPRCURSOR_SIZE", "22")
hl.env("PATH", home .. "/.local/bin:" .. path)
