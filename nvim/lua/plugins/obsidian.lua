return {
    "obsidian-nvim/obsidian.nvim",
    version = "*",

    ft = "markdown",

    opts = function()
        return {
            legacy_commands = false,

            workspaces = {
                {
                    name = "personal",
                    path = "/home/cocoa6874/vault/meme",
                },
            },

            notes_subdir = "notes",
            new_notes_location = "notes_subdir",

            note_id_func = require("obsidian.builtin").title_id,

            note = {
                template = vim.NIL,
            },

            frontmatter = {
                enabled = false,
            },

            picker = {
                name = "telescope.nvim",
            },

            cache = {
                enabled = true,
            },

            link = {
                style = "wiki",
                auto_update = false,
            },

            ui = {
                enable = false,
            },
        }
    end,

    keys = {
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
