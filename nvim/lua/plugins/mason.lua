-- if true then return {} end -- WARN: REMOVE THIS LINE TO ACTIVATE THIS FILE

-- Customize Mason plugins

---@type LazySpec
return {
	-- use mason-lspconfig to configure LSP installations
	{
		"williamboman/mason-lspconfig.nvim",
		-- overrides `require("mason-lspconfig").setup(...)`
		opts = {
			ensure_installed = {
				"lua_ls",  -- Existing entry
				"pyright", -- Python
				"ts_ls",   -- TypeScript and JavaScript
				"eslint",  -- ESLint for JavaScript/TypeScript linting
				"jsonls",  -- JSON files
				"html",    -- HTML files
				"cssls",   -- CSS files
				"tailwindcss", -- Tailwind CSS files
				"marksman",
				"clangd",
			},
		},
	},
	-- use mason-null-ls to configure Formatters/Linter installation for null-ls sources
	{
		"jay-babu/mason-null-ls.nvim",
		-- overrides `require("mason-null-ls").setup(...)`
		opts = {
			ensure_installed = {
				"stylua", -- Existing entry for Lua formatter
				"prettier", -- Prettier for formatting JavaScript, TypeScript, etc.
				"eslint_d", -- ESLint for linting JavaScript, TypeScript, etc.
				"black", -- Black for Python formatting
				"flake8", -- Flake8 for Python linting
			},
		},
	},
	{
		"jay-babu/mason-nvim-dap.nvim",
		-- overrides `require("mason-nvim-dap").setup(...)`
		opts = {
			ensure_installed = {
				-- "python",         -- Existing entry for Python debugger
				-- "node2",          -- Node.js debugger for JavaScript/TypeScript
				-- "chrome",         -- Chrome debugger for JavaScript/TypeScript
			},
		},
	},
}
