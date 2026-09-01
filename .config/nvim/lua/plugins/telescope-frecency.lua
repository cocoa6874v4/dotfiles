return {
  "nvim-telescope/telescope-frecency.nvim",
  version = "*",
  config = function()
    require("telescope").load_extension("frecency")
  end,
  keys = {
    {
      "<leader>ff",
      function()
        require("telescope").extensions.frecency.frecency({
          workspace = "CWD",
        })
      end,
      desc = "Find files by frecency",
    },
  },
}