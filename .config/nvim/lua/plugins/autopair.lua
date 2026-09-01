return {
    'windwp/nvim-autopairs',
    event = "InsertEnter",
    dependencies = { 'Saghen/blink.cmp' },
    config = function()
        local npairs = require("nvim-autopairs")

        npairs.setup({
            check_ts = true,
            ts_config = {
                lua = { "string" },
                javascript = { "template_string" },
            },
            fast_wrap = {
                map = '<M-e>',
            },
        })
    end
}
