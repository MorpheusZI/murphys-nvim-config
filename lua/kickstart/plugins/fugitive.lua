-- fugitive.lua - Vim wrapper for Git
-- https://github.com/tpope/vim-fugitive

vim.pack.add { 'https://github.com/tpope/vim-fugitive' }

-- Set up fugitive keymaps under <leader>g
vim.keymap.set('n', '<leader>gs', '<cmd>Git<CR>', { desc = 'Git [s]tatus' })
vim.keymap.set('n', '<leader>gc', '<cmd>Git commit<CR>', { desc = 'Git [c]ommit' })
vim.keymap.set('n', '<leader>gp', '<cmd>Git push<CR>', { desc = 'Git [p]ush' })
vim.keymap.set('n', '<leader>gl', '<cmd>Git pull<CR>', { desc = 'Git pu[l]l' })
vim.keymap.set('n', '<leader>gd', '<cmd>Gdiffsplit<CR>', { desc = 'Git [d]iff split' })
vim.keymap.set('n', '<leader>go', '<cmd>Git log<CR>', { desc = 'Git l[o]g' })
