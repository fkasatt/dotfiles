return {

  {
    "vim-denops/denops.vim",
    lazy = false
  },

	{
    "nvim-lua/plenary.nvim",
    event = "VeryLazy"
  },

	{
		"stevearc/dressing.nvim",
		event = "VeryLazy",
		config = function()
			require("dressing").setup({
				input = { border = "single" },
				builtin = { border = "single" },
			})
		end
	},



  -- I/O

	{
		"vim-skk/skkeleton",
		dependencies = { "vim-denops/denops.vim" },
		config = function()
			local dictPath = {
				{"~/.skk/SKK-JISYO.all", "euc-jp"},
			}
			vim.fn["skkeleton#config"]({
				globalDictionaries = dictPath,
				eggLikeNewline = true,
				markerHenkan = "▹",
				markerHenkanSelect = "▸",
			})
		end
	},

	{
		"Pocco81/auto-save.nvim",
		event = "ModeChanged",
		config = function()
			vim.g.auto_save = 1
			vim.g.auto_save_events = { "InsertLeave", "TextChanged" }
			vim.g.auto_save_delay = 100
		end
	},

	{
		"windwp/nvim-autopairs",
		event = "InsertEnter",
		config = function()
			require("nvim-autopairs").setup()
		end
	},

	{
		"numToStr/Comment.nvim",
		event = "ModeChanged",
		config = function()
			require("Comment").setup()
		end,
	},

	{
		"folke/todo-comments.nvim",
		event = "VeryLazy",
		dependencies = { "nvim-lua/plenary.nvim" }
	},

  {
    'monaqa/dial.nvim',
    event = "ModeChanged",
    config = function()
      local augend = require("dial.augend")
      require("dial.config").augends:register_group({
        default = {
          augend.integer.alias.decimal,
          augend.integer.alias.hex,
          augend.constant.alias.bool,
          augend.date.alias["%Y/%m/%d"],
          augend.date.alias["%Y-%m-%d"],
          augend.date.alias["%H:%M"],
          augend.date.alias["%Y年%-m月%-d日"],
          augend.date.alias["%Y年%-m月%-d日(%ja)"],
          augend.constant.alias.ja_weekday,
          augend.constant.alias.ja_weekday_full,
        },
      })
    end
  },



  -- display

	{
    "folke/tokyonight.nvim", lazy = false,
    config = function()
      vim.cmd.colorscheme("tokyonight-moon")
      vim.api.nvim_set_hl(0, 'LineNr', {fg = '#c8d3f5', bg = 'NONE'})
    end,
  },
	{
    "rebelot/kanagawa.nvim",
    event = "VeryLazy"
  },
	{
    "EdenEast/nightfox.nvim",
    event = "VeryLazy"
  },

	{
		"lewis6991/gitsigns.nvim",
		event = { "BufRead", "BufNewFile" },
		config = function()
			require("config/gitsigns")
		end,
	},

	{
    "nvim-tree/nvim-web-devicons",
    event = "VeryLazy"
  },

	{
    "norcalli/nvim-colorizer.lua",
    cmd = "ColorizerAttachToBuffer"
  },

	{
		"nvim-treesitter/nvim-treesitter",
		event = "BufReadPost",
		build = ":TSUpdateSync",
		config = function()
			require("config/nvim-treesitter")
		end,
	},

	{
		"shellRaining/hlchunk.nvim",
		event = "UIEnter",
		config = function()
			local palette = require('nightfox.palette').load("nightfox")
			require("hlchunk").setup({
				chunk = {
					style = {
						{ fg = palette.blue.base },
						{ fg = palette.red.base },
					},
          enable = true,
				},
				line_num = {
					enable = false,
				},
			})
		end
  },



  -- UI

	{
		"nvim-lualine/lualine.nvim",
		event = "VeryLazy",
		config = function()
			require("config/lualine")
		end,
	},

	{
		"romgrk/barbar.nvim",
    event = "ModeChanged",
		config = function()
			require("bufferline").setup({
				auto_hide = true,
				icons = { pinned = { button = "" } },
			})
		end,
	},

	{
		"nyngwang/NeoTerm.lua",
		event = "ModeChanged",
		config = function()
			require("neo-term").setup({
				exclude_filetypes = { "oil" },
			})
			vim.cmd([[
				autocmd TermOpen * setlocal norelativenumber
				autocmd TermOpen * setlocal nonumber
			]])
		end,
	},

	{
		"shortcuts/no-neck-pain.nvim",
		event = "VeryLazy"
	},

	{
		"nvim-tree/nvim-tree.lua",
		event = "VeryLazy",
		config = function()
			require("nvim-tree").setup({
        sort_by = "case_sensitive",
        view = { adaptive_size = true, },
        renderer = { group_empty = true, },
        filters = { dotfiles = true },
        diagnostics = { enable = true, }
      })
		end,
	},



	-- search

	{
    "junegunn/fzf.vim",
    event = "VeryLazy"
  },

	{
		"yuki-yano/fuzzy-motion.vim",
    event = "VeryLazy",
		config = function()
			vim.g.fuzzy_motion_matchers = "fzf"
		end,
	},

	{
		"kevinhwang91/nvim-hlslens",
    event = { "BufRead", "BufNewFile" },
		config = function()
			require("hlslens").setup()
		end,
	},



  -- Telescope

	{
		"nvim-telescope/telescope.nvim",
    event = "ModeChanged",
		config = function()
			require("config/telescope")
		end,
	},
	{
    "nvim-telescope/telescope-file-browser.nvim",
    cmd = "Telescope find_files"
  },
	{
		"nvim-telescope/telescope-frecency.nvim",
    cmd = "Telescope frecency frecency",
		config = function()
			require("telescope").load_extension "frecency"
		end,
	},
  {
    'prochri/telescope-all-recent.nvim',
    event = "ModeChanged",
    dependencies = {
      "nvim-telescope/telescope.nvim",
      "kkharji/sqlite.lua",
      "stevearc/dressing.nvim"
    },
  },



	-- Typst

	{
		'kaarmu/typst.vim',
		ft = 'typst',
		lazy = false,
	},

  { import = "config/lsp" },

  -- Task runner

	{
		"is0n/jaq-nvim",
		event = { "BufRead", "BufNewFile" },
		config = function()
			require("config/jaq")
		end
	},
}
