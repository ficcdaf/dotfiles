return {
  "psliwka/vim-dirtytalk",
  -- enabled = false,
  build = ":DirtytalkUpdate",
  config = function()
    -- vim.opt.spelllang = { "en", "programming" }
    vim.opt.spelllang = vim.tbl_extend("error", vim.opt.spelllang, { "programming" })
  end,
  -- Note: let g:dirtytalk_blacklist=['lorem-ipsum'] to disable a wordlist
  -- Mus run :DirtytalkUpdate after making this change
}
