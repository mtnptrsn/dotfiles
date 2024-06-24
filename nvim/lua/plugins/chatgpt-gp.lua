return {
	"robitx/gp.nvim",
	opts = function()
		return {
			agents = {
				{
					name = "ChatGPT4",
					chat = true,
					command = true,
					model = "gpt-4o",
					system_prompt = "You are a general AI assistant.\n\n"
						.. "The user provided the additional info about how they would like you to respond:\n\n"
						.. "- If you're unsure don't guess and say you don't know instead.\n"
						.. "- Ask question if you need clarification to provide better answer.\n"
						.. "- Think deeply and carefully from first principles step by step.\n"
						.. "- If the answer does not need to be lengthy, keep it short.\n"
						.. "- Don't elide any code from your output if the answer requires coding.\n",
				},
			},
		}
	end,
	config = function(_, opts)
		local gp = require("gp")
		gp.setup(opts)
		gp._state.chat_agent = "ChatGPT4"
	end,
	keys = {
		{
			"<leader>?",
			"<Cmd>GpChatNew<CR>",
			mode = { "n" },
			desc = "New Chat",
		},
		{
			"<leader>?",
			":'<,'>GpChatNew<CR>",
			mode = { "v" },
			desc = "New Chat",
		},
		{
			"<C-g>c",
			"<Cmd>GpChatNew<CR>",
			mode = { "n" },
			desc = "New Chat",
		},
		{
			"<C-g>c",
			":'<,'>GpChatNew<CR>",
			mode = { "v" },
			desc = "New Chat",
		},
	},
}
