-- local highlight = { 'CursorColumn', 'Whitespace' }
-- local whitespace_hl = vim.api.nvim_get_hl(0, { name = 'Whitespace', create = false })
vim.api.nvim_set_hl(0, 'MyIndentLine', { fg = '#303030', link = 'Whitespace' })
return {
  { -- Add indentation guides even on blank lines
    'lukas-reineke/indent-blankline.nvim',
    -- Enable `lukas-reineke/indent-blankline.nvim`
    -- See `:help ibl`
    main = 'ibl',
    --- @module 'ibl'
    --- @type ibl.config
    opts = {
      indent = { char = '▏', highlight = 'MyIndentLine' },
      scope = { enabled = false },
    },
  },
}
