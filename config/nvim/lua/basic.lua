local o = vim.opt
-- display
o.number = true
o.ambiwidth = 'single'
o.winblend = 0
o.pumblend = 0
o.termguicolors = true
o.cmdheight = 1
-- vim.cmd ('set completeopt-=preview')
vim.o.hidden = true

-- input
-- tab
o.expandtab = trueiniini
o.tabstop = 4
o.softtabstop = 4
o.shiftwidth = 4
-- ()
o.showmatch = true
o.matchtime = 1
-- indents
o.autoindent = true
o.smartindent = true

-- search
o.ignorecase = true
o.smartcase = true
o.wrapscan = true

-- file
o.fileformats = 'unix'
o.encoding = 'utf-8'
o.fileencodings = {'utf-8', 'sjis', 'euc-jp', 'cp932', 'iso-2022-jp'}
vim.scriptencoding = 'utf-8'
o.swapfile = false
vim.api.nvim_create_autocmd({ 'BufReadPost' }, {
    pattern = { '*' },
    callback = function()
        vim.api.nvim_exec('silent! normal! g`"zv', false)
    end,
})

-- copy
o.clipboard:append{'unnamedplus'}
-- o.mouse = 'a'
vim.cmd([[set mouse=]])

vim.cmd("autocmd BufEnter * normal! zz")
