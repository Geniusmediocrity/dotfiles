return {
	"nvim-lualine/lualine.nvim",
	dependencies = { "nvim-tree/nvim-web-devicons" },
	config = function()
	local lualine = require("lualine")
    local lazy_status = require("lazy.status") -- to configure lazy pending updates count

    local colors = {
    	blue = "#65D1FF",
		green = "#7fffa1",
		violet = "#CAA5F5",
		yellow = "#FAB387",
		red = "#FF4A4A",
		fg = "#c3ccdc",
		bg = "#42455a",
		inactive_bg = "#2c3043",
	}

    local my_lualine_theme = {
    	normal = {
			a = { bg = colors.blue, fg = colors.bg, gui = "bold" },
			b = { bg = colors.bg, fg = colors.fg },
			c = { bg = colors.bg, fg = colors.fg },
		},
		insert = {
			a = { bg = colors.green, fg = colors.bg, gui = "bold" },
			b = { bg = colors.bg, fg = colors.fg },
			c = { bg = colors.bg, fg = colors.fg },
		},
		visual = {
			a = { bg = colors.violet, fg = colors.bg, gui = "bold" },
			b = { bg = colors.bg, fg = colors.fg },
			c = { bg = colors.bg, fg = colors.fg },
		},
		command = {
			a = { bg = colors.yellow, fg = colors.bg, gui = "bold" },
			b = { bg = colors.bg, fg = colors.fg },
			c = { bg = colors.bg, fg = colors.fg },
		},
		replace = {
			a = { bg = colors.red, fg = colors.bg, gui = "bold" },
			b = { bg = colors.bg, fg = colors.fg },
			c = { bg = colors.bg, fg = colors.fg },
		},
		inactive = {
			a = { bg = colors.inactive_bg, fg = colors.semilightgray, gui = "bold" },
			b = { bg = colors.inactive_bg, fg = colors.semilightgray },
			c = { bg = colors.inactive_bg, fg = colors.semilightgray },
		},
	}

	-- configure lualine with modified theme
	lualine.setup({
		options = {
			icons_ebabled = true,
			theme = my_lualine_theme,
			component_separators = '',
			section_separators = { left = '', right = '' },
			disabled_filetypes = {
				statusline = { "neo-tree" },
				winbar = {},
			},
			always_show_tabline = true,
		},
		sections = {
			lualine_a = { { 'mode', separator = { left = '', right = '' }, right_padding = 2 } },

			lualine_b = {'branch', 'diff', 'diagnostics'},

			lualine_c = { '%=', 'filename' },

	        lualine_x = {
	          {
	            lazy_status.updates,
	            cond = lazy_status.has_updates,
	            color = { fg = "#ff9e64" },
	          },
	          { "encoding" },
	          { "fileformat" },
	          { "filetype" },
	        },

		    lualine_y = {'progress'},
		    lualine_z = { {'location', separator = { left = '', right = '' }, left_padding = 2 } }
		},

		inactive_sections = {
			lualine_a = {},
			lualine_b = {},
			lualine_c = { { 'filename', separator = { left = '' } } },
			lualine_x = {},
			lualine_y = {},
			lualine_z = { { 'location', separator = { right = '' } } }
		},
    })
  end,
}
