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



vim.api.nvim_set_hl(0, 'Typst1', {fg = '#eb0c50'})
vim.api.nvim_set_hl(0, 'Typst2', {fg = '#c94f6d'})

local function HighlightDots()
	local bufnr = vim.api.nvim_get_current_buf()
	local lines = vim.api.nvim_buf_get_lines(bufnr, 0, -1, false)
	for i, line in ipairs(lines) do
		for s, e in line:gmatch('()' .. '。' .. '()') do
			vim.api.nvim_buf_add_highlight(bufnr, -1, 'Typst1', i - 1, s - 1, e - 1)
		end
		for s, e in line:gmatch('()' .. '、' .. '()') do
			vim.api.nvim_buf_add_highlight(bufnr, -1, 'Typst2', i - 1, s - 1, e - 1)
		end
	end
end
vim.api.nvim_create_user_command('Chd', HighlightDots, {})
