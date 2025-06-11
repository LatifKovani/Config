return {
	"projekt0n/github-nvim-theme",
	name = "github-theme",
	lazy = false, -- make sure we load this during startup if it is your main colorscheme
	priority = 1000, -- make sure to load this before all the other start plugins
	config = function()
		require("github-theme").setup({
			vim.api.nvim_set_hl(0, "OilDir", { fg = "#539bf5" }),
		})
		vim.cmd("colorscheme github_dark_dimmed")
	end,
}
