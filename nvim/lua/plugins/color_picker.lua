return {
  "ziontee113/color-picker.nvim",
  cmd = { "PickColor", "PickColorInsert" },
  config = function()
    require("color-picker").setup({
	  ["icons"] = { "ﱢ", "" },
      ["border"] = "rounded", -- "double", "single", "none"
	  ["keymap"] = { -- mapping example:
		["U"] = "<Plug>ColorPickerSlider5Decrease",
		["O"] = "<Plug>ColorPickerSlider5Increase",
	},
	["background_highlight_group"] = "Normal", -- default
	["border_highlight_group"] = "FloatBorder", -- default
    ["text_highlight_group"] = "Normal", --default
    })

  end,
}

