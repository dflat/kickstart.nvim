--[[
    to get help:
      :help lua-guide
      <space>sh to search the help documentation
      :checkhealth
--]]

vim.g.mapleader = ' '
vim.g.maplocalleader = ' '
vim.g.have_nerd_font = true

require 'core.options'
require 'core.keymaps'
require 'core.autocmds'

require 'utils.lazy' -- use lazy package manager

-- [[ Configure and install plugins ]]
--
--  To check the current status of all plugins
--    :Lazy
--
--  Press `?` in this menu for help.
--
--  To update plugins
--    :Lazy update
--
require('lazy').setup({
  -- may trigger load on autocommands events (`:help autocmd-events`).

  -- Then, because we use the `opts` key (recommended), the configuration runs
  -- after the plugin has been loaded as `require(MODULE).setup(opts)`.

  -- NOTE: Plugins can specify dependencies.
  --
  -- The dependencies are proper plugin specifications as well - anything
  -- you do for a plugin at the top level, you can do for a dependency.
  --
  -- Use the `dependencies` key to specify the dependencies of a particular plugin

  'tpope/vim-sleuth', -- Detect tabstop and shiftwidth automatically
  'tpope/vim-repeat', -- Add `.` support to more motions

  ---- Search utils
  require 'kickstart.plugins.which-key', -- Useful plugin to show you pending keybinds.
  require 'kickstart.plugins.telescope', -- Fuzzy finder

  ---- LSP Plugins
  require 'kickstart.plugins.lazydev', -- Configures Lua LSP for Neovim config, runtime and plugins
  require 'kickstart.plugins.lsp-config', -- Main LSP Configuration

  ---- Syntax highlighting, formatting, etc.
  require 'kickstart.plugins.conform', -- Autoformat
  require 'kickstart.plugins.blink', -- Autocomplete
  require 'kickstart.plugins.todo-comments', -- Highlight todo, notes, etc in comments
  require 'kickstart.plugins.mini', -- Collection of small utils: text objects, surround, status line, etc.
  require 'kickstart.plugins.treesitter', -- Highlight edit, and navigate code
  require 'kickstart.plugins.treesitter-textobjects', -- keep e.g. function signature at top of buffer
  require 'kickstart.plugins.treesitter-context', -- keep e.g. function signature at top of buffer
  require 'kickstart.plugins.indent_line', -- Visual indentation (vertical lines)

  -- require 'kickstart.plugins.debug',
  -- require 'kickstart.plugins.lint',
  require 'kickstart.plugins.autopairs',

  ---- Git integration
  require 'kickstart.plugins.gitsigns', -- Adds gitsigns recommend keymaps

  require 'kickstart.plugins.neo-tree', -- File explorer

  ---- Colorschemes
  require 'kickstart.colors.tokyonight', -- good color support for many plugins
  require 'kickstart.colors.catppuccin', -- good color support for many plugins
  require 'kickstart.colors.kanagawa', -- good color support for many plugins
  require 'kickstart.colors.everforest', -- good color support for many plugins
  require 'kickstart.colors.onedark', -- good color support for many plugins

  require 'custom.plugins', -- load plugins not included in kickstart config

  -- For additional information with loading, sourcing and examples see `:help lazy.nvim-🔌-plugin-spec`
  -- Or use telescope!
  -- In normal mode type `<space>sh` then write `lazy.nvim-plugin`
  -- you can continue same window with `<space>sr` which resumes last telescope search
}, {
  ui = {
    -- If you are using a Nerd Font: set icons to an empty table which will use the
    -- default lazy.nvim defined Nerd Font icons, otherwise define a unicode icons table
    icons = vim.g.have_nerd_font and {} or {},
  },
})

require 'utils.blackd_launcher' -- python formatter daemon
require 'utils.hot_reload' -- hot reloading of require'd modules via :R(mod-name)

require('onedark').load()
