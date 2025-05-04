return {
  'nvimtools/none-ls.nvim',
  config = function()
    local null_ls = require 'null-ls'

    -- Get the full path to your home directory
    local home = os.getenv 'HOME'

    -- Define the full paths to your PHP tools
    local phpcs_cmd = home .. '/.config/composer/vendor/bin/phpcs'
    local phpstan_cmd = home .. '/.config/composer/vendor/bin/phpstan'
    local phpcsfixer_cmd = home .. '/.config/composer/vendor/bin/php-cs-fixer'

    null_ls.setup {
      sources = {
        -- Existing tools
        null_ls.builtins.formatting.stylua,
        null_ls.builtins.formatting.prettier,
        null_ls.builtins.formatting.black,
        null_ls.builtins.formatting.isort,
        null_ls.builtins.formatting.csharpier,
        null_ls.builtins.diagnostics.phpstan,
        null_ls.builtins.formatting.pint,
        -- PHP tools with absolute paths
        null_ls.builtins.formatting.phpcsfixer.with {
          command = phpcsfixer_cmd,
          extra_args = { 'fix', '--no-interaction', '--quiet', '--standard=PSR12', '--ignore=PEAR.Commenting.FileComment' },
          env = { PHP_CS_FIXER_IGNORE_ENV = '1' },
        },

        null_ls.builtins.diagnostics.phpcs.with {
          command = phpcs_cmd,
        },

        null_ls.builtins.diagnostics.phpstan.with {
          command = phpstan_cmd,
        },
      },
    }

    -- Verify the executables exist (this will print in :messages)
    local function check_file_exists(file)
      local f = io.open(file, 'r')
      if f then
        io.close(f)
        return true
      else
        return false
      end
    end

    vim.api.nvim_create_autocmd('VimEnter', {
      callback = function()
        if check_file_exists(phpcs_cmd) then
          vim.api.nvim_echo({ { 'PHPCS executable found', 'Normal' } }, true, {})
        else
          vim.api.nvim_echo({ { 'PHPCS executable NOT found at: ' .. phpcs_cmd, 'ErrorMsg' } }, true, {})
        end
        -- Similar checks for other executables if needed
      end,
    })

    vim.keymap.set('n', '<leader>gn', vim.lsp.buf.format, {})
  end,
}
