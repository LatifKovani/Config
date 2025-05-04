return {
  'nvim-lualine/lualine.nvim',
  config = function()
    -- Everforest color palette (soft dark variant)
    local colors = {
      bg = '#2b3339', -- Dark background
      fg = '#d3c6aa', -- Default text
      yellow = '#dbbc7f', -- Visual mode
      cyan = '#83c092', -- Insert mode
      green = '#a7c080', -- Normal mode
      orange = '#e69875', -- Command mode
      red = '#e67e80', -- Replace mode
      gray = '#7a8478', -- Inactive text
    }

    local mode = {
      'mode',
      fmt = function(str)
        return ' ' .. str
        -- return ' ' .. str:sub(1, 1) -- displays only the first character of the mode
      end,
    }

    local filename = {
      'filename',
      file_status = true, -- displays file status (readonly status, modified status)
      path = 0, -- 0 = just filename, 1 = relative path, 2 = absolute path
    }

    local hide_in_width = function()
      return vim.fn.winwidth(0) > 100
    end

    local diagnostics = {
      'diagnostics',
      sources = { 'nvim_diagnostic' },
      sections = { 'error', 'warn' },
      symbols = { error = ' ', warn = ' ', info = ' ', hint = ' ' },
      colored = false,
      update_in_insert = false,
      always_visible = false,
      cond = hide_in_width,
    }

    local diff = {
      'diff',
      colored = false,
      symbols = { added = ' ', modified = ' ', removed = ' ' }, -- changes diff symbols
      cond = hide_in_width,
    }

    require('lualine').setup {
      options = {
        icons_enabled = true,
        theme = {
          normal = {
            a = { bg = colors.green, fg = colors.bg, gui = 'bold' },
            b = { bg = 'NONE', fg = colors.fg },
            c = { bg = 'NONE', fg = colors.fg },
          },
          insert = { a = { bg = colors.cyan, fg = colors.bg, gui = 'bold' } },
          visual = { a = { bg = colors.yellow, fg = colors.bg, gui = 'bold' } },
          replace = { a = { bg = colors.red, fg = colors.bg, gui = 'bold' } },
          command = { a = { bg = colors.orange, fg = colors.bg, gui = 'bold' } },
          inactive = {
            a = { bg = 'NONE', fg = colors.gray },
            b = { bg = 'NONE', fg = colors.gray },
            c = { bg = 'NONE', fg = colors.gray },
          },
        },
        section_separators = { left = '', right = '' },
        component_separators = { left = '', right = '' },
        disabled_filetypes = { 'alpha', 'neo-tree' },
        always_divide_middle = true,
      },
      sections = {
        lualine_a = { mode },
        lualine_b = { 'branch' },
        lualine_c = { filename },
        lualine_x = { diagnostics, diff, { 'encoding', cond = hide_in_width }, { 'filetype', cond = hide_in_width } },
        lualine_y = { 'location' },
        lualine_z = { 'progress' },
      },
      inactive_sections = {
        lualine_a = {},
        lualine_b = {},
        lualine_c = { { 'filename', path = 1 } },
        lualine_x = { { 'location', padding = 0 } },
        lualine_y = {},
        lualine_z = {},
      },
      tabline = {},
      extensions = { 'fugitive' },
    }
  end,
}
