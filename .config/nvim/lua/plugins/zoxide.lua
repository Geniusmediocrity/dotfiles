-- Usage
-- The plugin defines commands that wrap the functionality of zoxide:
--
-- :Z {query}: cd to the highest ranked directory matching your query. If {query} is omitted, cd to the home directory
-- :Lz {query}: same as :Z, but local to the current window
-- :Tz {query}: same as :Z, but local to the current tab
-- :Zi {query}: cd to one of your highest ranking directories using fzf
-- :Lzi {query}: same as :Zi, but local to the current window
-- :Tzi {query}: same as :Zi, but local to the current tab

return {

	-- Small NeoVim wrapper for zoxide
	"nanotee/zoxide.vim",
	dependencies = { "junegunn/fzf" },
}
