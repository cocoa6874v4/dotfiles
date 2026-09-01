return {
  'Wansmer/treesj',
  dependencies = { 'nvim-treesitter/nvim-treesitter' },
  keys = {
    { "gs", function() require("treesj").toggle() end, desc = "TreeSJ toggle split/join" },
  },
  config = function()
    require('treesj').setup({
      use_default_keymaps = false,
    })
  end,
}