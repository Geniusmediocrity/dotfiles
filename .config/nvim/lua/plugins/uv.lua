-- Sync install packages
-- Sync virtual enviroment
-- And therefore lsp does not give any errors 
--  like 'package could not be resolved'.
--  But it's only if pacakge truly installed in your venv
--
-- Also you can add/remove pacakges using uv.
--   e.x.: 
--     <leader>xa -- add package and 
--     <leader>xd -- remove package

return {
	"benomahony/uv.nvim",
	opts = {
		picker_integration = true,
		execution = {
			notify_output = false,
		}
	},
}
