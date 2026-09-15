hl.workspace_rule({
    workspace = "1",
    monitor = "eDP-1",
    default = true,
    persistent = true,
    layout = "monocle",
})

for workspace = 2, 9 do
    hl.workspace_rule({
        workspace = tostring(workspace),
        persistent = true,
        layout = "master",
    })
end

hl.workspace_rule({
    workspace = "2",
    default = true,
    persistent = true,
    layout = "master",
})
