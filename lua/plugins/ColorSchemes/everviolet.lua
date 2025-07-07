return {
  'everviolet/nvim',
  name = 'evergarden',
  priority = 1000, -- Colorscheme plugin is loaded first before any other plugins
  opts = {
    theme = {
      variant = 'fall', -- 'winter'|'fall'|'spring'|'summer'
      accent = 'orange',
    },
    editor = {
      transparent_background = false,
      sign = { color = 'mantle' },
      float = {
        color = 'red',
        invert_border = false,
      },
      completion = {
        color = 'surface3',
      },
    },
  },
}
