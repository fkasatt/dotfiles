return {
    {
        "vim-denops/denops.vim",
        lazy = false,
        priority = 1000,
    	dependencies = {
    		'vim-skk/skkeleton',
    		config = function()
    			vim.fn['skkeleton#config']({
    				globalJisyo="~/.skk/SKK-JISYO.L",
    				eggLikeNewline = true,
    				markerHenkan = "▹",
    				markerHenkanSelect = "▸",
    			})
    			vim.keymap.set("i", "<C-j>", "<Plug>(skkeleton-enable)", {})
    			vim.keymap.set("c", "<C-j>", "<Plug>(skkeleton-enable)", {})
    		end,
--    		dependencies = {
--    			'rinx/cmp-skkeleton',
--    		}
    	}
    },
    {
        "stevearc/dressing.nvim",
        event = 'VeryLazy',
        config = function()
	        require('dressing').setup({
                    input = { border = 'single' },
                    builtin = { border = 'single' }
	        })
	    end
    },
	{
		'glidenote/memolist.vim',
		event = 'VeryLazy',
		config = function()
			vim.g.memolist_path = "~/.memolist/"
			vim.g.memolist_memo_suffix = "md"
			vim.g.memolist_fzf = 1
			vim.g.memolist_template_dir_path = "~/.memolist/base"
		end
	},

    -- search
    { "junegunn/fzf.vim", event = 'VeryLazy' },
    { "lambdalisue/kensaku-search.vim", event = 'VeryLazy' },
    { "lambdalisue/kensaku.vim", event = 'VeryLazy' },
    {
        "yuki-yano/fuzzy-motion.vim",
	event = 'VeryLazy',
        config = function()
            vim.g.fuzzy_motion_matchers = {'kensaku', 'fzf'}
        end
    },
    { 'kevinhwang91/nvim-hlslens', event = 'BufNewFile, BufRead' },

    -- display
    { 
		'lukas-reineke/indent-blankline.nvim',
		event = 'VeryLazy',
		config = function()
			vim.opt.list = true
			require("indent_blankline").setup {
				space_char_blankline = " ",
				show_current_context = true,
				show_current_context_start = true,
			}
		end
	},
    {
        'mvllow/modes.nvim',
        event = 'VeryLazy',
        config = function()
            require('modes').setup({
                copy = '#ff9e3b',
                delete = '#e82424',
                insert = '#7e9cd8',
                visual = '#98bb6c',
                set_cursorline = false
            })
        end
    },
	{
		"nvim-treesitter/nvim-treesitter",
		event = 'BufNewFile, BufRead'
	},
    { "nvim-tree/nvim-web-devicons", event = 'VeryLazy' },
    { 'lewis6991/gitsigns.nvim', config = true, event = 'VeryLazy' },
    -- theme
    { "cocopon/iceberg.vim", event = 'VeryLazy' },
    { "folke/tokyonight.nvim", event = 'VeryLazy' },
    { 
		"EdenEast/nightfox.nvim", 
		event = 'VeryLazy',
	},
    {
        "rebelot/kanagawa.nvim",
        config = function()
            vim.cmd([[
            colorscheme kanagawa
            highlight LineNr guifg=#b2b4be guibg=none
            highlight Comment cterm=none gui=none guifg=#b2b4be
            highlight Normal ctermbg=none guibg=none
            highlight NonText ctermbg=none guibg=none
            highlight Folded ctermbg=none guibg=none
            highlight EndOfBuffer ctermbg=none guibg=none
            highlight SignColumn ctermbg=none guibg=none
            ]])
        end
    },
    -- lualine
    {
        "nvim-lualine/lualine.nvim",
        event = 'VeryLazy',
        config = function()
            require('line')
        end
    },
    { "norcalli/nvim-colorizer.lua", cmd = 'ColorizerAttachToBuffer' },
    -- telescope
    { "nvim-lua/plenary.nvim", event = 'VeryLazy' },
    { 'stevearc/dressing.nvim', event = 'VeryLazy' },
    { 'nvim-telescope/telescope.nvim', cmd = 'Telescope' },
    { 'nvim-telescope/telescope-file-browser.nvim', event = 'VeryLazy' },
	{ 'delphinus/telescope-memo.nvim', event = 'VeryLazy' },
    -- buffer
    {
        "romgrk/barbar.nvim",
        event = 'VeryLazy',
		config = function ()
			require('bufferline').setup {
				auto_hide = true,
				icons = { pinned = {button = ''}}
			}
		end
    },

    --IO
    {
        "windwp/nvim-autopairs",
        event = 'InsertEnter',
        config = function()
            require('nvim-autopairs').setup()
        end
    },
    {
        "tversteeg/registers.nvim",
		event = 'VeryLazy',
        config = function()
            require('registers').setup()
        end
    },
    {
        "Pocco81/auto-save.nvim",
        event = 'VeryLazy',
        config = function()
            vim.g.auto_save = 1
            vim.g.auto_save_events = {'InsertLeave', 'TextChanged'}
            vim.g.auto_save_delay = 1000
        end
    },

    -- lsp
--    {'hrsh7th/nvim-cmp', event = 'InsertEnter, CmdlineEnter'},
--    {'hrsh7th/cmp-nvim-lsp', event = 'InsertEnter'}, 
--    {'hrsh7th/cmp-buffer', event = 'InsertEnter'},
--    {'hrsh7th/cmp-path', event = 'InsertEnter'},
--    {'hrsh7th/cmp-vsnip', event = 'InsertEnter'},
--    {'hrsh7th/cmp-cmdline', event = 'ModeChanged'},
--    {'hrsh7th/cmp-nvim-lsp-signature-help', event = 'InsertEnter'},
--    {'hrsh7th/cmp-nvim-lsp-document-symbol', event = 'InsertEnter'},
--    {'hrsh7th/cmp-calc', event = 'InsertEnter'},
--    {'onsails/lspkind.nvim', event = 'InsertEnter'},
--    {'hrsh7th/vim-vsnip', event = 'InsertEnter'},
--    {'hrsh7th/vim-vsnip-integ', event = 'InsertEnter'},
--    {'rafamadriz/friendly-snippets', event = 'InsertEnter'},
--    {'Maan2003/lsp_lines.nvim', config = true, event = 'BufNewFile, BufRead'},
--
--    {'williamboman/mason.nvim', event = 'BufRead', cmd = {'Mason', 'MasonInstall'},},
--    {'neovim/nvim-lspconfig', event = 'LspAttach'},
--    {'williamboman/mason-lspconfig.nvim', event = 'LspAttach'},

    -- disable default plugins
    performance = {
        rtp = {
            disabled_plugins = {
                'gzip',
                'zip',
                'man',
                'tutor',
                'tar',
                '2html_plugin'
            }
        }
    }
}
