-- suda.lua - Write/Read files as root
-- https://github.com/lambdalisue/suda.vim

vim.pack.add { 'https://github.com/lambdalisue/suda.vim' }

-- Configure suda.vim
-- Enable smart edit: automatically use suda when opening a file without permissions
vim.g.suda_smart_edit = 1

-- Keymaps
vim.keymap.set('n', '<leader>xw', '<cmd>SudaWrite<CR>', { desc = 'Sudo [W]rite' })
vim.keymap.set('n', '<leader>xr', '<cmd>SudaRead<CR>', { desc = 'Sudo [R]ead' })

-- Register group with which-key if available
pcall(function()
  require('which-key').add {
    { '<leader>x', group = 'Sudo / Privileged' },
  }
end)
