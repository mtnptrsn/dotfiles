return {
  "nvim-telescope/telescope.nvim",
  -- install fzf native
  dependencies = {
    {
      "nvim-telescope/telescope-fzf-native.nvim",
      build = "make",
      config = function() require("telescope").load_extension "fzf" end,
    },
    {
      "jvgrootveld/telescope-zoxide",
      config = function() require("telescope").load_extension "zoxide" end,
    },
    -- For trouble.providers.telescope
    "folke/trouble.nvim",
  },
  keys = {
    -- add a keymap to browse plugin files
    {
      "<leader>fp",
      function() require("telescope.builtin").find_files { cwd = require("lazy.core.config").options.root } end,
      desc = "Find Plugin File",
    },
    -- This is using b because it used to be fzf's :Buffers
    {
      "<leader>r",
      "<cmd>Telescope oldfiles<cr>",
      desc = "Recent",
    },
    {
      "<leader>z",
      function() require("telescope").extensions.zoxide.list {} end,
      desc = "Zoxide",
    },
  },
}
