-- Mapping data with "desc" stored directly by vim.keymap.set().
--
-- Please use this mappings table to set keyboard mapping since this is the
-- lower level configuration and more robust one. (which-key will
-- automatically pick-up stored data by this setting.)
return {
  -- first key is the mode
  n = {
    -- second key is the lefthand side of the map

    -- navigate buffer tabs with `H` and `L`
    -- L = {
    --   function() require("astronvim.utils.buffer").nav(vim.v.count > 0 and vim.v.count or 1) end,
    --   desc = "Next buffer",
    -- },
    -- H = {
    --   function() require("astronvim.utils.buffer").nav(-(vim.v.count > 0 and vim.v.count or 1)) end,
    --   desc = "Previous buffer",
    -- },

    -- mappings seen under group name "Buffer"
    ["<leader>bD"] = {
      function()
        require("astronvim.utils.status").heirline.buffer_picker(
          function(bufnr) require("astronvim.utils.buffer").close(bufnr) end
        )
      end,
      desc = "Pick to close",
    },
    -- tables with the `name` key will be registered with which-key if it's installed
    -- this is useful for naming menus
    ["<leader>b"] = { name = "Buffers" },
    -- quick save
    -- ["<C-s>"] = { ":w!<cr>", desc = "Save File" },  -- change description but the same command
    ["<Tab>"] = { "<cmd>bnext<cr>" },
    ["<S-Tab>"] = { "<cmd>bprev<cr>" },

    ["<leader>gd"] = {
      function()
        if next(require("diffview.lib").views) == nil then
          vim.cmd "DiffviewOpen"
        else
          vim.cmd "DiffviewClose"
        end
      end,
      desc = "Git Diff",
    },

    ["<leader>gg"] = { "<cmd>G<cr>", desc = "Fugitive" },

    ["<leader>?"] = {
      "<cmd>ChatGPT<cr>",
      desc = "ChatGPT",
    },

    ["<leader>lp"] = {
      "<cmd>lua vim.lsp.buf.hover()<cr>",
    },
    ["gp"] = {
      "<cmd>lua vim.lsp.buf.hover()<cr>",
    },

    ["]c"] = {
      "<cmd>Gitsigns next_hunk<cr>",
      desc = "Next git hunk",
    },

    ["[c"] = {
      "<cmd>Gitsigns prev_hunk<cr>",
      desc = "Previous git hunk",
    },

    ["<leader>ojj"] = {
      "<cmd>Neorg journal today<cr>",
    },
    ["<leader>ojn"] = {
      "<cmd>Neorg journal tomorrow<cr>",
    },
    ["<leader>ojt"] = {
      "<cmd>Neorg journal toc open<cr>",
    },
    ["<leader>oo"] = {
      "<cmd>Neorg index<cr>",
    },
    ["<leader>or"] = {
      "<cmd>Neorg return<cr>",
    },
    ["<leader>o"] = false,
    ["<leader>h"] = false,
    ["n"] = {
      "nzz",
    },
    ["<C-U>"] = {
      "<C-U>zz",
    },
    ["<C-D>"] = {
      "<C-D>zz",
    },
  },
  t = {
    -- setting a mapping to false will disable it
    -- ["<esc>"] = false,
  },
  v = {
    ["<leader>gh"] = { ":Gitsigns reset_hunk<cr>" },
  },
}
