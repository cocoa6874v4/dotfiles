return {
    "DrKJeff16/project.nvim",

    dependencies = {
        "nvim-telescope/telescope.nvim",
    },

    opts = {
        patterns = {
            ".git",
            "CMakeLists.txt",
            "Makefile",
        },
    },

    config = function(_, opts)
        require("project").setup(opts)

        require("telescope").load_extension("projects")
    end,
}
