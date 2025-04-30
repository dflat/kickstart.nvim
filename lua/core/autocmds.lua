-- [[ Basic Autocommands ]]
--  See `:help lua-guide-autocommands`

-- Highlight when yanking (copying) text
--  See `:help vim.highlight.on_yank()`
vim.api.nvim_create_autocmd('TextYankPost', {
  desc = 'Highlight when yanking (copying) text',
  group = vim.api.nvim_create_augroup('kickstart-highlight-yank', { clear = true }),
  callback = function()
    vim.highlight.on_yank()
  end,
})

-- Notify line count on buffer enter
vim.api.nvim_create_autocmd('BufWinEnter', {
  pattern = '*',
  callback = function(args)
    local buftype = vim.bo[args.buf].buftype

    -- Skip special buffers except help buffers
    if buftype ~= '' and buftype ~= 'help' then
      return
    end

    -- Don't show for empty buffers (<= 1 line accounts for empty buffer with newline)
    local line_count = vim.api.nvim_buf_line_count(args.buf)
    if line_count <= 1 then
      return
    end

    -- Format the message
    local filename = vim.fn.fnamemodify(vim.api.nvim_buf_get_name(args.buf), ':t')
    if filename == '' then
      filename = buftype == 'help' and 'help' or '[No Name]'
    end

    local msg = string.format('%s: %d lines', filename, line_count)

    -- Try to use fidget.nvim for notifications
    local ok, fidget = pcall(require, 'fidget')
    if ok and fidget.notify then
      fidget.notify(msg, vim.log.levels.INFO, {
        annote = 'Buffer Opened ',
        ttl = 2,
      })
    else
      -- Fallback to vim.notify if fidget.nvim is not loaded
      vim.notify(msg, vim.log.levels.INFO, {
        title = 'Buffer Opened',
        timeout = 2000,
      })
    end
  end,
})
