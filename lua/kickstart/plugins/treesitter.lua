-- plugins/treesitter.lua

return {
  'nvim-treesitter/nvim-treesitter',
  build = ':TSUpdate',
  event = { 'BufReadPost', 'BufNewFile' }, -- lazy-load treesitter
  dependencies = {
    'nvim-treesitter/nvim-treesitter-textobjects',
  },
  config = function()
    require('nvim-treesitter.configs').setup {
      ensure_installed = {
        'lua',
        'python',
        'cpp',
        'c',
        'javascript',
        'html',
        'css',
        'bash',
        'markdown',
        -- add more languages here
      },
      highlight = {
        enable = true,
        additional_vim_regex_highlighting = false,
      },
      indent = {
        enable = true,
      },
      incremental_selection = {
        enable = true,
        keymaps = {
          init_selection = 'gjf',
          node_incremental = 'gjj',
          node_decremental = 'gjk',
          scope_incremental = 'gjl',
        },
      },
      textobjects = {
        select = {
          enable = true,
          lookahead = true,
          keymaps = {
            ['af'] = '@function.outer',
            ['if'] = '@function.inner',
            ['ac'] = '@class.outer',
            ['ic'] = '@class.inner',
            ['ap'] = '@parameter.outer',
            ['ip'] = '@parameter.inner',
          },
          selection_modes = {
            ['@parameter.outer'] = 'v', -- characterwise
            ['@function.outer'] = 'V', -- linewise
            ['@class.outer'] = '<c-v>', -- blockwise
          },
          include_surrounding_whitespace = true,
        },
        move = {
          enable = true,
          set_jumps = true,
          goto_next_start = {
            [']p'] = '@parameter.inner',
            ['<leader>a'] = '@parameter.inner',
            [']m'] = '@function.outer',
            [']]'] = '@class.outer',
          },
          goto_next_end = {
            [']e'] = '@parameter.outer',
            [']M'] = '@function.outer',
            [']['] = '@class.outer',
          },
          goto_previous_start = {
            ['[p'] = '@parameter.inner',
            ['[m'] = '@function.outer',
            ['[['] = '@class.outer',
          },
          goto_previous_end = {
            ['[e'] = '@parameter.outer',
            ['[M'] = '@function.outer',
            ['[]'] = '@class.outer',
          },
        },
        swap = {
          enable = true,
          swap_next = {
            ['<leader>A'] = '@parameter.inner',
          },
          swap_previous = {},
        },
        -- optionally add lsp_interop later
        -- lsp_interop = {
        --   enable = true,
        --   border = "none",
        --   peek_definition_code = {
        --     ["<leader>df"] = "@function.outer",
        --     ["<leader>dc"] = "@class.outer",
        --   },
        -- },
      },
    }
  end,
}
