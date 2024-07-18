local function ts_disable(_, bufnr)
	return vim.api.nvim_buf_line_count(bufnr) > 5000
end

require("nvim-treesitter.configs").setup({
	ensure_installed = {"c", "cpp", "typst", "lua", "rust", "go", "css", "html", "javascript", "typescript", "ruby", "json", "yaml", "toml", "python", "markdown", "csv"},
  sync_install = false,
  auto_install = true,
  modules = {},
  ignore_install = {},

	highlight = {
		enable = true,
		disable = {},
		additional_vim_regex_highlighting = false,
	},
	indent = { enable = true },

  incremental_selection = {
    enable = true,
    keymaps = {
      init_selection = "gnn",
      node_incremental = "grn",
      scope_incremental = "grc",
      node_decremental = "grm",
    }
  }
})
