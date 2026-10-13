-- tiny-term.lua - Minimal floating/split terminal manager
-- https://github.com/jellydn/tiny-term.nvim

vim.pack.add { 'https://github.com/jellydn/tiny-term.nvim' }

local tiny_term = require 'tiny-term'

tiny_term.setup {
  win = {
    width = 0.8,
    height = 0.8,
    split_size = 15,
  },
}

local toggle_float = function()
  tiny_term.toggle(nil, { win = { position = 'float' } })
end

local toggle_split = function()
  tiny_term.toggle(nil, { win = { position = 'right', split_size = 15 } })
end

local toggle_lazygit = function()
  tiny_term.toggle('lazygit', { win = { position = 'float' } })
end

-- Keymaps under <leader>t
vim.keymap.set('n', '<leader>tt', toggle_float, { desc = '[T]oggle floating [t]erminal' })
vim.keymap.set('n', '<leader>ts', toggle_split, { desc = '[T]oggle [s]plit terminal' })
vim.keymap.set('n', '<leader>tg', toggle_lazygit, { desc = '[T]oggle lazy[g]it terminal' })

-- Quick toggle from both normal and terminal mode (<C-/> and <C-_>)
vim.keymap.set({ 'n', 't' }, '<C-/>', toggle_float, { desc = 'Toggle floating terminal' })
vim.keymap.set({ 'n', 't' }, '<C-_>', toggle_float, { desc = 'Toggle floating terminal' })

-- Register with which-key if available
local ok, wk = pcall(require, 'which-key')
if ok then
  wk.add {
    { '<leader>t', group = '[T]oggle / [T]erminal' },
    { '<leader>tt', desc = '[T]oggle floating [t]erminal' },
    { '<leader>ts', desc = '[T]oggle [s]plit terminal' },
    { '<leader>tg', desc = '[T]oggle lazy[g]it terminal' },
  }
end
