return {
  'stevearc/oil.nvim',
  ---@module 'oil'
  ---@type oil.SetupOpts
  opts = {
    skip_confirm_for_simple_edits = true,
  },

  keys = {
    { "<leader>e", "<cmd>Oil<CR>", desc = "Open Oil" },
  },

  dependencies = { { "nvim-mini/mini.icons", opts = {} } },
  lazy = false,
}