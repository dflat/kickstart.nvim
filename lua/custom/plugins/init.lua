-- You can add your own plugins here or in other files in this directory!
--  I promise not to create any merge conflicts in this directory :)
--
-- See the kickstart.nvim README for more information
return {
  require 'custom.plugins.goyo', -- focus mode for reading text
  require 'custom.plugins.markdown', -- mardown rendering

  require 'custom.plugins.toggleterm', -- embedded terminal in nvim
  require 'custom.plugins.leap', -- sneak.vim replacement

  require 'custom.plugins.surround', -- vim-surround replacement

  require 'custom.plugins.windows', -- window manager
}
