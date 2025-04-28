return { -- You can easily change to a different colorscheme.
  'rebelot/kanagawa.nvim',
  -- name = 'kanagawa',
  priority = 1000, -- Make sure to load this before all the other start plugins.

  config = function()
    -- Default options:
    require('kanagawa').setup {
      compile = false, -- enable compiling the colorscheme
      undercurl = true, -- enable undercurls
      commentStyle = { italic = true },
      functionStyle = {},
      keywordStyle = { italic = true },
      statementStyle = { bold = true },
      typeStyle = {},
      transparent = false, -- do not set background color
      dimInactive = false, -- dim inactive window `:h hl-NormalNC`
      terminalColors = true, -- define vim.g.terminal_color_{0,17}
      colors = { -- add/modify theme and palette colors
        palette = {},
        theme = {
          wave = {},
          lotus = {},
          dragon = {},
          all = {
            ui = {
              bg_gutter = 'none',
            },
          },
        },
      },
      overrides = function(colors)
        -- print(vim.inspect(colors))
        --colors.theme.ui.bg_gutter = colors.palette.dragonBlack0
        return {}
      end,
      theme = 'dragon', -- Load "wave" theme
      background = { -- map the value of 'background' option to a theme
        dark = 'dragon', -- try "dragon" !
        light = 'lotus',
      },
    }
    -- setup must be called before loading
    -- vim.cmd 'colorscheme kanagawa'
  end,
}
