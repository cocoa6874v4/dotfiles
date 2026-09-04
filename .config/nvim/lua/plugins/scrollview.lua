return {
    {
        "dstein64/nvim-scrollview",
        event = { "BufReadPost", "BufNewFile" },

        opts = {
            current_only = false,

            signs_on_startup = {
                "diagnostics",
                "search",
                "marks",
                "cursor",
                "quickfix",
            },
        },
    },
}
