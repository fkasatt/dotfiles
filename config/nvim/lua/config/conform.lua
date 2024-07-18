require("conform").setup({
    formatters_by_ft = {
        lua = { "stylua" },
        python = { "isort", "black" },
		bash = { "shellharden" }, 
		c = { "clang_format" },
		css = { "stylelint" },
		rust = { "rustfmt" }
    },
    format_on_save = {
        timeout_ms = 500,
        lsp_fallback = true,
    },
})
