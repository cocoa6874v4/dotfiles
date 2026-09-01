return {
    "nvim-treesitter/nvim-treesitter",
    branch = "main",
    lazy = false,
    build = ":TSUpdate",
    config = function()
        if vim.fn.has("wsl") == 1 then
            local local_bin = vim.fn.expand("~/.local/bin")
            vim.env.PATH = local_bin .. ":" .. vim.env.PATH
            
            vim.env.CC = "gcc"
        end

        local is_windows = vim.fn.has("win32") == 1
        local is_wsl = vim.fn.has("wsl") == 1
        local parser_dir = vim.fn.stdpath("data") .. (is_windows and "/treesitter-win" or "/treesitter-wsl")

	if is_wsl then
          local local_bin = vim.fn.expand("~/.local/bin")
          vim.env.PATH = local_bin .. ":" .. vim.env.PATH
          vim.env.CC = "gcc"
         elseif is_windows then
           vim.env.CC = "clang"
           vim.env.CXX = "clang++"
         end

        if vim.fn.isdirectory(parser_dir) == 0 then
            vim.fn.mkdir(parser_dir, "p")
        end

        require("nvim-treesitter").setup({
            install_dir = parser_dir,
        })

        vim.api.nvim_create_autocmd("FileType", {
            group = vim.api.nvim_create_augroup("vim-treesitter-start", {}),
            callback = function()
                pcall(vim.treesitter.start)
                vim.bo.indentexpr = "v:lua.require'nvim-treesitter'.indentexpr()"
            end,
        })
    end
}
