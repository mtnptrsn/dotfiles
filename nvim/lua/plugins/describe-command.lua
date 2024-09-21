return {
  "oflisback/describe-command.nvim",
  dependencies = { "nvim-lua/plenary.nvim", "nvim-telescope/telescope.nvim" },
  config = function()
    require("describe-command").setup()
  end,
  lazy = false,
}
