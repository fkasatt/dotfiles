local set = vim.keymap.set
vim.g.mapleader = ' '


-- 検索候補強調表示消去
set('n', '<Esc><Esc>', ':nohl<CR>', { noremap = true, silent = true})
-- 直後の空白行へ移動
set('n', 'B', '/^$<CR>:nohl<CR>')
-- 全置換
set('n', '<C-s>', ':<C-u>%s///g<Left><Left><Left>')
-- ファジィモーション
set('n', 'S', '<cmd>FuzzyMotion<CR>')
-- git diffをワード単位で見れるようにする
set('n', 'D', '<cmd>Gitsigns toggle_word_diff<CR>')
-- 全終了
set('n', 'eq', ':<C-u>qa!<CR>')


-- ウィンドウ移動
set('n', '<A-k>', '<cmd>wincmd k<CR>')
set('n', '<A-j>', '<cmd>wincmd j<CR>')
set('n', '<A-h>', '<cmd>wincmd h<CR>')
set('n', '<A-l>', '<cmd>wincmd l<CR>')
-- ウィンドウ分割
set('n', 'ts', ':split<Return><C-w>w')
set('n', 'tv', ':vsplit<Return><C-w>w')
-- ウィンドウサイズ調整
set('n', 'th', ':vertical resize +1<CR>')
set('n', 'tl', ':vertical resize -1<CR>')
set('n', 'tk', ':horizontal resize +1<CR>')
set('n', 'tj', ':horizontal resize -1<CR>')


-- バッファ
-- バッファ間移動
set('n', '<leader>h', '<cmd>BufferPrevious<CR>')
set('n', '<leader>l', '<cmd>BufferNext<CR>')
-- バッファ移動
set('n', '<leader>p', '<cmd>BufferMovePrevious<CR>')
set('n', '<leader>n', '<cmd>BufferMoveNext<CR>')
-- バッファ削除
set('n', '<leader>q', '<cmd>BufferClose<CR>')
-- バッファファジィモーション
set('n', '<leader>j', '<cmd>BufferPick<CR>')


-- ターミナル
set('t', '<ESC>', '<C-\\><C-n><CR>')
set('n', '<M-Tab>', '<cmd>NeoTermToggle<CR>') -- Alt + Tab
set('t', '<M-Tab>', '<cmd>NeoTermToggle<CR>')


-- Telescope
-- ファイラ
set('n', '<leader>f', '<cmd>Telescope file_browser hidden=true<CR>')
-- ファイル検索
set('n', '<leader>.', '<cmd>Telescope find_files hidden=true<CR>')
-- 履歴ファイル検索
set('n', '<leader>,', '<cmd>Telescope frecency frecency<CR>')
-- 現在開いているファイルから検索
set('n', '<leader>s', '<cmd>Telescope live_grep grep_open_files=true<CR>')
-- 現在のディレクトリ？内で検索
set('n', '<leader>k', '<cmd>Telescope live_grep<CR>')
-- クリップボード
set('n', '<leader>v', '<cmd>Telescope registers<CR>')
-- ブックマーク移動
set('n', '<leader>m', '<cmd>Telescope marks<CR>')
-- set('n', 'gd', '<cmd>Telescope lsp_definitions<CR>')		-- 定義
-- set('n', 'gr', '<cmd>Telescope lsp_references<CR>')			-- 参照
-- set('n', 'gi', '<cmd>Telescope lsp_implementations<CR>')	-- 実装
-- set('n', 'gx', '<cmd>Telescope diagnostics<CR>')			-- エラー


-- dial.nvim
set('n', '<C-a>', '<Plug>(dial-increment)')
set('n', '<C-x>', '<Plug>(dial-decrement)')
set('v', '<C-a>', '<Plug>(dial-increment)')
set('v', '<C-x>', '<Plug>(dial-decrement)')
set("n", "g<C-a>", function() require("dial.map").manipulate("increment", "gnormal") end)
set("n", "g<C-x>", function() require("dial.map").manipulate("decrement", "gnormal") end)

-- nvim-tree
set('n', '<leader>t', '<cmd>NvimTreeToggle<CR>')

-- skk-input
set("i", "<C-j>", "<Plug>(skkeleton-enable)")

-- typst
set('n', 'ew', "<cmd>!typst c '%'<CR>")




-- Reference highlight
vim.cmd [[
set updatetime=500
highlight LspReferenceText  cterm=underline ctermfg=1 ctermbg=8 gui=underline guifg=#A00000 guibg=#104040
highlight LspReferenceRead  cterm=underline ctermfg=1 ctermbg=8 gui=underline guifg=#A00000 guibg=#104040
highlight LspReferenceWrite cterm=underline ctermfg=1 ctermbg=8 gui=underline guifg=#A00000 guibg=#104040
augroup lsp_document_highlight
	autocmd!
	autocmd CursorHold,CursorHoldI * lua vim.lsp.buf.document_highlight()
	autocmd CursorMoved,CursorMovedI * lua vim.lsp.buf.clear_references()
augroup END
]]
