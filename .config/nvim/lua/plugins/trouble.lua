return {
  {
    "folke/trouble.nvim",
    cmd = "Trouble",
    opts = {
      keys = {
        ["<cr>"] = "jump_close",
      },
    },
    keys = {
      {
        "<leader>xx",
        "<cmd>Trouble diagnostics open focus=true<cr>",
        desc = "Workspace Diagnostics",
      },
    },
  },
}