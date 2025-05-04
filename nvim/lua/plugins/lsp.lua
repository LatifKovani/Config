return {
  {
    'williamboman/mason.nvim',
    config = function()
      require('mason').setup()
    end,
  },
  {
    'williamboman/mason-lspconfig.nvim',
    config = function()
      require('mason-lspconfig').setup {
        ensure_installed = {
          'lua_ls',
          'ts_ls',
          'html',
          'emmet_ls',
          'gopls',
          'jdtls',
          'eslint',
          'omnisharp',
          'pyright',
        },
      }
    end,
  },
  {
    'neovim/nvim-lspconfig',
    config = function()
      local capabilities = require('cmp_nvim_lsp').default_capabilities()
      local lspconfig = require 'lspconfig'
      lspconfig.lua_ls.setup {
        capabilities = capabilities,
      }
      lspconfig.ts_ls.setup {
        capabilities = capabilities,
      }
      lspconfig.omnisharp.setup {
        capabilities = capabilities,
        cmd = { 'dotnet', '/home/latif/.local/share/nvim/mason/packages/omnisharp/libexec/OmniSharp.dll' },
        filetypes = { 'cs' },
      }
      lspconfig.eslint.setup {
        settings = {
          packageManager = 'npm',
        },
        on_attach = function(client, bufnr)
          vim.api.nvim_create_autocmd('BufWritePre', {
            buffer = bufnr,
            command = 'EslintFixAll',
          })
        end,
      }
      lspconfig.jdtls.setup {
        capabilities = capabilities,
      }
      lspconfig.html.setup {
        capabilities = capabilities,
      }
      lspconfig.emmet_ls.setup {
        capabilities = capabilities,
      }
      lspconfig.pyright.setup {
        capabilities = capabilities,
        filetypes = { 'python' },
      }
      lspconfig.gopls.setup {
        capabilities = capabilities,
        filetypes = { 'go', 'gomod', 'gowork', 'gotmpl' },
        settings = {
          gopls = {
            completeUnimported = true,
            usePlaceholders = true,
            analyses = {
              unusedparams = true,
            },
          },
        },
      }
      lspconfig.jedi_language_server.setup {
        capabilities = capabilities,
      }

      local isLspDiagnosticsVisible = true
      vim.keymap.set('n', '<leader>lx', function()
        isLspDiagnosticsVisible = not isLspDiagnosticsVisible
        vim.diagnostic.config {
          virtual_text = isLspDiagnosticsVisible,
          underline = isLspDiagnosticsVisible,
        }
      end)

      vim.keymap.set('n', 'K', vim.lsp.buf.hover, {})
      vim.keymap.set('n', 'gd', vim.lsp.buf.definition, {})
      vim.keymap.set({ 'n', 'v' }, '<leader>ca', vim.lsp.buf.code_action, {})
    end,
  },
}
