local function selectionCount()
    local mode = vim.fn.mode()
    local start_line, end_line, start_pos, end_pos
    local chars = 0
	local total_chars = 0

    if not (mode:find("[vV\22]") ~= nil) then
		local total_lines = vim.fn.line("$")

		for i = 1, total_lines do
			local line = vim.fn.getline(i)
			total_chars = total_chars + vim.fn.strchars(line)
			line = line:gsub("%s", "")
			line = line:gsub("　", "")
			chars = chars + vim.fn.strchars(line)
		end

		return tostring(total_chars) .. "(" .. tostring(chars) .. ")"
	end

    start_line = vim.fn.line("v")
    end_line = vim.fn.line(".")

    if mode == 'V' then
        start_pos = 1
        end_pos = vim.fn.strlen(vim.fn.getline(end_line)) + 1
    else
        start_pos = vim.fn.col("v")
        end_pos = vim.fn.col(".")
    end

    for i = start_line, end_line do
        local line = vim.fn.getline(i)
        local line_len = vim.fn.strlen(line)
        local s_pos = (i == start_line) and start_pos or 1
        local e_pos = (i == end_line) and end_pos or line_len + 1
        chars = chars + vim.fn.strchars(line:sub(s_pos, e_pos - 1))
    end

    return tostring(chars) .. ""
end

require('lualine').setup {
    options = {
	    icons_enabled = true,
	    theme = 'auto',
      globalStatus = true,
	    component_separators = { left = '│', right = '│'},
	    section_separators = { left = '', right = ''},
	    disabled_filetypes = {},
	    always_divide_middle = true,
	    colored = true
    },


	sections = {
		lualine_a = {
            {
                'filename', path = 1, shorting_target = 30,
    			symbols = { modified = '', readonly = '', unnamed = '', },
				separator = { left = '', right = '' }
            }
        },
		lualine_b = {'branch'},
		lualine_c = {
			{
				'diff',
				symbols = { added = ' ', modified = ' ', removed = ' ' },
			}
		},

		lualine_x = {'diagnostics'},
		lualine_y = {selectionCount},
		lualine_z = {
			{
				'progress',
				separator = { left = '', right = '' }
			}
        }
    },


    inactive_sections = {
		lualine_a = {
            {
                'filename',
				shorting_target = 10,
            }
        },
		lualine_b = { 'branch' },
		lualine_c = {},
		lualine_x = {},
		lualine_y = {},
		lualine_z = {}
    },

    tabline = {},
	extensions = {},
}
