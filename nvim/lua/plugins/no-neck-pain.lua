return {
	"shortcuts/no-neck-pain.nvim",
	config = function()
		-- Create a key mapping to toggle No Neck Pain mode
		vim.api.nvim_set_keymap("n", "<leader>un", ":NoNeckPain<CR>", { noremap = true, silent = true })

		-- Enable No Neck Pain mode automatically when Neovim starts
		vim.api.nvim_create_autocmd("VimEnter", {
			callback = function()
				vim.cmd("NoNeckPain")
			end,
		})
	end,
}
