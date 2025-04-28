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

require 'utils.blackd_launcher'

-- [[ Install `lazy.nvim` plugin manager ]]
--    See `:help lazy.nvim.txt` or https://github.com/folke/lazy.nvim for more info
local lazypath = vim.fn.stdpath 'data' .. '/lazy/lazy.nvim'
if not (vim.uv or vim.loop).fs_stat(lazypath) then
  local lazyrepo = 'https://github.com/folke/lazy.nvim.git'
  local out = vim.fn.system { 'git', 'clone', '--filter=blob:none', '--branch=stable', lazyrepo, lazypath }
  if vim.v.shell_error ~= 0 then
    error('Error cloning lazy.nvim:\n' .. out)
  end
end ---@diagnostic disable-next-line: undefined-field
vim.opt.rtp:prepend(lazypath)

-- [[ Configure and install plugins ]]
--
--  To check the current status of your plugins, run
--    :Lazy
--
--  You can press `?` in this menu for help.
--
--  To update plugins you can run
--    :Lazy update
--
require('lazy').setup({
  -- NOTE: Plugins can be added with a link (or for a github repo: 'owner/repo' link).
  -- NOTE: Plugins can also be configured to run Lua code when they are loaded.
  --
  -- This is often very useful to both group configuration, as well as handle
  -- lazy loading plugins that don't need to be loaded immediately at startup.
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

  require 'custom.plugins.goyo',
  require 'custom.plugins.vim-markdown',

  -- NOTE: The import below can automatically add your own plugins, configuration, etc from `lua/custom/plugins/*.lua`
  -- { import = 'custom.plugins' },
  --
  -- For additional information with loading, sourcing and examples see `:help lazy.nvim-🔌-plugin-spec`
  -- Or use telescope!
  -- In normal mode type `<space>sh` then write `lazy.nvim-plugin`
  -- you can continue same window with `<space>sr` which resumes last telescope search
}, {
  ui = {
    -- If you are using a Nerd Font: set icons to an empty table which will use the
    -- default lazy.nvim defined Nerd Font icons, otherwise define a unicode icons table
    icons = vim.g.have_nerd_font and {} or {
      cmd = '⌘',
      config = '🛠',
      event = '📅',
      ft = '📂',
      init = '⚙',
      keys = '🗝',
      plugin = '🔌',
      runtime = '💻',
      require = '🌙',
      source = '📄',
      start = '🚀',
      task = '📌',
      lazy = '💤 ',
    },
  },
})

vim.cmd 'colorscheme everforest'
-- The line beneath this is called `modeline`. See `:help modeline`
-- vim: ts=2 sts=2 sw=2 et
