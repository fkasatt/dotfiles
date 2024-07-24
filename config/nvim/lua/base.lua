local o = vim.opt


-- display
o.number = true
o.ambiwidth = 'single'
o.termguicolors = true
o.cmdheight = 1
o.winblend = 5
o.pumblend = 5
o.wildoptions = 'pum'
o.laststatus = 3
-- vim.cmd ('set completeopt-=preview')
o.hidden = true
vim.cmd("autocmd BufEnter * normal! zz")


-- input
o.expandtab = true
o.tabstop = 2
o.softtabstop = 2
o.shiftwidth = 2
o.showmatch = true
o.matchtime = 1
o.autoindent = true
o.smartindent = true


-- search
o.ignorecase = true
o.smartcase = true
o.wrapscan = true
o.path:append { '**' }
o.wildignore:append { '*/node_modules/*', '*/.git/*' }


-- file
o.fileformats = 'unix'
o.encoding = 'utf-8'
o.fileencodings = 'utf-8'
vim.scriptencoding = 'utf-8'
o.swapfile = false
vim.api.nvim_create_autocmd({ 'BufReadPost' }, {
  pattern = { '*' },
  callback = function()
    vim.cmd('silent! normal! g`"zv')
  end,
})


-- copy
o.clipboard:append{'unnamedplus'}
vim.cmd([[set mouse=]])


-- 行番号の色変更

local gitsigns_augroup = vim.api.nvim_create_augroup('GitsignsOverride', {clear = true})
vim.api.nvim_create_autocmd('ColorScheme', {
  group = gitsigns_augroup,
  callback = function()
    vim.api.nvim_set_hl(0, 'GitSignsAddNr', {fg = '#6fa6ae', bg = 'NONE'})
    vim.api.nvim_set_hl(0, 'GitSignsChangeNr', {fg = '#ffc777', bg = 'NONE'})
    vim.api.nvim_set_hl(0, 'GitSignsDeleteNr', {fg = '#c53b53', bg = 'NONE'})
  end,
})
