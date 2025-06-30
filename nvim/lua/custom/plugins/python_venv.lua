return {
	local function get_venv_path()
	  local path = vim.fs.find({ '.venv', 'venv', '.virtualenv' }, { path = vim.loop.cwd(), upward = true })
	  if #path > 0 then
	    local venv_path = path[1] .. '/bin/python'
	    if vim.uv.fs_stat(venv_path) then
	      return venv_path
	    end
	  end
	  return nil
	end
}
