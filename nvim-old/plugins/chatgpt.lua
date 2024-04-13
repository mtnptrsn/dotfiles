local map = vim.keymap.set
return {
  "jackMort/ChatGPT.nvim",
  event = "VeryLazy",
  config = function()
    require("chatgpt").setup {
      openai_params = {
        model = "gpt-4-1106-preview",
        frequency_penalty = 0,
        presence_penalty = 0,
        max_tokens = 2000,
        temperature = 0,
        top_p = 1,
        n = 1,
      },
    }

    map("n", "<leader>??", "<cmd>ChatGPT<cr>", { noremap = true, silent = true })
    map("n", "<leader>?g", "<cmd>ChatGPTRun grammar_correction<cr>", { noremap = true, silent = true })

    map("v", "<leader>?e", "<cmd>ChatGPTRun explain_code<cr>", { noremap = true, silent = true })
    map("v", "<leader>?g", "<cmd>ChatGPTRun grammar_correction<cr>", { noremap = true, silent = true })
    map("v", "<leader>?i", "<cmd>ChatGPTEditWithInstructions<cr>", { noremap = true, silent = true })
  end,
  dependencies = {
    "MunifTanjim/nui.nvim",
    "nvim-lua/plenary.nvim",
    "nvim-telescope/telescope.nvim",
  },
}
