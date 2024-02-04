return {

	-- IO

	---- deno, input method
	{
		"vim-denops/denops.vim",
		dependencies = {
			"vim-skk/skkeleton",
			config = function()
				local dicts = {
					{"~/.skk/SKK-JISYO.all", "euc-jp"},
					-- {"~/.skk/SKK-JISYO.jawiki", "utf-8"}
				}
				vim.fn["skkeleton#config"]({
					globalDictionaries = dicts,
					eggLikeNewline = true,
					markerHenkan = "▹",
					markerHenkanSelect = "▸",
				})
			end,
		},
	},

	---- 自動補完
	{
		"windwp/nvim-autopairs",
		event = "InsertEnter",
		config = function()
			require("nvim-autopairs").setup()
		end,
	},

	---- 自動保存
	{
		"Pocco81/auto-save.nvim",
		event = "ModeChanged",
		config = function()
			vim.g.auto_save = 1
			vim.g.auto_save_events = { "InsertLeave", "TextChanged" }
			vim.g.auto_save_delay = 100
		end,
	},

	---- コメント
	{
		"numToStr/Comment.nvim",
		event = "ModeChanged",
		config = function()
			require("Comment").setup()
		end,
	},

	-- lsp

	{ "neovim/nvim-lspconfig", event = "LspAttach" },

	{
		"williamboman/mason.nvim",
		cmd = { "Mason", "MasonInstall" },
		config = function()
			require("mason").setup()
		end,
	},
	{
		"williamboman/mason-lspconfig.nvim",
		event = "LspAttach",
		config = function()
			require("mason-lspconfig").setup_handlerss({
				function(server)
					local opt = {
						capabilities = require("cmp_nvim_lsp").update_capabilities(
							vim.lsp.protocol.make_client_capabilities()
						),
					}
					require("lspconfig")[server].setup(opt)
				end,
			})
		end,
	},

	{
		"hrsh7th/nvim-cmp",
		event = { "InsertEnter", "CmdlineEnter" },
		config = function()
			require("config/nvim-cmp")
		end,
	},
	{ "hrsh7th/cmp-nvim-lsp", event = "InsertEnter" },
	{ "hrsh7th/cmp-path", event = { "InsertEnter", "CmdlineEnter" } },
	{ "hrsh7th/cmp-cmdline", event = "ModeChanged" },

	{
		"stevearc/dressing.nvim",
		event = "VeryLazy",
		config = function()
			require("dressing").setup({
				input = { border = "single" },
				builtin = { border = "single" },
			})
		end,
	},

	-- search

	---- fzf
	{ "junegunn/fzf.vim", event = "VeryLazy" },

	---- ファジィモーション
	{
		"yuki-yano/fuzzy-motion.vim", event = "VeryLazy",
		config = function()
			vim.g.fuzzy_motion_matchers = "fzf"
		end,
	},

	---- マッチ候補の末尾に[n/all]を付け加える。また他のマッチ候補には[6n]など直で移動できるコマンドを示す
	{
		"kevinhwang91/nvim-hlslens", event = { "BufRead", "BufNewFile" },
		config = function()
			require("hlslens").setup({
				calm_down = true, -- カーソルを外したら検索強調が消える
			})
		end,
	},

	{
		"koron/vim-budoux", event = "BufRead", 
	},

	-- UI

	---- Tree-Sitter
	{
		"nvim-treesitter/nvim-treesitter",
		event = "BufReadPost",
		build = ":TSUpdateSync",
		config = function()
			require("config/nvim-treesitter")
		end,
	},

	---- Status Bar
	{
		"nvim-lualine/lualine.nvim",
		event = "VeryLazy",
		config = function()
			require("config/lualine")
		end,
	},

	---- Theme
	{ "cocopon/iceberg.vim", event = "VeryLazy" },
	{ "folke/tokyonight.nvim", lazy = false },
	{ "rebelot/kanagawa.nvim", event = "VeryLazy" },
	{ "EdenEast/nightfox.nvim", event = "VeryLazy" },

	---- バッファタブ表示・操作
	{
		"romgrk/barbar.nvim", event = "ModeChanged",
		config = function()
			require("bufferline").setup({
				auto_hide = true,
				icons = { pinned = { button = "" } },
			})
		end,
	},

	---- Indent
	{
		"lukas-reineke/indent-blankline.nvim", event = "BufReadPost",
		main = "ibl",
		config = function()
			local highlight = {
				"CursorColumn",
				"WhiteSpace"
			}
			require("ibl").setup{
				indent = { highlight = highlight, char = "" },
				whitespace = {
					highlight = highlight,
					remove_blankline_trail = false
				},
				scope = { enabled = false }
			}
		end,
	},

	---- コード中のカラーコードの背景色をそのカラーコードの色にしてくれる
	{ "norcalli/nvim-colorizer.lua", cmd = "ColorizerAttachToBuffer" },

	---- カーソルを現在のモードの色にしてくれる
	{
		"mvllow/modes.nvim", event = "ModeChanged",
		config = function()
			require("modes").setup({
				copy = "#ff9e3b",
				delete = "#e82424",
				insert = "#7e9cd8",
				visual = "#98bb6c",
				set_cursorline = false,
			})
		end,
	},

	---- git状況を色などで示す
	{
		"lewis6991/gitsigns.nvim",
		event = { "BufRead", "BufNewFile" },
		config = function()
			require("config/gitsigns")
		end,
	},

	---- terminal
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

	---- filer
	{
		"nvim-tree/nvim-tree.lua",
		event = "VeryLazy",
		config = function()
			require("nvim-tree").setup()
		end,
	},

	---- nerd icon
	{ "nvim-tree/nvim-web-devicons", event = "VeryLazy" },


	---- telescope
	{ "nvim-lua/plenary.nvim", event = "VeryLazy"},
	{
		"nvim-telescope/telescope.nvim", event = "ModeChanged",
		config = function()
			require("config/telescope")
		end,
	},
	{ "nvim-telescope/telescope-file-browser.nvim", cmd = "Telescope find_files" },
	{
		"nvim-telescope/telescope-frecency.nvim", cmd = "Telescope frecency frecency",
		config = function()
			require("telescope").load_extension "frecency"
		end,
	},


	-- Typst
	{
		'kaarmu/typst.vim',
		ft = 'typst',
		lazy=false,
	},


	-- disable default plugins

	performance = {
		rtp = {
			disabled_plugins = {
				"gzip", "matchit", "matchparen", "netrwPlugin", "rplugin", "shada", "spellfile", "tarPlugin", "tohtml", "tutor", "zipPlugin",
			},
		},
	},
}
