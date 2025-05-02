local splashes = {
  {
    [[                                                         ]],
    [[                                  _/                     ]],
    [[   _/_/_/        _/      _/              _/_/_/  _/_/    ]],
    [[  _/    _/      _/      _/      _/      _/    _/    _/   ]],
    [[ _/    _/        _/  _/        _/      _/    _/    _/    ]],
    [[_/    _/          _/          _/      _/    _/    _/     ]],
    [[                                                         ]],
    [[                                                         ]],
  },
  {
    [[▗▖  ▗▖    ▗▖  ▗▖    ▗▄▄▄▖    ▗▖  ▗▖]],
    [[▐▛▚▖▐▌    ▐▌  ▐▌      █      ▐▛▚▞▜▌]],
    [[▐▌ ▝▜▌    ▐▌  ▐▌      █      ▐▌  ▐▌]],
    [[▐▌  ▐▌     ▝▚▞▘     ▗▄█▄▖    ▐▌  ▐▌]],
    [[                                   ]],
    [[                                   ]],
    [[                                   ]],
  },
  {
    [[___________________________________________________________________________________________        ]],
    [[ ___________________________________________________________________________________________       ]],
    [[  ______________________________________________________/\\\_________________________________      ]],
    [[   __/\\/\\\\\\________________/\\\____/\\\_____________\///_________________/\\\\\__/\\\\\___     ]],
    [[    _\/\\\////\\\______________\//\\\__/\\\_______________/\\\______________/\\\///\\\\\///\\\_    ]],
    [[     _\/\\\__\//\\\______________\//\\\/\\\_______________\/\\\_____________\/\\\_\//\\\__\/\\\_   ]],
    [[      _\/\\\___\/\\\_______________\//\\\\\________________\/\\\_____________\/\\\__\/\\\__\/\\\_  ]],
    [[       _\/\\\___\/\\\________________\//\\\_________________\/\\\_____________\/\\\__\/\\\__\/\\\_ ]],
    [[        _\///____\///__________________\///__________________\///______________\///___\///___\///__]],
  },
  {
    [[__________________________________________________________________________________________]],
    [[__________________________________________________________________________________________]],
    [[__________________________________________________/\\\____________________________________]],
    [[_____/\\/\\\\\\_____________/\\\____/\\\__________\///______________/\\\\\__/\\\\\________]],
    [[_____\/\\\////\\\___________\//\\\__/\\\____________/\\\___________/\\\///\\\\\///\\\_____]],
    [[______\/\\\__\//\\\___________\//\\\/\\\____________\/\\\__________\/\\\_\//\\\__\/\\\____]],
    [[_______\/\\\___\/\\\____________\//\\\\\_____________\/\\\__________\/\\\__\/\\\__\/\\\___]],
    [[________\/\\\___\/\\\_____________\//\\\______________\/\\\__________\/\\\__\/\\\__\/\\\__]],
    [[_________\///____\///_______________\///_______________\///___________\///___\///___\///__]],
  },
}

return {
  {
    'goolord/alpha-nvim',
    event = 'VimEnter', -- Load when Neovim starts
    dependencies = { 'nvim-tree/nvim-web-devicons' }, -- Optional: for file icons
    config = function()
      local alpha = require 'alpha'
      local dashboard = require 'alpha.themes.dashboard'

      -- Header (ASCII art or custom text)
      dashboard.section.header.val = splashes[1]
      dashboard.section.header.opts = {
        position = 'center',
      }

      -- Buttons for quick actions
      dashboard.section.buttons.val = {
        dashboard.button('n', '  New file', ':ene <BAR> startinsert <CR>'),
        dashboard.button('f', '  Find file', ':Telescope find_files<CR>'),
        dashboard.button('r', '  Recent files', ':Telescope oldfiles<CR>'),
        dashboard.button('s', '  Restore session', ':Telescope possession list<CR>'),
        dashboard.button('c', '  Config', ':e $MYVIMRC<CR>'),
        dashboard.button('q', '  Quit', ':qa<CR>'),
      }
      dashboard.section.buttons.opts = {
        spacing = 1,
        hl_shortcut = 'Keyword', -- Highlight group for shortcuts
      }

      -- Footer (Neovim version or custom text)
      local function footer()
        local version = vim.version()
        return string.format('Neovim v%d.%d.%d', version.major, version.minor, version.patch)
      end
      dashboard.section.footer.val = footer()
      dashboard.section.footer.opts = {
        position = 'center',
        hl = 'Comment', -- Highlight group for footer
      }

      -- Layout configuration
      dashboard.config.layout = {
        { type = 'padding', val = 4 }, -- Padding above header
        dashboard.section.header,
        { type = 'padding', val = 2 }, -- Padding between header and buttons
        dashboard.section.buttons,
        { type = 'padding', val = 2 }, -- Padding between buttons and footer
        dashboard.section.footer,
      }

      -- Setup alpha with the dashboard theme
      alpha.setup(dashboard.config)

      -- Optional: Disable cursorline and cursorcolumn on Alpha buffer
      vim.api.nvim_create_autocmd('User', {
        pattern = 'AlphaReady',
        callback = function()
          vim.opt_local.cursorline = false
          vim.opt_local.cursorcolumn = false
        end,
      })
    end,
  },
}

-- return {
--   'goolord/alpha-nvim',
--   config = function()
--     require('alpha').setup(require('alpha.themes.dashboard').config)
--   end,
-- }
