return { -- Autoformat
  'stevearc/conform.nvim',
  event = { 'BufWritePre' },
  cmd = { 'ConformInfo' },
  keys = {
    {
      '<leader>f',
      function()
        require('conform').format { async = true, lsp_format = 'fallback' }
      end,
      mode = '',
      desc = '[F]ormat buffer',
    },
  },
  opts = {
    notify_on_error = true,
    log_level = vim.log.levels.DEBUG,
    format_on_save = function(bufnr)
      -- Disable "format_on_save lsp_fallback" for languages that don't
      -- have a well standardized coding style. You can add additional
      -- languages here or re-enable it for the disabled ones.
      local disable_filetypes = { c = true, cpp = true }
      if disable_filetypes[vim.bo[bufnr].filetype] then
        return nil
      else
        return {
          timeout_ms = 500,
          lsp_format = 'fallback',
        }
      end
    end,
    formatters = {
      blackd = {
        command = vim.fn.expand '~/.local/share/nvim/mason/bin/blackd-client',
        args = {}, -- Optional: --fast skips some checks for speed
        stdin = true,
      },
      isort = { -- Optional: include if you use isort
        command = vim.fn.expand '~/.local/share/nvim/mason/packages/isort/venv/bin/isort',
        args = { '--stdout', '--filename', '$FILENAME', '-' },
        stdin = true,
      },
      beautysh = {
        timeout_ms = 1000, -- give beautysh more time
      },
    },
    formatters_by_ft = {
      lua = { 'stylua' },
      -- Conform can also run multiple formatters sequentially
      python = { 'blackd' }, -- {'isort', 'black' },
      --
      -- You can use 'stop_after_first' to run the first available formatter from the list
      javascript = { 'prettierd', 'prettier', stop_after_first = true },
      sh = { 'beautysh' },
    },
  },
}
