return {
    "goolord/alpha-nvim",

    config = function()
        local alpha = require("alpha")
        local dashboard = require("alpha.themes.dashboard")

        dashboard.section.buttons.val = {
            dashboard.button(
                "p",
                "󰏓  Projects",
                "<cmd>Telescope projects<CR>"
            ),

            dashboard.button(
                "f",
                "󰱼  Find File",
                "<cmd>Telescope find_files<CR>"
            ),

            dashboard.button(
                "r",
                "󰋚  Recent Files",
                "<cmd>Telescope oldfiles<CR>"
            ),

            dashboard.button(
                "c",
                "  Neovim Config",
                "<cmd>cd ~/.config/nvim | Telescope find_files<CR>"
            ),

            dashboard.button(
                "q",
                "󰅚  Quit",
                "<cmd>qa<CR>"
            ),
        }

        alpha.setup(dashboard.config)
    end,
}

