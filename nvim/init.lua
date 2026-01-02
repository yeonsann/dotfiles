require("config.lazy")

-- ====================================
--         config
-- ====================================
vim.g.mapleader = " "
vim.opt.number = true
vim.opt.relativenumber = true
vim.opt.completeopt = menu, menuone, noselect
vim.opt.clipboard = unamed, unnamedplus

vim.opt.tabstop = 4
vim.opt.softtabstop = 4
vim.opt.shiftwidth = 4
vim.opt.expandtab = true
vim.opt.smartindent = true
vim.opt.wrap = false
vim.opt.swapfile = false
vim.opt.textwidth = 100

-- show line at column 80
vim.opt.colorcolumn = "100"

vim.g.sonokai_enable_italic = 1
vim.g.sonokai_better_performance = 1
vim.cmd.colorscheme("sonokai")

-- ====================================
--         plugin config
-- ====================================
--
require("mason-lspconfig").setup {
    ensure_installed = { "lua_ls", "ts_ls", "ruff", "zls", "cssls", "clangd" },
    ensure_enabled = { "lua_ls", "ts_ls", "ruff", "zls", "cssls", "clangd" },
}

local conform = require("conform")

local telescope_buildin = require('telescope.builtin')

require("flutter-tools").setup {}

-- ====================================
--               keymaps
-- ====================================

-- VIM
vim.keymap.set('n', "gd", vim.lsp.buf.definition)
vim.keymap.set("n", "K", vim.lsp.buf.hover, { desc = "Show hover info" })
vim.keymap.set('n', '<leader>e', vim.diagnostic.open_float, { desc = "Show diagnostic" })

-- vim.keymap.set('n', "", vim.lsp.buf.code_action, { noremap = true })

-- Telescope
vim.keymap.set('n', '<leader>gj', telescope_buildin.git_files, { desc = 'Telescope find files' })
vim.keymap.set('n', '<leader>jj', telescope_buildin.find_files, { desc = 'Telescope find files' })
vim.keymap.set('n', '<leader>ff', telescope_buildin.live_grep, { desc = 'Telescope live grep' })
-- NeoTree
-- vim.keymap.set('n', '<leader>uu', ':Neotree toggle reveal<CR>', { noremap = true, silent = true })
vim.keymap.set('n', '<leader>uu', ':Neotree toggle<CR>', { noremap = true, silent = true })
-- vim.keymap.set('n', '<C-i>', ':Neotree focus<CR>', { noremap = true, silent = true })

vim.keymap.set({ 'n', 'v' }, "ff", function()
    conform.format({ async = true, lsp_fallback = true })
end, { desc = "Format file or range" })

vim.keymap.set({ "n", "x" }, "<C-k>", function()
    require("tiny-code-action").code_action()
end, { noremap = true, silent = true })
