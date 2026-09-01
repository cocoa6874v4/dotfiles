return {
  "goolord/alpha-nvim",
  dependencies = { "nvim-tree/nvim-web-devicons" },
  config = function()
    local alpha = require("alpha")
    local dashboard = require("alpha.themes.dashboard")

    local src_dir = vim.fn.expand("~/Src")

    local function get_project_buttons()
      local buttons = {}
      local uv = vim.uv or vim.loop
      local fd = uv.fs_scandir(src_dir)

      if not fd then return buttons end

      local shortcuts = { "a", "s", "d", "f", "g", "h", "j", "k", "l", ";", "1", "2", "3" }
      local i = 1

      while true do
        local name, typ = uv.fs_scandir_next(fd)
        if not name then break end

        if typ == "directory" then
          local shortcut = shortcuts[i] or tostring(i)
          local path = src_dir .. "/" .. name

          local action = "<cmd>cd " .. path .. " | e .<CR>"

          local btn = dashboard.button(shortcut, "󰉋  " .. name, action)
          table.insert(buttons, btn)
          i = i + 1
        end
      end
      return buttons
    end

    dashboard.section.header.val = {
      "                                                     ",
      "  ███╗   ██╗███████╗ ██████╗ ██╗   ██╗██████╗ ███╗   ███╗",
      "  ████╗  ██║██╔════╝██╔═══██╗██║   ██║██╔══██╗████╗ ████║",
      "  ██╔██╗ ██║█████╗  ██║   ██║██║   ██║██████╔╝██╔████╔██║",
      "  ██║╚██╗██║██╔══╝  ██║   ██║╚██╗ ██╔╝██╔══██╗██║╚██╔╝██║",
      "  ██║ ╚████║███████╗╚██████╔╝ ╚████╔╝ ██║  ██║██║ ╚═╝ ██║",
      "  ╚═╝  ╚═══╝╚══════╝ ╚═════╝   ╚═══╝  ╚═╝  ╚═╝╚═╝     ╚═╝",
      "                                                     ",
    }

    local all_buttons = {}
    
    for _, btn in ipairs(get_project_buttons()) do
      table.insert(all_buttons, btn)
    end

    table.insert(all_buttons, { type = "padding", val = 1 })
    
    table.insert(all_buttons, dashboard.button("q", "󰅙  Quit Neovim", "<cmd>qa<CR>"))

    dashboard.section.buttons.val = all_buttons

    alpha.setup(dashboard.opts)
  end
}