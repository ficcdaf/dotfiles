return {
  "psliwka/vim-dirtytalk",
  build = ":DirtytalkUpdate",
  config = function()
    vim.opt.spelllang = { "en", "programming" }
  end,
  -- Note: let g:dirtytalk_blacklist=['lorem-ipsum'] to disable a wordlist
  -- Mus run :DirtytalkUpdate after making this change
}
