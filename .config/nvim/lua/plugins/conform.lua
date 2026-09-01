-- lua/plugins/format.lua
return {
  "stevearc/conform.nvim",
  event = { "BufWritePre" },
  opts = {
    format_on_save = {
      timeout_ms = 2000,
      lsp_fallback = true,
    },
    formatters_by_ft = {
      python = { "ruff_format", "ruff_fix" },
      cpp = { "clang_format" },
      c = { "clang_format" },
    },
    formatters = {
      clang_format = {
        prepend_args = {
          "--style={BasedOnStyle: LLVM, IndentWidth: 4, ColumnLimit: 100, BreakBeforeBraces: Attach, SpaceBeforeParens: ControlStatements, PointerAlignment: Left, AllowShortFunctionsOnASingleLine: None}",
        },
      },
    },
  },
}