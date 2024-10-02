return {
	"shortcuts/no-neck-pain.nvim",
	config = function()
		vim.api.nvim_set_keymap("n", "<leader>un", ":NoNeckPain<CR>", { noremap = true, silent = true })
	end,
}
