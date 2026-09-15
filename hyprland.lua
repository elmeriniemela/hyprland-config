-- Hyprland 0.56+ configuration.
-- Keep each concern isolated so a failure in one required file does not hide
-- errors in the rest of the configuration.
require("lua.environment")
require("lua.monitors")
require("lua.input")
require("lua.appearance")
require("lua.workspaces")
require("lua.rules")
require("lua.bindings")
require("lua.autostart")
