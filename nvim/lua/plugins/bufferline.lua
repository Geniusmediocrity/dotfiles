return {
	'akinsho/bufferline.nvim',
	version = '*',
	dependencies = 'nvim-tree/nvim-web-devicons',
	config = function()
		require('bufferline').setup {
			options = {
				buffer_close_icon = "",
				mode = 'tabs',
				separator_style = 'slope',
				indicator = {
					style = "underline",
				},
				hover = {
					enabled = true,
					delay = 150,
					reveal = { 'close' }
				},
				always_show_bufferline = true,
				show_close_icon = false,
				show_buffer_close_icons = true,
				diagnostics = "nvim_lsp",
				diagnostics_indicator = function(count, level, diagnostics_dict, context)
					if not context.buffer then return "" end

					local s = " "

					local diag_info = {
						error = { icon = "", hl = "%#DiagnosticError#" },
						warning = { icon = "", hl = "%#DiagnosticWarn#" },
						info = { icon = "", hl = "%#DiagnosticInfo#" },
						hint = { icon = "", hl = "%#DiagnosticHint#" },
					}

					for ex, num in pairs(diagnostics_dict) do
						local sym = diag_info[ex].icon or ""
						local hl = diag_info[ex].hl or ""
						s = s .. hl .. num .. sym
					end

					return s .. "%*"
				end,
			},
			highlights = {
				buffer_selected = {
					italic = true,
					bold = false,
				},
				error_selected = {
					bold = false
				},
				warning_selected = {
					bold = false
				},
				diagnostic_selected = {
					bold = false,
				},
				hint_selected = {
					bold = false,
				},
				info_selected = {
					bold = false,
				}
			}
		}
    end,
}
