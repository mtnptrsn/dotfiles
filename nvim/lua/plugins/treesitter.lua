-- if true then return {} end -- WARN: REMOVE THIS LINE TO ACTIVATE THIS FILE

-- Customize Treesitter

---@type LazySpec
return {
  "nvim-treesitter/nvim-treesitter",
  opts = {
    ensure_installed = {
      "lua",
      "vim",
      "python",
      "typescript",
      "tsx",
      "javascript",
      "html",
      "css",
      "json",
      "yaml",
      "markdown",
      "bash",
      "c",
      "cpp",
      "java",
      "go",
      "rust",
    },
  },
}
