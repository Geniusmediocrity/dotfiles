return {
  'nvim-neo-tree/neo-tree.nvim',
  branch = 'v3.x',
  dependencies = {
    'nvim-lua/plenary.nvim',
    'nvim-tree/nvim-web-devicons',
    'MunifTanjim/nui.nvim',
  },
  config = function()
      require('neo-tree').setup {
        close_if_last_file_tree_exited = true,
        popup_border_style = 'rounded',
        enable_git = true,
        enable_diagnostics = true,
	filesystem = {
		filtered_items = {
			visible = true,
			hide_dotfiles = false,
			hide_gitignore = false
		},
	},
	default_component_configs = {
		modified = {
    		symbol = "●",
	    },
	    git_status = {
    		symbols = {
			    added     = "a",
		        modified  = "m",
        		deleted   = "d",
		        renamed   = "r",
		        untracked = "ut",
		        ignored   = "i",
		        unstaged  = "us",
		        staged    = "s",
        		conflict  = "⚠",
			}
		}
	},
        window = {
          position = 'left',
          width = 30,
          mappings = {
			['<space>'] = 'open',
            ['<cr>'] = 'open',
            ['t'] = 'open_tab_drop',
            ['a'] = 'add',
            ['d'] = 'delete',
            ['r'] = 'rename',
            ['c'] = 'copy_to_clipboard',
            ['x'] = 'cut_to_clipboard',
            ['p'] = 'paste_from_clipboard',
            ['m'] = 'move',
            ['q'] = 'close_window',
          },
        },
      }
    end,
}
