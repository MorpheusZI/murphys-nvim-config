return {
  'rafi/awesome-vim-colorschemes',
  priority = 1000,
  lazy = false,
  init = function()
    local function set_time_based_colorscheme()
      local current_hour = tonumber(os.date '%H')

      if current_hour >= 20 then -- 8pm (20:00) or later
        vim.cmd [[colorscheme alduin]]
      else
        vim.cmd [[colorscheme onedark]]
      end
    end

    set_time_based_colorscheme()

    vim.api.nvim_create_autocmd('CursorHold', {
      callback = function()
        set_time_based_colorscheme()
      end,
    })
  end,
}
