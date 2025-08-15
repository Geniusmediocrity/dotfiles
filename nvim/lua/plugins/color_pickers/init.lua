return {
	require("plugins.color_pickers.easycolor"),  -- Easy color picker on color circle(square)
	require("plugins.color_pickers.color_creator"), -- To pick the colors in colored line
	require("plugins.color_pickers.colorizer"),  -- For preview color
	-- ColorCreator also allows you to highlight colors, but it doesn't colorize name colors(i.e.: red, blue, etc.)
	-- I use both because highlihting names is usefull and sometimes no
}
