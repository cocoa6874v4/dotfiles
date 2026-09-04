return {
    {
        "neovim/nvim-lspconfig",
        dependencies = {
            { "williamboman/mason.nvim", opts = {} },
            "williamboman/mason-lspconfig.nvim",
            "saghen/blink.cmp",
            "L3MON4D3/LuaSnip",
        },

        config = function()
            local capabilities = require("blink.cmp").get_lsp_capabilities()

            vim.filetype.add({
                extension = {
                    slint = "slint",
                },
            })

            vim.api.nvim_create_autocmd("LspAttach", {
                callback = function(event)
                    local keymap = vim.keymap

                    local opts = { buffer = event.buf }

                    opts.desc = "Show LSP references"
                    keymap.set("n", "gR", "<cmd>Telescope lsp_references<CR>", opts)

                    opts.desc = "Go to declaration"
                    keymap.set("n", "gD", vim.lsp.buf.declaration, opts)

                    opts.desc = "Go to definition"
                    keymap.set("n", "gd", vim.lsp.buf.definition, opts)

                    opts.desc = "Show LSP implementations"
                    keymap.set("n", "gi", "<cmd>Telescope lsp_implementations<CR>", opts)

                    opts.desc = "Show LSP type definitions"
                    keymap.set("n", "gt", "<cmd>Telescope lsp_type_definitions<CR>", opts)

                    opts.desc = "See available code actions"
                    keymap.set({ "n", "v" }, "<leader>ca", vim.lsp.buf.code_action, opts)

                    opts.desc = "Smart rename"
                    keymap.set("n", "<leader>rn", vim.lsp.buf.rename, opts)

                    opts.desc = "Show buffer diagnostics"
                    keymap.set("n", "<leader>D", "<cmd>Telescope diagnostics bufnr=0<CR>", opts)

                    opts.desc = "Show line diagnostics"
                    keymap.set("n", "<leader>d", vim.diagnostic.open_float, opts)

                    opts.desc = "Go to previous diagnostic"
                    keymap.set("n", "[d", function()
                        vim.diagnostic.jump({ count = -1 })
                    end, opts)

                    opts.desc = "Go to next diagnostic"
                    keymap.set("n", "]d", function()
                        vim.diagnostic.jump({ count = 1 })
                    end, opts)

                    opts.desc = "Show documentation under cursor"
                    keymap.set("n", "K", vim.lsp.buf.hover, opts)
                end,
            })

            local servers = {
                "lua_ls",
                "pyright",
                "ts_ls",
                "clangd",
                "html",
                "cssls",
                "dockerls",
                "intelephense",
                "astro",
                "tailwindcss",
                "cmake",
                "slint_lsp",
                "rust_analyzer",
            }

            for _, server in ipairs(servers) do
                vim.lsp.config(server, {
                    capabilities = capabilities,
                })
            end

            -- C / C++
            vim.lsp.config("clangd", {
                capabilities = capabilities,

                cmd = {
                    "clangd",
                    "--background-index",
                    "--clang-tidy",
                    "--completion-style=detailed",
                    "--header-insertion=iwyu",
                    "--query-driver=/run/current-system/sw/bin/c++,/run/current-system/sw/bin/g++,/run/current-system/sw/bin/gcc",
                },
            })

            -- Rust
            vim.lsp.config("rust_analyzer", {
                capabilities = capabilities,

                settings = {
                    ["rust-analyzer"] = {
                        cargo = {
                            buildScripts = {
                                enable = true,
                            },
                        },

                        procMacro = {
                            enable = true,
                        },

                        check = {
                            command = "clippy",
                        },
                    },
                },
            })

            require("mason-lspconfig").setup({
                ensure_installed = servers,
            })
        end,
    },

    {
        "saghen/blink.cmp",
        version = "1.*",

        opts = {
            snippets = {
                preset = "luasnip",
            },

            completion = {
                list = {
                    selection = {
                        preselect = true,
                        auto_insert = true,
                    },
                },

                ghost_text = {
                    enabled = true,
                },
            },

            keymap = {
                preset = "super-tab",
            },

            sources = {
                default = {
                    "snippets",
                    "lsp",
                    "path",
                    "buffer",
                },

                providers = {
                    snippets = {
                        score_offset = 100,
                        min_keyword_length = 1,
                    },

                    lsp = {
                        score_offset = 0,
                    },
                },
            },

            fuzzy = {
                sorts = {
                    "score",
                    "sort_text",
                    "label",
                },
            },
        },
    },
}
