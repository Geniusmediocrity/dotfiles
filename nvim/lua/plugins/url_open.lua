return {
	"sontungexpt/url-open",
	event = "VeryLazy",
	cmd = "URLOpenUnderCursor",
	config = function()
		local status_ok, url_open = pcall(require, "url-open")
		if not status_ok then
			return
		end
		url_open.setup ({})
	end,
	opts = {
		open_app = "default",

		-- If true, only open the URL when the cursor is in the middle of the URL.
		-- If false, open the next URL found from the cursor position,
		-- which means you can open a URL even when the cursor is in front of the URL or in the middle of the URL.
		open_only_when_cursor_on_url = false,
	}
}
