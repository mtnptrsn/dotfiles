return {
  "nvim-telescope/telescope.nvim",
  opts = function(_, opts)
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
    {
      "jvgrootveld/telescope-zoxide",
      config = function() require("telescope").load_extension "zoxide" end,
    },
    -- For trouble.providers.telescope
    "folke/trouble.nvim",
  },
  keys = {
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
