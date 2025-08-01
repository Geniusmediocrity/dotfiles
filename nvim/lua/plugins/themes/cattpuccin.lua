return {
    'catppuccin/nvim',
    name = 'catppuccin',
    priority = 1000,
    config = function()
      require('catppuccin').setup {
        flavour = 'mocha',
        transparent_background = false,
        show_end_of_buffer = false,
        term_colors = true,
        integrations = {
          cmp = true,
          gitsigns = true,
          nvimtree = true,
          telescope = true,
          treesitter = true,
          bufferline = true,
          which_key = true,
        },
      }
      vim.cmd.colorscheme 'catppuccin'
    end,
}
