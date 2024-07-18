require('telescope').setup({
    defaults = {
        color_devicons = true,
        file_ignore_patterns = { 'node_modules', '.git/', '.svg$', '.npm'},
        winblend = 4,
        layout_strategy = 'vertical',
        layout_config = { height = 0.9 },
        mappings = {
            i = {
                ['<Esc>'] = require('telescope.actions').close
            }
        }
    }
})

local fb_actions = require 'telescope'.extensions.file_browser.actions
local previewers = require('telescope.previewers')
local Job = require('plenary.job')
local new_maker = function(filepath, bufnr, opts)
    filepath = vim.fn.expand(filepath)
    Job:new({
        command = 'file',
        args = { '--mime-type', '-b', filepath },
        on_exit = function(j)
            local mime_type = vim.split(j:result()[1], '/')[1]
            if mime_type == 'text' then
                previewers.buffer_previewer_maker(filepath, bufnr, opts)
            else
                vim.schedule(function()
                    vim.api.nvim_buf_set_lines(bufnr, 0, -1, false, { 'BINARY' })
                end)
            end
        end
    }):sync()
end
