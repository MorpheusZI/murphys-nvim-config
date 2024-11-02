return {
  'ray-x/lsp_signature.nvim',
  event = 'VeryLazy',
  opts = {},
  config = function()
    require('lsp_signature').setup {
      bind = true,
      border = 'rounded',
    }
  end,
}
