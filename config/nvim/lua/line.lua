require('lualine').setup {
    options = {
	    icons_enabled = true,
	    theme = 'auto',
	    component_separators = { left = '|', right = '|'},
	    section_separators = { left = '', right = ''},
	    disabled_filetypes = {},
	    always_divide_middle = true,
	    colored = true,
    },
	sections = {
		lualine_a = {
            {
                'filename',
				path = 1,
				shorting_target = 40,
    			symbols = {
	    		    modified = '凜',
		    		readonly = '',
			        unnamed = '',
                }
            }
        },
		lualine_b = {'filetype'},
		lualine_c = {
            'branch', 
            'diff'
        },
		lualine_x = {
			{
				'diagnostics',
				source = {'nvim-lsp'},
			}
		},
		lualine_y = {
            function()
                local all = vim.api.nvim_buf_line_count(0)
                local line = vim.fn.line('.')
                return string.format('%3d/%d', line, all)
            end
        },
		lualine_z = {
            function()
                return os.date("%H:%M")
            end
        }
    },
    inactive_sections = {
		lualine_a = {
            {
                'filename',
				path = 1,
				shorting_target = 40,
    			symbols = {
	    		    modified = '凜',
		    		readonly = '',
			        unnamed = '',
                }
            }
        },
		lualine_b = { 'filetype' },
		lualine_c = { 'branch' },
		lualine_x = {},
		lualine_y = {},
		lualine_z = {
            function()
                local all = vim.api.nvim_buf_line_count(0)
                return string.format('%d', all)
            end
        }
    },
    tabline = {},
	extensions = {},
}
