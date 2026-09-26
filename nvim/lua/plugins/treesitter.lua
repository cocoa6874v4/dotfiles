return {
    "nvim-treesitter/nvim-treesitter",
    branch = "main",
    lazy = false,
    build = ":TSUpdate",

    dependencies = {
        {
            "nvim-treesitter/nvim-treesitter-textobjects",
            branch = "main",
        },
    },

    config = function()
        require("nvim-treesitter").setup()

        require("nvim-treesitter-textobjects").setup({
            select = {
                lookahead = true,

                selection_modes = {
                    ["@parameter.outer"] = "v",
                    ["@function.outer"] = "V",
                    ["@class.outer"] = "V",
                },
            },

            move = {
                set_jumps = true,
            },
        })

        local select = require("nvim-treesitter-textobjects.select")
        local move = require("nvim-treesitter-textobjects.move")
        local swap = require("nvim-treesitter-textobjects.swap")

        -- Select
        vim.keymap.set({ "x", "o" }, "af", function()
            select.select_textobject("@function.outer", "textobjects")
        end)

        vim.keymap.set({ "x", "o" }, "if", function()
            select.select_textobject("@function.inner", "textobjects")
        end)

        vim.keymap.set({ "x", "o" }, "ac", function()
            select.select_textobject("@class.outer", "textobjects")
        end)

        vim.keymap.set({ "x", "o" }, "ic", function()
            select.select_textobject("@class.inner", "textobjects")
        end)

        vim.keymap.set({ "x", "o" }, "aa", function()
            select.select_textobject("@parameter.outer", "textobjects")
        end)

        vim.keymap.set({ "x", "o" }, "ia", function()
            select.select_textobject("@parameter.inner", "textobjects")
        end)

        -- Move
        vim.keymap.set({ "n", "x", "o" }, "]f", function()
            move.goto_next_start("@function.outer", "textobjects")
        end)

        vim.keymap.set({ "n", "x", "o" }, "[f", function()
            move.goto_previous_start("@function.outer", "textobjects")
        end)

        vim.keymap.set({ "x", "o" }, "a=", function()
            select.select_textobject("@assignment.outer", "textobjects")
        end)

        vim.keymap.set({ "x", "o" }, "i=", function()
            select.select_textobject("@assignment.rhs", "textobjects")
        end)
    end,
}
