return {
    "nvim-treesitter/nvim-treesitter-context",
    config = function()
        require("treesitter-context").setup({
            enable = true,
            max_lines = 3,
            multiline_threshold = 10,
            line_numbers = true,
            mode = "cursor",
        })

        vim.keymap.set("n", "<leader>pc", function()
            require("treesitter-context").go_to_context(vim.v.count1)
        end)
    end,
}
