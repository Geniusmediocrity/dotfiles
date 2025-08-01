-- NOTE: NeoTree config
-- Toggle the Neo-Tree by clicking on`\`
vim.keymap.set('n', '\\', ':Neotree toggle<CR>', { desc = 'Закрыть дерево файлов' })

-- A function for opening a Neo-Tree from another directory
local function open_neo_tree_from_dir()
  local input = vim.fn.input 'Enter directory path: '
  input = string.gsub(input, "~", os.getenv( "HOME" ))
  if input == '' then
    print 'No path provided.'
    return
  end

  -- Checking the existance of directory
  local stat = vim.loop.fs_stat(input)
  if not stat or not stat.type == 'directory' then
    print('Invalid directory: ' .. input)
    return
  end

  -- Close current tree (if it's open)
  pcall(vim.cmd.NeotreeClose)

  -- Opening the Neo-Tree with the desired path
  vim.cmd('Neotree dir=' .. input .. ' reveal')
end

-- Comand :NeotreeOpenDir
vim.api.nvim_create_user_command('NeotreeOpenDir', open_neo_tree_from_dir, {
  nargs = 0,
  desc = 'Открыть Neo-Tree из указанной директории',
})

-- Mapping: \d → open tree from another directory
vim.keymap.set('n', '\\d', ':NeotreeOpenDir<CR>', { desc = 'Открыть Neo-Tree из другой директории' })
