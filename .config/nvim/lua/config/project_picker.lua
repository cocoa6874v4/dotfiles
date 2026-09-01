local M = {}

local PROJECT_ROOT = "C:/Users/user/src"

function M.open_projects()
  local pickers = require("telescope.pickers")
  local finders = require("telescope.finders")
  local conf = require("telescope.config").values
  local actions = require("telescope.actions")
  local action_state = require("telescope.actions.state")

  local dirs = vim
    .iter(vim.fn.globpath(PROJECT_ROOT, "*", false, true))
    :filter(function(path)
      return vim.fn.isdirectory(path) == 1
    end)
    :totable()

  pickers
    .new({}, {
      prompt_title = "Projects",
      finder = finders.new_table({
        results = dirs,
        entry_maker = function(path)
          return {
            value = path,
            display = vim.fn.fnamemodify(path, ":t"),
            ordinal = path,
          }
        end,
      }),
      sorter = conf.generic_sorter({}),
      attach_mappings = function(prompt_bufnr)
        actions.select_default:replace(function()
          local entry = action_state.get_selected_entry()
          actions.close(prompt_bufnr)

          vim.cmd("cd " .. vim.fn.fnameescape(entry.value))
          vim.notify("cd: " .. entry.value)
        end)

        return true
      end,
    })
    :find()
end

return M