return {
  'rafi/awesome-vim-colorschemes',
  priority = 1000,
  lazy = false,
  init = function()
    vim.cmd [[colorscheme gotham]]
  end,
}
