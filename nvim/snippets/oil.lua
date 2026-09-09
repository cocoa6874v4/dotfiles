local ls = require("luasnip")
local s = ls.snippet
local t = ls.text_node

return {
    s("cpp", {
        t({
            "LICENSE",
            "src/main.cpp",
            "CMakeLists.txt",
            "cmake-variants.yaml",
            ".gitignore",
            "README.md",
        }),
    }),
}
