return {
  'preservim/vim-markdown',
  ft = 'markdown',
  config = function()
    vim.opt.conceallevel = 2 -- Show italics/bold as formatted
    vim.opt.wrap = true
    vim.opt.linebreak = true
  end,
}
