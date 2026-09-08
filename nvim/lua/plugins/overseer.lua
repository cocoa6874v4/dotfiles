return {
	{
		"stevearc/overseer.nvim",
		cmd = { "OverseerOpen", "OverseerToggle", "OverseerRun" },
		dependencies = {
			"akinsho/toggleterm.nvim",
		},
		opts = {
			task_list = {
				direction = "right",
				bindings = {
					["<C-h>"] = false,
					["<C-l>"] = false,
				},
			},
		},

		config = function(_, opts)
			local overseer = require("overseer")
			local Terminal = require("toggleterm.terminal").Terminal
			overseer.setup(opts)

			overseer.register_template({
				name = "Python: ファイルを実行",
				priority = 10,
				builder = function()
					local file = vim.fn.expand("%:p")
					return {
						cmd = { "python" },
						args = { file },
						name = "python " .. vim.fn.expand("%:t"),
						components = {
							{ "on_output_summarize", max_lines = 8 },
							"on_exit_set_status",
							"on_complete_notify",
							"default",
						},
					}
				end,
				condition = { filetype = { "python" } },
			})

			overseer.register_template({
				name = "Python: モジュールとして実行 (-m)",
				priority = 20,
				builder = function()
					local rel = vim.fn.expand("%:.:r"):gsub("/", "."):gsub("\\", ".")
					return {
						cmd = { "python" },
						args = { "-m", rel },
						name = "python -m " .. rel,
						components = {
							{ "on_output_summarize", max_lines = 8 },
							"on_exit_set_status",
							"on_complete_notify",
							"default",
						},
					}
				end,
				condition = { filetype = { "python" } },
			})

			overseer.register_template({
				name = "Rust: main.rs を実行",
				priority = 30,
				builder = function()
					return {
						cmd = { "cmd" },
						args = { "/c", "rustc main.rs && .\\main.exe" },
						name = "rustc main.rs && .\\main.exe",
						components = {
							{ "on_output_summarize", max_lines = 8 },
							"on_exit_set_status",
							"on_complete_notify",
							"default",
						},
					}
				end,
				condition = { filetype = { "rust" } },
			})

			-- ── キーマップ ────────────────────────────────────────────────
			local map = vim.keymap.set
			local o = { silent = true }

			map("n", "<leader>oo", "<cmd>OverseerToggle<CR>", o)
			map("n", "<leader>or", "<cmd>OverseerRun<CR>", o)
			map("n", "<leader>ol", "<cmd>OverseerLoadBundle<CR>", o)
			map("n", "<leader>os", "<cmd>OverseerSaveBundle<CR>", o)
			map("n", "<leader>oq", "<cmd>OverseerQuickAction<CR>", o)
			map("n", "<leader>ot", "<cmd>OverseerTaskAction<CR>", o)
			map("n", "<leader>rr", function()
				vim.cmd("write")

				Terminal:new({
					cmd = "cmd /c cargo run",
					direction = "horizontal",
					close_on_exit = false,
					auto_scroll = true,
					hidden = false,
				}):open()
			end, vim.tbl_extend("force", o, { desc = "Rust: Run" }))

			map("n", "<leader>rc", function()
				vim.cmd("write")

				Terminal:new({
					cmd = "cmd /c cargo check",
					direction = "horizontal",
					close_on_exit = false,
					auto_scroll = true,
					hidden = false,
				}):open()
			end, vim.tbl_extend("force", o, { desc = "Rust: Check" }))

			map("n", "<leader>op", function()
				overseer.run_template({ name = "Python: ファイルを実行" }, function(task)
					if task then
						overseer.open({ enter = false, direction = "right" })
					end
				end)
			end, vim.tbl_extend("force", o, { desc = "Python: ファイルを実行" }))
		end,
	},
}
