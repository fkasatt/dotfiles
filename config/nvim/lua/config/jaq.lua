require('jaq-nvim').setup{
  -- nvim内で実行
  cmds = {
    internal = {
      lua = "lualine %",
      vim = "source %"
    },
    -- シェルで実行
    external = {
      python = "python3 %",
      c = "gcc -o main.o % && ./main.o",
      rust = "cargo run %",
      go = "go run %",
      sh = "bash %",
      javascript = "node %",
      typescript = "node %",
      typst = "typst compile % tmp.pdf",
    },
  },

  behavior = {
    default = "float",
    startinsert = false,
    wincmd = false,
    autosave = false,
  },

  ui = {
    float = {
      border = "none",
      winhl = "Normal",
      borderhl = "FloatBorder",
      winblend = 0,
      height = 0.8,
      width = 0.8,
      x = 0.5,
      y = 0.5,
    },
    terminal = {
      position = "bot",
      size = 10,
      line_no = false,
    },
    quickfix = {
      position = "bot",
      size = 10,
    }
  }
}
