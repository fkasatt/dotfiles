require("basic")
require("keymaps")

-- plugins
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
	vim.fn.system({"git", "clone", "--filter=blob:none", "https://github.com/folke/lazy.nvim.git", "--branch=stable", lazypath})
end
vim.opt.rtp:prepend(lazypath)
plugins = require("plugins")
require("lazy").setup(plugins, opts)

require("hlslens").setup()
local kopts = { noremap = true, silent = true }

vim.cmd.colorscheme("tokyonight")
-- vim.cmd([[
-- 	highlight LineNr guifg=#b2b4be guibg=none
-- 	highlight Comment cterm=none gui=none guifg=#b2b4be
-- 	highlight Normal ctermbg=none guibg=none
-- 	highlight NonText ctermbg=none guibg=none
-- 	highlight Folded ctermbg=none guibg=none
-- 	highlight EndOfBuffer ctermbg=none guibg=none
-- 	highlight SignColumn ctermbg=none guibg=none
-- ]])
