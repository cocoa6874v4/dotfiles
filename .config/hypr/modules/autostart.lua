hl.on("hyprland.start",
  function()
    local autostart = {
      "wayle",
      "awww-daemon",
      "fcitx5 -d"
    }

    for _, app in ipairs(autostart) do
      hl.exec_cmd(app)
    end
  end
)
