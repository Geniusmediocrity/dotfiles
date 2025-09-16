-- NOTE: NeoTree config
-- Toggle the Neo-Tree by clicking on`\`
vim.keymap.set("n", "\\", ":Neotree toggle float<CR>", { silent = true, desc = "Toogle Neo-Tree" })
vim.keymap.set("n", "\\l", ":Neotree toggle left<CR>", { silent = true, desc = "Toogle Neo-Tree" })

-- A function for opening a Neo-Tree from another directory
local function open_neo_tree_from_dir()
	local input = vim.fn.input("Enter directory path: ")
	input = string.gsub(input, "~", os.getenv("HOME"))
	if input == "" then
		print("No path provided.")
		return
	end

	-- Checking the existance of directory
	local stat = vim.loop.fs_stat(input)
	if not stat or not stat.type == "directory" then
		print("Invalid directory: " .. input)
		return
	end

	-- Close current tree (if it's open)
	pcall(vim.cmd.NeotreeClose)

	-- Opening the Neo-Tree with the desired path
	vim.cmd("Neotree dir=" .. input .. " reveal")
end

-- Comand :NeotreeOpenDir
vim.api.nvim_create_user_command("NeotreeOpenDir", open_neo_tree_from_dir, {
	nargs = 0,
	desc = "Open Neo-Tree from the specified path",
})

-- Mapping: \d → open tree from another directory
vim.keymap.set("n", "\\d", ":NeotreeOpenDir<CR>", { silent = true, desc = "Open Neo-Tree from the specified path" })

-- Mapping: \g -> shows git status for all files and dirs in current repo(dir)
local function show_git_status()
	local branch = vim.fn.input("Enter branch name(deffault main): ")
	if branch:match("^%s+$") ~= nil or branch == "" then
		branch = "main"
	end

	vim.cmd(":Neotree float git_status git_base=" .. branch)
end

vim.keymap.set("n", "\\g", show_git_status, { silent = true, desc = "Show Git [S]tatus on dif branch" })
vim.keymap.set("n", "\\b", ":Neotree float buffers toggle<CR>", { silent = true, desc = "[S]how All [B]uffers" })
