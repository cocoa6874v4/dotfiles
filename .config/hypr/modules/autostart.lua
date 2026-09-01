hl.on("hyprland.start",
  function()
    local autostart = {
      "waybar",
      "awww-daemon"
    }

    for _, app in ipairs(autostart) do
      hl.exec_cmd(app)
    end
  end
)
