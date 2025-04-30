-- plugins/treesitter.lua

return {
  'nvim-treesitter/nvim-treesitter',
  build = ':TSUpdate',
  event = { 'BufReadPost', 'BufNewFile' }, -- lazy-load treesitter
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
    }
  end,
}
