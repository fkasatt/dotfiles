-- keymap
local set = vim.keymap.set

vim.g.mapleader = ' '
set('n', '<Esc><Esc>', ':nohl<CR>', { noremap = true, silent = true})	-- 検索候補強調表示消去
set('n', 'B', '/^$<CR>:nohl<CR>')	-- 直後の空白行へ移動
set('n', '<C-s>', ':<C-u>%s///g<Left><Left><Left>')  -- 全置換
set('n', '<C-c>', ":<C-u>echo wordcount()['chars']<CR>")  -- 文字数カウント
set('n', 'S', '<cmd>FuzzyMotion<CR>')	-- ファジィモーション
set('n', 'D', '<cmd>Gitsigns toggle_word_diff<CR>')	-- git diffをワード単位で見れるようにする
set('n', 'eq', ':<C-u>qa!<CR>')
-- set('n', 't', ':!echo "expand(\'%:p\')" | sed "s@.*/@@" | sed "s@.)@@" | cat >> del.txt<CR>:<C-u>qa!<CR>')
-- set('n', 'q', ':!echo "expand(\'%:p\')" | sed "s@.*/@@" | sed "s@.)@@" | cat >> corp.txt<CR>:<C-u>qa!<CR>')

-- buffer
set('n', '<leader>h', '<cmd>BufferPrevious<CR>')	-- バッファ間移動
set('n', '<leader>l', '<cmd>BufferNext<CR>')
set('n', '<leader>p', '<cmd>BufferMovePrevious<CR>')	-- バッファ移動
set('n', '<leader>n', '<cmd>BufferMoveNext<CR>')
set('n', '<leader>q', '<cmd>BufferClose<CR>')	-- バッファ削除
set('n', '<leader>j', '<cmd>BufferPick<CR>')	-- バッファファジィモーション

-- window
set('n', '<A-k>', '<cmd>wincmd k<CR>')	-- ウィンドウ移動
set('n', '<A-j>', '<cmd>wincmd j<CR>')	
set('n', '<A-h>', '<cmd>wincmd h<CR>')
set('n', '<A-l>', '<cmd>wincmd l<CR>')
set('n', 'ts', ':split<Return><C-w>w')
set('n', 'tv', ':vsplit<Return><C-w>w')
set('n', 'th', ':vertical resize +1<CR>')	-- サイズ調整
set('n', 'tl', ':vertical resize -1<CR>')
set('n', 'tk', ':horizontal resize +1<CR>')
set('n', 'tj', ':horizontal resize -1<CR>')

-- lsp
set('n', 'K',  '<cmd>lua vim.lsp.buf.hover()<CR>')
set('n', 'gf', '<cmd>lua vim.lsp.buf.formatting()<CR>')
set('n', 'gr', '<cmd>lua vim.lsp.buf.references()<CR>')
set('n', 'gd', '<cmd>lua vim.lsp.buf.definition()<CR>')
set('n', 'gD', '<cmd>lua vim.lsp.buf.declaration()<CR>')
set('n', 'gi', '<cmd>lua vim.lsp.buf.implementation()<CR>')
set('n', 'gt', '<cmd>lua vim.lsp.buf.type_definition()<CR>')
set('n', 'gn', '<cmd>lua vim.lsp.buf.rename()<CR>')
set('n', 'ga', '<cmd>lua vim.lsp.buf.code_action()<CR>')
set('n', 'ge', '<cmd>lua vim.diagnostic.open_float()<CR>')
set('n', 'g]', '<cmd>lua vim.diagnostic.goto_next()<CR>')
set('n', 'g[', '<cmd>lua vim.diagnostic.goto_prev()<CR>')

vim.lsp.handlers["textDocument/publishDiagnostics"] = vim.lsp.with(
  vim.lsp.diagnostic.on_publish_diagnostics, { virtual_text = false }
)
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

-- terminal
set('t', '<ESC>', '<C-\\><C-n><CR>')
set('n', '<M-Tab>', '<cmd>NeoTermToggle<CR>') -- Alt + Tab
set('t', '<M-Tab>', '<cmd>NeoTermToggle<CR>')

-- telescope
set('n', '<leader>.', '<cmd>Telescope find_files hidden=true<CR>')	-- ファイル検索
set('n', '<leader>,', '<cmd>Telescope frecency frecency<CR>')	-- 履歴検索
set('n', '<leader>s', '<cmd>Telescope live_grep grep_open_files=true<CR>')	-- 現在開いているファイルで検索
set('n', '<leader>k', '<cmd>Telescope live_grep<CR>')	-- 現在のディレクトリ？内で検索
set('n', '<leader>b', '<cmd>Telescope buffers<CR>')		-- バッファ検索
set('n', '<leader>v', '<cmd>Telescope registers<CR>')	-- クリップボード
set('n', '<leader>c', '<cmd>Telescope help_tags<CR>')	-- ヘルプ
set('n', '<leader>f', '<cmd>Telescope file_browser hidden=true<CR>')	-- ファイラ
-- set('n', 'gd', '<cmd>Telescope lsp_definitions<CR>')		-- 定義
-- set('n', 'gr', '<cmd>Telescope lsp_references<CR>')			-- 参照
-- set('n', 'gi', '<cmd>Telescope lsp_implementations<CR>')	-- 実装
-- set('n', 'gx', '<cmd>Telescope diagnostics<CR>')			-- エラー

-- nvim-tree
set('n', '<leader>t', '<cmd>NvimTreeToggle<CR>')

-- hlslens
set('n', 'n', [[<Cmd>execute('normal! ' . v:count1 . 'n')<CR><Cmd>lua require('hlslens').start()<CR>]], kopts)
set('n', 'N', [[<Cmd>execute('normal! ' . v:count1 . 'N')<CR><Cmd>lua require('hlslens').start()<CR>]], kopts)
set('n', '*', [[*<cmd>lua require('hlslens').start()<CR>]], kopts)
set('n', '#', [[#<cmd>lua require('hlslens').start()<CR>]], kopts)
set('n', 'g*', [[g*<cmd>lua require('hlslens').start()<CR>]], kopts)
set('n', 'g#', [[g#<cmd>lua require('hlslens').start()<CR>]], kopts)

-- skk-input
set("i", "<C-j>", "<Plug>(skkeleton-enable)")

-- typst
set('n', 'ew', "<cmd>!typst c '%'<CR>")
