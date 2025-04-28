-- Function to start blackd server
local function start_blackd()
  -- Check if blackd is already running to avoid duplicate instances
  local port = 45484 -- Default blackd port; adjust if needed
  local check_cmd = string.format('lsof -i :%d', port)
  if vim.fn.system(check_cmd) == '' then
    -- Start blackd in the background
    local blackd_cmd = vim.fn.expand '~/.local/share/nvim/mason/packages/black/venv/bin/blackd'
    vim.fn.jobstart(blackd_cmd .. ' --bind-port ' .. port, {
      detach = true,
      on_stderr = function(_, data) -- short circuit because info is written to stderr
        if data and data[1] ~= '' then
          local message = table.concat(data, '\n')
          if not message:match 'INFO' and not message:match 'listening' then
            vim.notify('blackd error: ' .. message, vim.log.levels.ERROR)
          end
        end
      end,
    })
    vim.notify('Started blackd on port ' .. port, vim.log.levels.INFO)
  end
end

-- Function to stop blackd server
local function stop_blackd()
  local port = 45484
  local pid = vim.fn.system(string.format('lsof -t -i :%d', port))
  if pid ~= '' then
    vim.fn.system('kill ' .. pid)
    vim.notify('Stopped blackd', vim.log.levels.INFO)
  end
end

-- Autocommand to start blackd when opening a Python buffer
vim.api.nvim_create_autocmd('BufEnter', {
  pattern = '*.py',
  callback = function()
    start_blackd()
  end,
})

-- Autocommand to stop blackd when Neovim exits
vim.api.nvim_create_autocmd('VimLeavePre', {
  callback = function()
    stop_blackd()
  end,
})
