return {
  'nvim-treesitter/nvim-treesitter-context',
  dependencies = { 'nvim-treesitter/nvim-treesitter' }, -- Ensure treesitter is loaded first
  config = function()
    require('treesitter-context').setup {
      enable = true, -- Enable the plugin
      max_lines = 0, -- How many lines the window should span (0 means no limit)
      min_window_height = 0, -- Minimum editor window height to enable the plugin
      line_numbers = true,
      multiline_threshold = 20, -- Maximum number of lines to show for a single context
      trim_scope = 'outer', -- Which context lines to discard (outer/inner)
    }
  end,
}
