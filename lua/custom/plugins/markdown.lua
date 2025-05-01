return {
  {
    'tadmccorkle/markdown.nvim',
    ft = 'markdown', -- Lazy-load for Markdown files only
    dependencies = { 'nvim-treesitter/nvim-treesitter' },
    config = function()
      require('markdown').setup {
        mappings = {
          inline_surround_toggle = 'gs', -- Toggle bold/italic/code
          inline_surround_delete = 'ds', -- Delete surrounding markup
          inline_surround_change = 'cs', -- Change surrounding markup
          link_add = 'gl', -- Add link
          link_follow = 'gx', -- Follow link
          go_curr_heading = ']c', -- Go to current heading
          go_parent_heading = ']p', -- Go to parent heading
          go_next_heading = ']]', -- Go to next heading
          go_prev_heading = '[[', -- Go to previous heading
        },
        inline_surround = {
          emphasis = { key = 'i', txt = '*' }, -- *italic*
          strong = { key = 'b', txt = '**' }, -- **bold**
          code = { key = 'c', txt = '`' }, -- `code`
        },
        toc = {
          omit = { 'Omit me' }, -- Skip headings with this text
          list_marker = '-', -- Use - for TOC lists
        },
      }
    end,
    keys = {
      { '<leader>mt', '<cmd>MDInsertToc<cr>', desc = 'Insert Table of Contents', ft = 'markdown' },
      { '<leader>mv', '<cmd>MDToc<cr>', desc = 'View Table of Contents', ft = 'markdown' },
    },
  },
}
