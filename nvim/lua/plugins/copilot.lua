return {
  "zbirenbaum/copilot.lua",
  cmd = "Copilot",
  event = "InsertEnter",
  opts = {
    suggestion = {
      enabled = true,
      auto_trigger = true,
      keymap = {
        accept = "<C-A>",
      },
    },
    panel = {
      enabled = false,
    },
  },
  cond = function() return vim.env.COPILOT_ENABLED == "1" end,
}
