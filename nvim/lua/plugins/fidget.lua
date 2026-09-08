return {
    "j-hui/fidget.nvim",
    opts = {
      progress = {
        display = {
          done_icon = "✔",
          progress_style = "WarningMsg",
        },
      },
      notification = {
        override_vim_notify = true,
        window = {
          border = "rounded",
          winblend = 0,
          x_padding = 1,
        },
      },
    },
  }
