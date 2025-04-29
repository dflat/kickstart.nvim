return {
  'akinsho/toggleterm.nvim',
  version = '*',
  opts = {
    --[[
    -- Add your configuration options here
    -- or leave empty to use the default settings
    --]]
    -- Example settings (customize these to your liking):
    size = 20,
    open_mapping = [[<c-\>]],
    hide_numbers = true, -- hide the number column in toggleterm buffers
    shade_filetypes = {},
    shade_terminals = true,
    shading_factor = 2, -- the degree by which to darken to terminal colour, default: 1 for dark backgrounds, 3 for light
    start_in_insert = true,
    insert_mappings = true, -- whether or not the open mapping applies in insert mode
    persist_size = true,
    direction = 'float', -- 'vertical' | 'horizontal' | 'window' | 'float'
    close_on_exit = true, -- close the terminal window when the process exits
    shell = vim.o.shell, -- change the default shell
    -- This field is only relevant if direction is set to 'float'
    float_opts = {
      border = 'curved', -- 'single' | 'double' | 'shadow' | 'curved' | ... other options supported by win open
      -- like `size`, width and height can be a number or function which is passed the current terminal
      width = function()
        return math.floor(vim.o.columns * 0.8)
      end,
      height = function()
        return math.floor(vim.o.lines * 0.8)
      end,
      winblend = 3,
      highlights = {
        border = 'Normal',
        background = 'Normal',
      },
    },
    -- Add executables on the config.lua as shown below
    -- this is required at the moment for the plugin to be able to create terminal commands
    -- executables listed will be available by default in all terminals
    -- execs = {
    --   { "gd", "lazygit", "<cmd>LazyGit<cr>", "LazyGit" },
    -- },
  },
  config = function(_, opts)
    require('toggleterm').setup(opts)

    -- Custom terminal commands
    local Terminal = require('toggleterm.terminal').Terminal

    -- Example: Lazygit terminal
    local lazygit = Terminal:new {
      cmd = 'lazygit',
      dir = 'git_dir',
      direction = 'float',
      float_opts = {
        border = 'double',
      },
      -- function to run on opening the terminal
      on_open = function(term)
        vim.cmd 'startinsert!'
        vim.api.nvim_buf_set_keymap(term.bufnr, 'n', 'q', '<cmd>close<CR>', { noremap = true, silent = true })
      end,
      -- function to run on closing the terminal
      on_close = function(term)
        vim.cmd 'startinsert!'
      end,
    }

    -- Toggle Lazygit with <leader>gg
    vim.keymap.set('n', '<leader>gg', function()
      lazygit:toggle()
    end, { desc = 'Toggle lazygit' })

    -- Custom terminal 2 (example)
    local htop = Terminal:new { cmd = 'htop', hidden = true }
    vim.keymap.set('n', '<leader>ht', function()
      htop:toggle()
    end, { desc = 'Toggle htop' })

    -- Custom terminal 3 (example)
    local python = Terminal:new { cmd = 'python', hidden = true }
    vim.keymap.set('n', '<leader>py', function()
      python:toggle()
    end, { desc = 'Toggle python' })
  end,
}
