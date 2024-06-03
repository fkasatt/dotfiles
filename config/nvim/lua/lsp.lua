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
          -- Server-specific settings...
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

      -- 2. build-in LSP function
      -- keyboard shortcut
      vim.keymap.set('n', 'K', '<cmd>lua vim.lsp.buf.hover()<CR>', {})
      vim.keymap.set('n', 'gf', '<cmd>lua vim.lsp.buf.format({ async = true })<CR>', {})
      vim.keymap.set('n', 'gr', '<cmd>lua vim.lsp.buf.references()<CR>', {})
      -- TODO <C-]>に割り当てる
      vim.keymap.set('n', 'gd', '<cmd>lua vim.lsp.buf.definition()<CR>', {})
      vim.keymap.set('n', 'gD', '<cmd>lua vim.lsp.buf.declaration()<CR>', {})
      vim.keymap.set('n', 'gi', '<cmd>lua vim.lsp.buf.implementation()<CR>', {})
      vim.keymap.set('n', 'gt', '<cmd>lua vim.lsp.buf.type_definition()<CR>', {})
      vim.keymap.set('n', 'gn', '<cmd>lua vim.lsp.buf.rename()<CR>', {})
      vim.keymap.set('n', 'ga', '<cmd>lua vim.lsp.buf.code_action()<CR>', {})
      vim.keymap.set('n', 'ge', '<cmd>lua vim.diagnostic.open_float()<CR>', {})
      vim.keymap.set('n', 'g]', '<cmd>lua vim.diagnostic.goto_next()<CR>', {})
      vim.keymap.set('n', 'g[', '<cmd>lua vim.diagnostic.goto_prev()<CR>', {})
      -- LSP handlers
      vim.lsp.handlers["textDocument/publishDiagnostics"] = vim.lsp.with(
        vim.lsp.diagnostic.on_publish_diagnostics, { virtual_text = false }
      )
    end
  },
  {
    'hrsh7th/nvim-cmp',
    dependencies = {
      'hrsh7th/cmp-nvim-lsp',
      'hrsh7th/vim-vsnip',
      'hrsh7th/cmp-path',
      'hrsh7th/cmp-buffer',
      'hrsh7th/cmp-cmdline',
    },
    config = function()
      -- 3. completion (hrsh7th/nvim-cmp)
      local cmp = require("cmp")
      cmp.setup({
        snippet = {
          expand = function(args)
            vim.fn["vsnip#anonymous"](args.body)
          end,
        },
        sources = {
          { name = "nvim_lsp" },
          { name = "buffer" },
          { name = "path" },
        },
        mapping = cmp.mapping.preset.insert({
          ["<C-p>"] = cmp.mapping.select_prev_item(),
          ["<C-n>"] = cmp.mapping.select_next_item(),
          ['<C-l>'] = cmp.mapping.complete({}),
          ['<C-e>'] = cmp.mapping.abort(),
          ["<CR>"] = cmp.mapping.confirm { select = true },
        }),
        experimental = {
          ghost_text = true,
        },
      })

      cmp.setup.cmdline('/', {
        mapping = cmp.mapping.preset.cmdline(),
        sources = {
          { name = 'buffer' }
        }
      })

      cmp.setup.cmdline(":", {
        mapping = cmp.mapping.preset.cmdline(),
        sources = {
          { name = "path" },
          { name = "cmdline" },
        },
      })
    end
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
            "BufWinEnter",
            "TabEnter",
            "TermEnter",
            "WinEnter",
            "CmdwinLeave",
            "TextChanged",
            "VimResized",
            "WinScrolled",
          },
          clear = {
            "BufWinLeave",
            "TabLeave",
            "TermLeave",
            "WinLeave",
          },
        },
        handlers = {
          diagnostic = true,
          search = false, -- Requires hlslens to be loaded, will run require("scrollbar.handlers.search").setup() for you
        },
      }

      require("scrollbar.handlers.search").setup({
        calm_dowm = true,
        nearest_only = true,
      })

      require("scrollbar.handlers.gitsigns").setup()
    end
  },
