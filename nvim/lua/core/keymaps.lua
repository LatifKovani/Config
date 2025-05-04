-- Set leader key
vim.g.mapleader = ' '
vim.g.maplocalleader = ' '

vim.keymap.set({'n', 'v'}, '<space>', '<Nop>', { silent = true })  -- Fixed: Added missing quote after <Nop>
local opts = { noremap = true, silent = true }  -- Fixed: Changed 'no remap' to 'noremap'


--Save Files--
vim.api.nvim_set_keymap('v', '<C-c>', '"+y', { noremap = true })
vim.api.nvim_set_keymap('i', '<C-v>', '<C-r>+', { noremap = true })
vim.api.nvim_set_keymap('n', '<C-v>', '"+p', { noremap = true })
vim.keymap.set('n', '<C-s>', '<cmd>w<CR>', opts)

--Save Files without auto formatting--
vim.keymap.set('n', '<leader>sn', '<cmd>noautocmd w<CR>', opts)

--Quit Files--
vim.keymap.set('n', '<C-q>', '<cmd>q<CR>', opts)

--Delete single character without copying into register(memory)--
vim.keymap.set('n', 'x', '"_x', opts)

--Find and center--
vim.keymap.set('n', 'n', 'nzzzv', opts)  -- Added opts for consistency
vim.keymap.set('n', 'N', 'Nzzzv', opts)  -- Added opts for consistency

--Navigate with tab between files---
vim.keymap.set('n', '<Tab>', '<cmd>bnext<CR>', opts)
vim.keymap.set('n', '<S-Tab>', '<cmd>bprevious<CR>', opts)
vim.keymap.set('n', '<leader>x', '<cmd>Bdelete!<CR>', opts)   -- close buffer
vim.keymap.set('n', '<leader>b', '<cmd>enew<CR>', opts) -- new buffer

--Window Management--
vim.keymap.set('n', '<leader>v', '<C-w>v', opts)      -- split window vertically
vim.keymap.set('n', '<leader>h', '<C-w>s', opts)      -- split window horizontally
vim.keymap.set('n', '<leader>se', '<C-w>=', opts)     -- make split windows equal width & height
vim.keymap.set('n', '<leader>xs', '<cmd>close<CR>', opts) -- close current split window

--Navigate between splits--
vim.keymap.set('n', '<C-k>', '<cmd>wincmd k<CR>', opts)
vim.keymap.set('n', '<C-j>', '<cmd>wincmd j<CR>', opts)
vim.keymap.set('n', '<C-h>', '<cmd>wincmd h<CR>', opts)
vim.keymap.set('n', '<C-l>', '<cmd>wincmd l<CR>', opts)

-- Tabs
vim.keymap.set('n', '<leader>to', '<cmd>tabnew<CR>', opts)   -- open new tab
vim.keymap.set('n', '<leader>tx', '<cmd>tabclose<CR>', opts) -- close current tab
vim.keymap.set('n', '<leader>tn', '<cmd>tabn<CR>', opts)     -- go to next tab
vim.keymap.set('n', '<leader>tp', '<cmd>tabp<CR>', opts)     -- go to previous tab

-- Press jk fast to exit insert mode
vim.keymap.set('i', 'jk', '<ESC>', opts)
vim.keymap.set('i', 'kj', '<ESC>', opts)

-- Stay in indent mode
vim.keymap.set('v', '<', '<gv', opts)
vim.keymap.set('v', '>', '>gv', opts)

-- Keep last yanked when pasting
vim.keymap.set('v', 'p', '"_dP', opts)

-- Diagnostic keymaps
vim.keymap.set('n', '[d', vim.diagnostic.goto_prev, { desc = 'Go to previous diagnostic message' })
vim.keymap.set('n', ']d', vim.diagnostic.goto_next, { desc = 'Go to next diagnostic message' })
vim.keymap.set('n', '<leader>d', vim.diagnostic.open_float, { desc = 'Open floating diagnostic message' })
vim.keymap.set('n', '<leader>q', vim.diagnostic.setloclist, { desc = 'Open diagnostics list' })
