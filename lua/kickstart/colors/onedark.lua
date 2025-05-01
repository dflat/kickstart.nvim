return {
  'navarasu/onedark.nvim',
  priority = 1000, -- make sure to load this before all the other start plugins
  config = function()
    require('onedark').setup {
      style = 'warmer',
      highlights = {
        ['@variable.parameter'] = { fg = '#e06c75' },
      },
    }
    -- require('onedark').load()
  end,
}
