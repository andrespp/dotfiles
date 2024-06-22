-- Read the docs: https://www.lunarvim.org/docs/configuration
-- Video Tutorials: https://www.youtube.com/watch?v=sFA9kX-Ud_c&list=PLhoH5vyxr6QqGu0i7tt_XoVK9v-KvZ3m6
-- Forum: https://www.reddit.com/r/lunarvim/
-- Discord: https://discord.com/invite/Xb9B4Ny
-- install plugins
lvim.plugins = {
}

lvim.plugins = {
	{ "mzlogin/vim-markdown-toc" },
  { "github/copilot.vim" },
  {
    "christoomey/vim-tmux-navigator",
    cmd = {
      "TmuxNavigateLeft",
      "TmuxNavigateDown",
      "TmuxNavigateUp",
      "TmuxNavigateRight",
      -- "TmuxNavigatePrevious",
    },
    keys = {
      { "<c-h>", "<cmd><C-U>TmuxNavigateLeft<cr>" },
      { "<c-j>", "<cmd><C-U>TmuxNavigateDown<cr>" },
      { "<c-k>", "<cmd><C-U>TmuxNavigateUp<cr>" },
      { "<c-l>", "<cmd><C-U>TmuxNavigateRight<cr>" },
    },
  },
  {
    "vim-test/vim-test",
    vim.keymap.set('n', '<Space>t', ':TestNearest<CR>'),
    vim.keymap.set('n', '<Space>T', ':TestFile<CR>'),
  },
  -- python ide
  {"ChristianChiarulli/swenv.nvim"},
  {"stevearc/dressing.nvim"},
}
vim.opt.colorcolumn = "80" -- highligh column limit
vim.opt.relativenumber = true

-- Highlight when yanking (copying) text
--  Try it with `yap` in normal mode
--  See `:help vim.highlight.on_yank()`
vim.api.nvim_create_autocmd("TextYankPost", {
	desc = "Highlight when yanking (copying) text",
	group = vim.api.nvim_create_augroup("kickstart-highlight-yank", { clear = true }),
	callback = function()
		vim.highlight.on_yank()
	end,
})

-- Set highlight on search, but clear on pressing <Esc> in normal mode
vim.opt.hlsearch = true
vim.keymap.set("n", "<Esc>", "<cmd>nohlsearch<CR>")

-- trim trailing whitespace
vim.g.editorconfig_trim_trailing_whitespace = true

-------------------------------------------------------------------------------
-- Python Settings
-------------------------------------------------------------------------------

-- automatically install python syntax highlighting
lvim.builtin.treesitter.ensure_installed = {
  "python",
}

-- setup formatting (:MasonInstall black)
local formatters = require "lvim.lsp.null-ls.formatters"
formatters.setup {
  { name = "black" },
  -- { command = "black", args =  "--single-quote" },
}
lvim.format_on_save.enabled = false
lvim.format_on_save.pattern = { "*.py" }

-- setup linting
local linters = require "lvim.lsp.null-ls.linters"
linters.setup { { command = "pylint", filetypes = { "python" } } }

-- binding for switching
lvim.builtin.which_key.mappings["C"] = {
  name = "Python",
  c = { "<cmd>lua require('swenv.api').pick_venv()<cr>", "Choose Env" },
}
