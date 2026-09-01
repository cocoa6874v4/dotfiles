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
			local lspconfig = require("lspconfig")

			vim.filetype.add({
				extension = {
					slint = "slint",
				},
			})

			vim.api.nvim_create_autocmd("LspAttach", {
				callback = function(event)
					local opts = { buffer = event.buf }
					vim.keymap.set("n", "gd", vim.lsp.buf.definition, opts)
					vim.keymap.set("n", "K", vim.lsp.buf.hover, opts)
					vim.keymap.set("n", "<leader>rn", vim.lsp.buf.rename, opts)
					vim.keymap.set("n", "<leader>ca", vim.lsp.buf.code_action, opts)
				end,
			})

			require("mason-lspconfig").setup({
				ensure_installed = {
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
				},
				handlers = {
					function(server_name)
						local server_opts = {
							capabilities = capabilities,
						}

						if server_name == "clangd" then
							server_opts.capabilities.offsetEncoding = { "utf-16" }
							server_opts.cmd = {
								"clangd",
								"--background-index",
								"--clang-tidy",
								"--completion-style=detailed",
								"--header-insertion=iwyu",
							}
							server_opts.on_new_config = function(new_config, new_cwd)
								local ok, cmake = pcall(require, "cmake-tools")
								if ok then
									cmake.clangd_on_new_config(new_config)
								end
							end
						end

						if server_name == "rust_analyzer" then
							server_opts.settings = {
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
							}
						end

						lspconfig[server_name].setup(server_opts)
					end,
				},
			})
		end,
	},

	{
		"saghen/blink.cmp",
                version = '1.*',
		opts = {
			snippets = { preset = "luasnip" },

			completion = {
				list = { selection = { preselect = true, auto_insert = true } },
				ghost_text = { enabled = true },
			},

			keymap = { preset = "super-tab" },

			sources = {
				default = { "snippets", "lsp", "path", "buffer" },

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

