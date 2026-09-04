return {
    {
        'romgrk/barbar.nvim',
        dependencies = {
            'lewis6991/gitsigns.nvim',
            'nvim-tree/nvim-web-devicons',
            'folke/which-key.nvim',
        },
        init = function() vim.g.barbar_auto_setup = false end,
        opts = {
            animation = true,
            insert_at_start = true,
        },
        version = '^1.0.0',
        config = function(_, opts)
            require('barbar').setup(opts)
            local wk = require("which-key")

            wk.add({
                { "<leader>b", group = "バッファ操作" },

                { "<Tab>", "<Cmd>BufferNext<CR>", desc = "次のバッファ" },
                { "<S-Tab>", "<Cmd>BufferPrevious<CR>", desc = "前のバッファ" },

                { "<leader>bc", "<Cmd>BufferClose<CR>", desc = "現在のバッファを閉じる" },
                { "<leader>ba", "<Cmd>BufferCloseAllButCurrent<CR>", desc = "他のバッファをすべて閉じる" },
            })
        end,
    },
}
