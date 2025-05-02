return {
  {
    'jedrzejboczar/possession.nvim',
    dependencies = { 'nvim-lua/plenary.nvim', 'nvim-telescope/telescope.nvim' },
    event = 'BufReadPost', -- Load when entering a buffer
    config = function()
      require('possession').setup {
        session_dir = vim.fn.stdpath 'data' .. '/possession',
        silent = false,
        load_silent = true,
        autosave = {
          current = true, -- Autosave current session
          cwd = true, -- Autosave per working directory
          on_load = true,
          on_quit = true,
        },
        telescope = {
          list = {
            default_action = 'load',
            mappings = {
              delete = { n = 'd', i = '<C-d>' },
            },
          },
        },
        plugins = {
          nvim_tree = true, -- Support for nvim-tree
          neo_tree = true, -- Support for neo-tree
          delete_hidden_buffers = { hooks = { 'before_save', 'before_load' } },
        },
      }
      -- Load Telescope extension
      require('telescope').load_extension 'possession'
    end,
    keys = {
      { '<leader>ws', '<cmd>PossessionSave<cr>', desc = 'Save Session' },
      { '<leader>wp', ':Telescope possession list<cr>', desc = 'List Sessions' },
      { '<leader>wd', '<cmd>PossessionDelete<cr>', desc = 'Delete Session' },
    },
  },
}
