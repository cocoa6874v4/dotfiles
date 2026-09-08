return {
  {
    "L3MON4D3/LuaSnip",
    version = "v2.*",
    lazy = true,
    build = "make install_jsregexp",
    dependencies = {},
    opts = {
      history = true,
      updateevents = "TextChanged,TextChangedI",
      delete_check_events = "TextChanged",
    },
    config = function(_, opts)
      local luasnip = require("luasnip")

      luasnip.setup(opts)

      require("luasnip.loaders.from_lua").lazy_load({
      paths = {
        vim.fn.stdpath("config") .. "/snippets",
       },
      })
    end,
  },
}
