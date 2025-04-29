return {
  'ggandor/leap.nvim',
  dependencies = { 'tpope/vim-repeat' }, -- This tells lazy.nvim to automatically install vim-repeat
  config = function()
    local leap = require 'leap'

    -- Basic configuration
    leap.setup {
      -- Highlight labels with uppercase letters for better visibility
      safe_labels = {},

      -- You can add other leap.nvim options here:
      -- max_phase_one_targets = 10,
      -- highlight_unlabeled_phase_one_targets = false,
    }

    -- Add default keymaps (s for forward, S for backward search)
    -- leap.add_default_mappings()
    -- leap.set_default_mappings()
    vim.keymap.set({ 'n', 'x', 'o' }, 'ys', '<Plug>(leap)', { desc = 'leap to digraph in window' })
    vim.keymap.set('n', 'yS', '<Plug>(leap-from-window)')

    -- Custom highlight groups (optional)
    vim.api.nvim_set_hl(0, 'LeapMatch', { fg = 'white', bold = true, nocombine = true })
    vim.api.nvim_set_hl(0, 'LeapLabelPrimary', { fg = 'red', bold = true, nocombine = true })
    vim.api.nvim_set_hl(0, 'LeapLabelSecondary', { fg = 'blue', bold = true, nocombine = true })
  end,
}
