local harpoon_keys = {
  { "<leader>hm", "<cmd>lua require('harpoon.mark').add_file()<cr>", desc = "Mark file with harpoon" },
  { "<leader>hn", "<cmd>lua require('harpoon.ui').nav_next()<cr>", desc = "Go to next harpoon mark" },
  { "<leader>hp", "<cmd>lua require('harpoon.ui').nav_prev()<cr>", desc = "Go to previous harpoon mark" },
  { "<leader>ha", "<cmd>lua require('harpoon.ui').toggle_quick_menu()<cr>", desc = "Show harpoon marks" },
}
-- Add the numbered harpoon navigation keys using a loop
for i = 1, 5 do
  table.insert(harpoon_keys, {
    "<leader>h" .. i,
    "<cmd>lua require('harpoon.ui').nav_file(" .. i .. ")<cr>",
    desc = "Navigate to harpoon mark " .. i,
  })
end
return {
  "ThePrimeagen/harpoon",
  lazy = false,
  dependencies = {
    "nvim-lua/plenary.nvim",
  },
  config = true,
  keys = harpoon_keys,
}
