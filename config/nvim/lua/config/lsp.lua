return {
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
          ),
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
