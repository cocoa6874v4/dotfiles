return {
	{
		"Civitasv/cmake-tools.nvim",
		ft = { "c", "cpp", "cmake" },
		dependencies = {
			"nvim-lua/plenary.nvim",
			"stevearc/overseer.nvim",
			"akinsho/toggleterm.nvim",
		},
		opts = function()
			return {
				cmake_command = "cmake",
				ctest_command = "ctest",
				cmake_use_preset = true,
				cmake_regenerate_on_save = false,

				cmake_generate_options = {
					"-G",
					"Ninja",
					"-DCMAKE_EXPORT_COMPILE_COMMANDS=1",
				},

				cmake_build_directory = "build",

				cmake_compile_commands_options = {
					action = "copy",
					target = vim.loop.cwd,
				},

				cmake_executor = {
					name = "overseer",
					opts = {},
					default_opts = {
						overseer = {
							new_task_opts = {},
							on_new_task = function(task)
								require("overseer").open({ enter = false, direction = "right" })
							end,
						},
					},
				},

				cmake_runner = {
					name = "toggleterm",
					opts = {  },
					default_opts = {
						toggleterm = {
							direction = "horizontal",
							close_on_exit = false,
							auto_scroll = true,
							singleton = true,
						},
					},
				},

				cmake_notifications = {
					runner = { enabled = true },
					executor = { enabled = true },
				},

				cmake_virtual_text_support = true,
			}
		end,

		config = function(_, opts)
			require("cmake-tools").setup(opts)

			local map = vim.keymap.set
			local keyopts = { silent = true }

			map("n", "<leader>cg", "<cmd>CMakeGenerate<CR>", keyopts)
			map("n", "<leader>cG", "<cmd>CMakeGenerate!<CR>", keyopts)
			map("n", "<leader>cb", "<cmd>CMakeBuild<CR>", keyopts)
			map("n", "<leader>cB", "<cmd>CMakeBuild!<CR>", keyopts)
			map("n", "<leader>cr", "<cmd>CMakeRun<CR>", keyopts)
			map("n", "<leader>cd", "<cmd>CMakeDebug<CR>", keyopts)
			map("n", "<leader>cc", "<cmd>CMakeClean<CR>", keyopts)
			map("n", "<leader>ct", "<cmd>CMakeRunTest<CR>", keyopts)
			map("n", "<leader>cs", "<cmd>CMakeSelectBuildType<CR>", keyopts)
			map("n", "<leader>cT", "<cmd>CMakeSelectBuildTarget<CR>", keyopts)
			map("n", "<leader>cL", "<cmd>CMakeSelectLaunchTarget<CR>", keyopts)
			map("n", "<leader>ca", "<cmd>CMakeLaunchArgs<CR>", keyopts)
			map("n", "<leader>co", "<cmd>OverseerToggle<CR>", keyopts)
		end,
	},
}
