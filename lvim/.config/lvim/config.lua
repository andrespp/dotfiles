-- Read the docs: https://www.lunarvim.org/docs/configuration
-- Video Tutorials: https://www.youtube.com/watch?v=sFA9kX-Ud_c&list=PLhoH5vyxr6QqGu0i7tt_XoVK9v-KvZ3m6
-- Forum: https://www.reddit.com/r/lunarvim/
-- Discord: https://discord.com/invite/Xb9B4Ny
-- install plugins
--
require 'nvim-treesitter.configs'.setup {
ignore_install = { "yaml" },
}

lvim.plugins = {
  {
    -- "ikatyang/tree-sitter-yaml", -- yaml syntax highlighting workaround
    "linux-cultist/venv-selector.nvim",
    dependencies = {
      "neovim/nvim-lspconfig",
      { "nvim-telescope/telescope.nvim", branch = "0.1.x", dependencies = { "nvim-lua/plenary.nvim" } },
    },
    opts = {
      -- Your options go here
      name = { "venv", ".venv" },
      -- auto_refresh = false
    },
    lazy = false,
    branch = "regexp", -- This is the regexp branch, use this for the new version
    config = function()
      require("venv-selector").setup()
    end,
    keys = {
      { ",v", "<cmd>VenvSelect<cr>" },
      { '<leader>sv', '<cmd>VenvSelect<cr>' },
    },
  },
	{ "mzlogin/vim-markdown-toc" },
  { "github/copilot.vim" },
  {
    "christoomey/vim-tmux-navigator",
    cmd = {
      "TmuxNavigateLeft",
      "TmuxNavigateDown",
      "TmuxNavigateUp",
      "TmuxNavigateRight",
      "TmuxNavigatePrevious",
    },
    keys = {
      { "<c-h>", "<cmd><C-U>TmuxNavigateLeft<cr>" },
      { "<c-j>", "<cmd><C-U>TmuxNavigateDown<cr>" },
      { "<c-k>", "<cmd><C-U>TmuxNavigateUp<cr>" },
      { "<c-l>", "<cmd><C-U>TmuxNavigateRight<cr>" },
      { "<c-\\>", "<cmd><C-U>TmuxNavigatePrevious<cr>" },
    },
  },
  {
    "preservim/vimux",
  },
  {
    "vim-test/vim-test",
    vim.keymap.set('n', '<Space>t', ':TestNearest<CR>'),
    vim.keymap.set('n', '<Space>T', ':TestFile<CR>'),
    vim.cmd("let test#strategy = 'vimux'"),
    -- vim.cmd("let test#strategy = 'neovim_sticky'"),
  },
  -- debug plugins
  -- "mfussenegger/nvim-dap",
  "mfussenegger/nvim-dap-python",
  "nvim-neotest/neotest",
  "nvim-neotest/neotest-python",

  {'kevinhwang91/nvim-ufo', dependencies = {'kevinhwang91/promise-async'}}
}

-- nvim-ufo
require "nvim-ufo"

-- General Settings
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
  { name = "ruff" },
  -- { command = "black", args =  "--single-quote" },
}
lvim.format_on_save.enabled = false
lvim.format_on_save.pattern = { "*.py" }

-- setup linting
local linters = require "lvim.lsp.null-ls.linters"
linters.setup {
  { command = "ruff", filetypes = { "python" } },
  {
    command = "sqlfluff",
    args = { "--dialect", "postgres" },
    filetypes = { "sql" }
  },
}

-- tab space
vim.api.nvim_create_autocmd("BufEnter", {
  pattern = { "*.sql" },
  command = "setlocal tabstop=4 shiftwidth=4"
})


-- setup debug adapter
lvim.builtin.dap.active = true
local mason_path = vim.fn.glob(vim.fn.stdpath "data" .. "/mason/")
pcall(function()
  require("dap-python").setup(mason_path .. "packages/debugpy/venv/bin/python")
end)
