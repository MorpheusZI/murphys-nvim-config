return {
  'akinsho/bufferline.nvim',
  dependencies = { 'nvim-tree/nvim-web-devicons' },
  version = '*',
  opts = {
    options = {
      offsets = {
        {
          filetype = 'neo-tree',
          text = 'File Explorer',
          highlight = 'Directory',
          seperator = true,
        },
      },
      mode = 'buffers',
      separator_style = 'slant',
    },
  },
}
