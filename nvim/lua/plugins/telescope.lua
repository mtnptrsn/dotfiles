-- if true then return {} end -- WARN: REMOVE THIS LINE TO ACTIVATE THIS FILE

return {
  "nvim-telescope/telescope.nvim",
  opts = function(_, opts)
    -- Import necessary actions
    local actions = require "telescope.actions"

    -- Update the default mappings to accommodate tab and shift+tab navigation
    opts.defaults.mappings.i = {
      -- Insert mode mappings for navigation
      ["<Tab>"] = actions.move_selection_next, -- Move to the next item
      ["<S-Tab>"] = actions.move_selection_previous, -- Move to the previous item
    }

    opts.pickers = {
      live_grep = {
        additional_args = function() return { "--hidden" } end,
        glob_pattern = "!.git",
      },
      find_files = {
        find_command = { "rg", "--files", "--hidden", "--glob", "!.git" },
      },
    }
  end,
  dependencies = {
    {
      "nvim-telescope/telescope-fzf-native.nvim",
      build = "make",
      config = function() require("telescope").load_extension "fzf" end,
    },
  },
}
