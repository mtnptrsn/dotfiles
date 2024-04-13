---@type LazySpec
return {
	"sindrets/diffview.nvim",
	dependencies = {
		"nvim-lua/plenary.nvim",
	},
	cmd = "DiffviewOpen",
	opts = {
		enhanced_diff_hl = false,
		file_panel = {
			listing_style = "list",
		},
	},
	setup = function()
		require("diffview").setup()

		-- set <leader>gd to toggle DiffViewOpen
		vim.api.nvim_set_keymap("n", "<leader>gd", "<cmd>DiffviewOpen<CR>", { noremap = true, silent = true })
	end,
}
