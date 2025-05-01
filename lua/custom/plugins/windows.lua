return {
  {
    'anuvyklack/windows.nvim',
    dependencies = {
      'anuvyklack/middleclass',
      { 'anuvyklack/animation.nvim', enabled = false }, -- Optional: disable animations if not needed
    },
    event = 'VeryLazy', -- Lazy-load after most plugins
    config = function()
      vim.o.winwidth = 10
      vim.o.winminwidth = 10
      vim.o.equalalways = false
      require('windows').setup {
        autowidth = {
          enable = true,
          winwidth = 10,
          winminwidth = 10,
        },
        animation = {
          enable = false,
          duration = 150, -- Adjust for smoother/faster animations
          fps = 60,
        },
      }
    end,
    keys = {
      { '<leader>wm', '<cmd>WindowsMaximize<cr>', desc = 'Maximize Window' },
      { '<leader>wv', '<cmd>WindowsMaximizeVertically<cr>', desc = 'Maximize Vertically' },
    },
  },
}
