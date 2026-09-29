hl.on("hyprland.start",
    function()
        local autostart = {
            "awww-daemon",
            "fcitx5 -d",
            "wayle shell",
            "swaync"
        }

        for _, app in ipairs(autostart) do
            hl.exec_cmd(app)
        end
    end
)
