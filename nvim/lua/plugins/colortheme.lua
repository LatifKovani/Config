return {
  'loctvl842/monokai-pro.nvim',
  config = function()
    require('monokai-pro').setup {
      filter = 'pro', -- or any variant (classic, octagon, etc.)
      transparent_background = true, -- THE KEY OPTION
      italic_comments = true,
      italic_keywords = true,
      italic_functions = false,
      italic_variables = false,
    }
    vim.cmd.colorscheme 'monokai-pro'

    -- Optional: Force transparency for UI elements not covered by the theme
    vim.api.nvim_set_hl(0, 'NormalFloat', { bg = 'none' }) -- Floating windows
    vim.api.nvim_set_hl(0, 'TelescopeNormal', { bg = 'none' }) -- Telescope
    vim.api.nvim_set_hl(0, 'NeoTreeNormal', { bg = 'none' }) -- Main window
    vim.api.nvim_set_hl(0, 'NeoTreeNormalNC', { bg = 'none' }) -- Non-current window
    vim.api.nvim_set_hl(0, 'NeoTreeEndOfBuffer', { bg = 'none' }) -- ~ lines at the end
    vim.api.nvim_set_hl(0, 'NeoTreeCursorLine', { bg = '#3a3a3a' })
    vim.api.nvim_set_hl(0, 'StatusLine', { bg = 'none' }) -- Main status line
    vim.api.nvim_set_hl(0, 'StatusLineNC', { bg = 'none' })
  end,
}
