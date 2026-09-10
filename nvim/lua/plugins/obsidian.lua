return {
    "obsidian-nvim/obsidian.nvim",
    version = "*", -- use latest release, remove to use latest commit
    ---@module 'obsidian'
    ---@type obsidian.config
    opts = {
        legacy_commands = false, -- this will be removed in 4.0.0
        workspaces = {
            {
                name = "memo",
                path = "/home/cocoa6874/vault/meme",
            },
        },

        note_id_func = require("obsidian.builtin").title_id,

        cache = {
            enabled = true,
        },
    },

    keys = {
        {
            "<leader>on",
            "<cmd>Obsidian quick_switch<CR>",
            desc = "Obsidian notes",
        },
        {
            "<leader>os",
            "<cmd>Obsidian search<CR>",
            desc = "Obsidian search",
        },
        {
            "<leader>ob",
            "<cmd>Obsidian backlinks<CR>",
            desc = "Obsidian backlinks",
        },
        {
            "<leader>ot",
            "<cmd>Obsidian today<CR>",
            desc = "Obsidian today",
        },
    },
}
