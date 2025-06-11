-- In lua/plugins/colorscheme.lua or wherever you define your colorschemes
return {
	"AlexvZyl/nordic.nvim",
	lazy = false,
	priority = 1000,
	config = function()
		require("nordic").load()
	end,
}
