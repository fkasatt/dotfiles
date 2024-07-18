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
		lazy=false,
	},



  -- LSP

  {
    'j-hui/fidget.nvim',
    tag = 'legacy',
    event = 'LspAttach'
  },
  {
    'williamboman/mason-lspconfig.nvim',
    dependencies = {
      'williamboman/mason.nvim',
      'neovim/nvim-lspconfig',
      'glepnir/lspsaga.nvim',
      'j-hui/fidget.nvim',
      'folke/neodev.nvim'
    },
    config = function()
      require("neodev").setup()
      require('mason').setup()

      require('mason-lspconfig').setup_handlers({ function(server)
        local node_root_dir = require('lspconfig').util.root_pattern("package.json")
        local is_node_repo = node_root_dir(vim.api.nvim_buf_get_name(0)) ~= nil
        local opt = {
          capabilities = require('cmp_nvim_lsp').default_capabilities(
            vim.lsp.protocol.make_client_capabilities()
          )
        }


        if server_name == "tsserver" then
          if not is_node_repo then
            return
          end

          opt.root_dir = node_root_dir
        elseif server_name == "eslint" then
          if not is_node_repo then
            return
          end

          opt.root_dir = node_root_dir
        elseif server_name == "denols" then
          if is_node_repo then
            return
          end

          opt.root_dir = require('lspconfig').util.root_pattern("deno.json", "deno.jsonc", "deps.ts", "import_map.json")
          opt.init_options = {
            lint = true,
            unstable = true,
            suggest = {
              imports = {
                hosts = {
                  ["https://deno.land"] = true,
                  ["https://cdn.nest.land"] = true,
                  ["https://crux.land"] = true
                }
              }
            }
          }
        end

        require('lspconfig')[server].setup(opt)

        require('lspconfig')['rust_analyzer'].setup {
          on_attach = on_attach,
          flags = lsp_flags,
          settings = {
            ["rust-analyzer"] = {
              checkOnSave = {
                command = "clippy"
              }
            }
          }
        }

        require('fidget').setup()
      end })

      -- LSP handlers
      vim.lsp.handlers["textDocument/publishDiagnostics"] = vim.lsp.with(
        vim.lsp.diagnostic.on_publish_diagnostics, { virtual_text = false }
      )
    end
  },
  {
    'hrsh7th/nvim-cmp',
    dependencies = {
      'hrsh7th/cmp-nvim-lsp', 'hrsh7th/vim-vsnip', 'hrsh7th/cmp-path', 'hrsh7th/cmp-buffer', 'hrsh7th/cmp-cmdline',
    },
    config = function()
      require("config/nvim-cmp")
    end,
  },
  {
    'petertriho/nvim-scrollbar',
    config = function()
      local colors = require("tokyonight.colors").setup()
      require("scrollbar").setup {
        show_in_active_only = true,
        handle = {
          color = "#3b4261",
        },
        marks = {
          Search = {
            text = { "-", "=" },
            priority = 0,
            color = colors.orange,
          },
          Error = {
            text = { "-", "=" },
            priority = 1,
            color = colors.error,
          },
          Warn = {
            text = { "-", "=" },
            priority = 2,
            color = colors.warning,
          },
          Info = {
            text = { "-", "=" },
            priority = 3,
            color = colors.info,
          },
          Hint = {
            text = { "-", "=" },
            priority = 4,
            color = colors.hint,
          },
          Misc = {
            text = { "-", "=" },
            priority = 5,
            color = colors.purple,
          },
        },
        excluded_buftypes = {
          "terminal",
        },
        excluded_filetypes = {
          "prompt",
          "TelescopePrompt",
        },
        autocmd = {
          render = {
            "BufWinEnter", "TabEnter", "TermEnter", "WinEnter", "CmdwinLeave", "TextChanged", "VimResized", "WinScrolled",
          },
          clear = {
            "BufWinLeave", "TabLeave", "TermLeave", "WinLeave",
          },
        },
        handlers = {
          diagnostic = true,
          search = false,
        },
      }

      require("scrollbar.handlers.search").setup({
        calm_dowm = true,
        nearest_only = true,
      })

      require("scrollbar.handlers.gitsigns").setup()
    end
  },
}
