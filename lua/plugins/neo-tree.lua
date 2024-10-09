-- Neo-tree is a Neovim plugin to browse the file system
-- https://github.com/nvim-neo-tree/neo-tree.nvim

return {
  'nvim-neo-tree/neo-tree.nvim',
  version = '*',
  dependencies = {
    'nvim-lua/plenary.nvim',
    'nvim-tree/nvim-web-devicons', -- not strictly required, but recommended
    'MunifTanjim/nui.nvim',
  },
  cmd = 'Neotree',
  keys = {
    { '<leader>e', ':Neotree reveal<CR>', desc = 'NeoTree reveal', silent = true },
  },
  opts = {
    event_handlers = {
      {
        event = 'file_open_requested',
        handler = function()
          require('neo-tree.command').execute { action = 'close' }
        end,
      },
    },
    filesystem = {
      follow_current_file = { enabled = true },
      use_libuv_file_watcher = true,
      window = {
        width = 25,
        mappings = {
          ['P'] = { 'toggle_preview', config = { use_float = false, use_image_nvim = true } },
          ['<leader>ec'] = 'close_window',
        },
      },
    },
    buffers = {
      follow_current_file = {
        enabled = true,
      },
    },
  },
}
