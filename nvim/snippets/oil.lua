local ls = require("luasnip")
local s = ls.snippet
local f = ls.function_node

local function create_file(path)
    if vim.uv.fs_stat(path) then
        return
    end

    vim.fn.writefile({}, path)
end

return {
    s("cpp", {
        f(function()
            local oil = require("oil")
            local root = oil.get_current_dir()

            if not root then
                vim.notify("Could not get Oil directory", vim.log.levels.ERROR)
                return ""
            end

            local src = vim.fs.joinpath(root, "src")

            vim.fn.mkdir(src, "p")

            create_file(vim.fs.joinpath(root, "LICENSE"))
            create_file(vim.fs.joinpath(src, "main.cpp"))
            create_file(vim.fs.joinpath(root, "CMakeLists.txt"))
            create_file(vim.fs.joinpath(root, "cmake-variants.yaml"))
            create_file(vim.fs.joinpath(root, ".gitignore"))
            create_file(vim.fs.joinpath(root, "README.md"))

            vim.schedule(function()
                require("oil").refresh()
                vim.notify("C++ project created")
            end)

            return ""
        end),
    }),
}
