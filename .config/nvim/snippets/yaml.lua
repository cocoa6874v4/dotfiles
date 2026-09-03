local ls = require("luasnip")
local s = ls.snippet
local t = ls.text_node

return {
    s({
        trig = "variants",
        condition = function()
            return vim.fn.expand("%:t") == "cmake-variants.yaml"
        end,
    }, {
        t({
            "buildType:",
            "  default: release",
            "  choices:",
            "    release:",
            "      short: Release",
            "      buildType: Release",
        }),
    }),
}
