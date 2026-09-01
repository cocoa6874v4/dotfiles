return {
  "stevearc/aerial.nvim",
  dependencies = {
    "nvim-treesitter/nvim-treesitter",
    "nvim-tree/nvim-web-devicons",
  },
  opts = {
    layout = {
      default_direction = "left",
      placement = "window",
      min_width = 20,
      max_width = 40,
    },

    open_automatic = true,
    attach_mode = "global",
    close_on_select = false,
  },

  config = function(_, opts)
    require("aerial").setup(opts)

    vim.keymap.set("n", "<leader>a", function()
      require("aerial").focus()
    end, { desc = "Focus aerial" })
  end,
}
