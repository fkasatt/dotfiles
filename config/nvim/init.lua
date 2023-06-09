local o = vim.opt
local set = vim.keymap.set

-- display
o.number = true
o.ambiwidth = 'single'
o.winblend = 0
o.pumblend = 0
o.termguicolors = true
o.cmdheight = 1
vim.cmd ('set completeopt-=preview')
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

-- fcitx
vim.cmd [[
if executable('fcitx5')
    let g:fcitx_state = 1
        augroup fcitx_savestate
        autocmd!
        autocmd InsertLeave * let g:fcitx_state = str2nr(system('fcitx5-remote'))
        autocmd InsertLeave * call system('fcitx5-remote -c')
        autocmd InsertEnter * call system(g:fcitx_state == 1 ? 'fcitx5-remote -c': 'fcitx5-remote -o')
        augroup END
endif
]]

-- search
o.ignorecase = true
o.smartcase = true
o.wrapscan = true

-- file
o.fileformats = 'unix'
o.encoding = 'utf-8'
o.fileencodings = {'utf-8', 'iso-2022-jp', 'cp932', 'euc-jp', 'sjis'}
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
o.mouse = 'a'

-- keymap
vim.g.mapleader = ' '
set('n', '<Esc><Esc>', ':nohl<CR>', { noremap = true, silent = true})
set('n', 'ew', ':<C-u>w<CR>')
set('n', 'eq', ':<C-u>wq<CR>')
set('n', 'Q', ':<C-u>qa!<CR>')
set('n', 'B', '/^$<CR>:nohl<CR>')
set('n', '<C-s>', ':<C-u>%s///g<Left><Left><Left>')
set('n', '<C-c>', ":<C-u>echo wordcount()['chars']<CR>")
set('n', ']p', ':bprev<CR>', {silent = true})
set('n', ']n', ':bnext<CR>', {silent = true})
set('c', '<CR>', '<Plug>(kensaku-search-replace)<CR>')
set('n', 'S', '<cmd>FuzzyMotion<CR>')
set('n', '<A-k>', '<cmd>wincmd k<CR>')
set('n', '<A-j>', '<cmd>wincmd j<CR>')
set('n', '<A-h>', '<cmd>wincmd h<CR>')
set('n', '<A-l>', '<cmd>wincmd l<CR>')
set('n', '<leader>h', '<cmd>BufferPrevious<CR>')
set('n', '<leader>l', '<cmd>BufferNext<CR>')
set('n', '<leader>H', '<C-W>h<CR>')
set('n', '<leader>L', '<C-W>l<CR>')
set('n', '<leader>P', '<cmd>BufferMovePrevious<CR>')
set('n', '<leader>N', '<cmd>BufferMoveNext<CR>')
set('n', '<leader>p', '<cmd>BufferPin<CR>')
set('n', '<leader>j', '<cmd>BufferPick<CR>')
set('n', '<leader>q', ':<C-u>bd<CR>')
-- keymap-telescope
set('n', '<leader>.', '<cmd>Telescope find_files hidden=true<CR>')
set('n', '<leader>,', '<cmd>Telescope oldfiles<CR>')
set('n', '<leader>s', '<cmd>Telescope live_grep grep_open_files=true<CR>')
set('n', '<leader>k', '<cmd>Telescope live_grep<CR>')
set('n', '<leader>b', '<cmd>Telescope buffers<CR>')
set('n', '<leader>v', '<cmd>Telescope help_tags<CR>')
set('n', '<leader>y', '<cmd>Telescope registers<CR>')
set('n', 'gd', '<cmd>Telescope lsp_definitions<CR>')
set('n', 'gr', '<cmd>Telescope lsp_references<CR>')
set('n', 'gi', '<cmd>Telescope lsp_implementations<CR>')
set('n', 'gx', '<cmd>Telescope diagnostics<CR>') 
set('n', '<leader>f', '<cmd>Telescope file_browser hidden=true<CR>')
set('n', '<leader>m', '<cmd>Telescope memo list<CR>')
set('n', '<leader>n', '<cmd>Telescope memo live_grep<CR>')
set('n', 'zl', ':vertical resize +10<CR>')
set('n', 'zh', ':vertical resize -10<CR>')
-- keymap-hlslens
set('n', 'n', [[<Cmd>execute('normal! ' . v:count1 . 'n')<CR><Cmd>lua require('hlslens').start()<CR>]], kopts)
set('n', 'N', [[<Cmd>execute('normal! ' . v:count1 . 'N')<CR><Cmd>lua require('hlslens').start()<CR>]], kopts)
set('n', '*', [[*<cmd>lua require('hlslens').start()<CR>]], kopts)
set('n', '#', [[#<cmd>lua require('hlslens').start()<CR>]], kopts)
set('n', 'g*', [[g*<cmd>lua require('hlslens').start()<CR>]], kopts)
set('n', 'g#', [[g#<cmd>lua require('hlslens').start()<CR>]], kopts)

-- plugins
-- lazy.nvim
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
	vim.fn.system({
		"git",
		"clone",
		"--filter=blob:none",
		"https://github.com/folke/lazy.nvim.git",
		"--branch=stable", -- latest stable release
		lazypath,
	})
end
o.rtp:prepend(lazypath)
plugins = require('plugins')
require("lazy").setup(plugins, opts)

-- nvim-hlslens
require('hlslens').setup()
local kopts = {noremap = true, silent = true}


-- lsp
--local on_attach = function(client, bufnr)
--    client.server_capabilities.documentFormattingProvider = fals 
--    set('n', 'K', '<cmd>lua vim.lsp.buf.hover()<CR>')
--    set('n', 'lc', '<cmd>lua vim.lsp.buf.signature_help()<CR>')
--    set('n', 'ln', '<cmd>lua vim.lsp.buf.rename()<CR>')
--    set('n', 'lu', '<cmd>lua vim.lsp.buf.code_action()<CR>')
--    set('n', 'l[', '<cmd>lua vim.lsp.diagnostic.goto_prev()<CR>')
--    set('n', 'l]', '<cmd>lua vim.lsp.diagnostic.goto_next()<CR>')
--    set('n', 'lf', '<cmd>lua vim.lsp.buf.format {async = true}<CR>')
--end
--vim.lsp.handlers['textDocument/publishDiagnostics'] = vim.lsp.with(
--vim.lsp.diagnostic.on_publish_diagnostics, { virtual_text = false })
--require('mason').setup()
--require('mason-lspconfig').setup()
--require('mason-lspconfig').setup_handlers {
--    function(server_name)
--        require('lspconfig')[server_name].setup {
--            on_attach = on_attach,
--            capabilities = capabilities,
--        }
--    end
--}
--
---- nvim-cmp
--local cmp = require('cmp')
--local lspkind = require('lspkind')
--
-- cmp.setup({
--    snippet = {
--        expand = function(args)
--            vim.fn['vsnip#anonymous'](args.body)
--        end
--    },
--
--    window = {
--        completion = cmp.config.window.bordered({
--            border = 'single'
--        }),
--        documentation = cmp.config.window.bordered({
--            border = 'single'
--        }),
--    },
--
--    mapping = cmp.mapping.preset.insert({
--        ['<S-Tab>'] = cmp.mapping.select_next_item(),
--        ['<A-Tab>'] = cmp.mapping.select_prev_item(),
--        ['q'] = cmp.mapping.abort(),
--        ['<CR>'] = cmp.mapping.confirm({ select = true }),
--    }),
--    
--    formatting = {
--        format = lspkind.cmp_format({
--            mode = 'symbol',
--            maxwidth = 50,
--            ellipsis_char = '...',
--        })
--    },
--
--    sources = cmp.config.sources({
--        { name = 'nvim_lsp' },
--        { name = 'vsnip' },
--        { name = 'nvim_lsp_signature_help' },
--        { name = 'calc' },
--    },{
--        { name = 'buffer', keyword_length = 2 },
--    })
--})
--
-- cmp.setup.cmdline({ '/', '?' },{
--        mapping = cmp.mapping.preset.cmdline(),
--        sources = cmp.config.sources({
--            { name = 'nvim_lsp_document_symbol' }
--    },{
--        { name = 'buffer' }
--    })
-- })
--
-- cmp.setup.cmdline(':', {
-- mapping = cmp.mapping.preset.cmdline(),
-- sources = cmp.config.sources({
--        { name = 'path' }
--    }, {
--        { name = 'cmdline', keyword_length = 2 }
--    })
-- })
--
--local capabilities = require('cmp_nvim_lsp').default_capabilities()
--vim.cmd('let g:vsnip_filetypes = {}')

-- telescope
require('telescope').setup({
    defaults = {
        color_devicons = true,
        file_ignore_patterns = { 'node_modules', '.git', '.svg', '.npm', 'go', 'MEGA'},
        winblend = 4,
        layout_strategy = 'vertical',
        layout_config = { height = 0.9 },
        mappings = {
            i = {
                ['<Esc>'] = require('telescope.actions').close
            }
        }
    }
})
    
    
local fb_actions = require 'telescope'.extensions.file_browser.actions
local previewers = require('telescope.previewers')
local Job = require('plenary.job')
local new_maker = function(filepath, bufnr, opts)
    filepath = vim.fn.expand(filepath)
    Job:new({
        command = 'file',
        args = { '--mime-type', '-b', filepath },
        on_exit = function(j)
            local mime_type = vim.split(j:result()[1], '/')[1]
            if mime_type == 'text' then
                previewers.buffer_previewer_maker(filepath, bufnr, opts)
            else
                vim.schedule(function()
                    vim.api.nvim_buf_set_lines(bufnr, 0, -1, false, { 'BINARY' })
                end)
            end
        end
    }):sync()
end

-- memo
function tips()
    vim.cmd('edit $HOME/.config/nvim/tips.md')
end
set('n', 'tips', ':lua tips()<CR>')

-- terminal
set('n', 'tx', '<cmd>belowright 10 new<CR><cmd>terminal<CR>')
set('n', 'txl', '<cmd>belowright 25 new<CR><cmd>terminal<CR>')
set('t', '<ESC>', '<C-\\><C-n><CR>')
vim.cmd([[
autocmd TermOpen * startinsert
autocmd TermOpen * setlocal norelativenumber
autocmd TermOpen * setlocal nonumber
]])

-- treesitter
local status, treesitter = pcall(require, "nvim-treesitter.configs")
if (not status) then return end

treesitter.setup {
	ensure_installed = {"vim","c","cpp","typescript","javascript","json","lua","gitignore","bash","markdown","css","scss","yaml","toml","rust","php","html","go","python"},
	highlight = {
		enable = true,
		additional_vim_regex_highlighting = false,
		disable = {}
	},
	indent ={
		enable =true,
		disable ={"html"}
	},
	autotag = {
		enable = true
	}
}
