return {
  "axkirillov/easypick.nvim",
  keys = {
    { "<leader>fg", "<cmd>Easypick changed_files<cr>", desc = "Git Changed Files" },
  },
  config = function()
    local easypick = require "easypick"
    easypick.setup {
      pickers = {
        -- all uncommited files
        {
          name = "changed_files",
          command = 'git status --porcelain | awk \'{if ($1 == "M" || $1 == "A" || $1 == "??") print $2}\'',
          previewer = easypick.previewers.default(),
        },
      },
    }
  end,
}
