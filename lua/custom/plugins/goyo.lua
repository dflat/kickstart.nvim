return {
  'junegunn/goyo.vim',
  lazy = false, -- Load immediately (or set to `true` if lazy-loading)
  init = function()
    -- Store the original colorscheme to restore later
    vim.g.original_colorscheme = vim.g.colors_name or 'default'

    -- Toggle Goyo with custom colorscheme
    vim.cmd [[
      function! s:goyo_enter()
        set noshowmode
        set noshowcmd
        set scrolloff=999
        "colorscheme habamax
      endfunction

      function! s:goyo_leave()
        set showmode
        set showcmd
        set scrolloff=5
        "silent! colorscheme ${g:original_colorscheme}
      endfunction

      autocmd! User GoyoEnter nested call <SID>goyo_enter()
      autocmd! User GoyoLeave nested call <SID>goyo_leave()
    ]]

    -- Auto-enable Goyo for markdown files
    -- vim.api.nvim_create_autocmd('BufWinEnter', {
    --   pattern = '*.md',
    --   callback = function()
    --     print 'Goyo entered'
    --     vim.g.goyo_width = 40
    --     vim.cmd 'Goyo'
    --   end,
    -- })
  end,
  keys = {
    -- Optional: Manual toggle keybinding
    { '<leader>gy', '<cmd>Goyo<cr>', desc = 'Toggle Goyo' },
  },
}
