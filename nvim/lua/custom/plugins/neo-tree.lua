return {
  'nvim-neo-tree/neo-tree.nvim',
  branch = 'v3.x',
  dependencies = {
    'nvim-lua/plenary.nvim',
    'nvim-tree/nvim-web-devicons', -- optional, for file icons
    'MunifTanjim/nui.nvim',
  },
  config = function()
    require('neo-tree').setup {
      filesystem = {
        filtered_items = {
          visible = true, -- Show hidden files by default
          hide_dotfiles = false,
          hide_gitignored = false,
          hide_by_name = {
            -- Можно добавить дополнительные файлы для скрытия при необходимости
          },
        },
      },
      window = {
        mappings = {
          ['i'] = 'toggle_hidden', -- Переключатель скрытых файлов (по желанию)
        },
      },
    }
    vim.keymap.set('n', '<leader>e', ':Neotree toggle<CR>', { desc = '[E]xplore files' })
  end,
}
