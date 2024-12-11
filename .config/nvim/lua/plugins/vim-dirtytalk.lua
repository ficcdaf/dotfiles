local o = vim.opt
return {
  "psliwka/vim-dirtytalk",
  -- enabled = false,
  build = ":DirtytalkUpdate",
  config = function()
    -- vim.opt.spelllang = { "en", "programming" }
    -- vim.opt.spelllang = vim.tbl_extend("error", vim.opt.spelllang, { "programming" })
    local current = o.spelllang:get()
    if not vim.tbl_contains(current, "programming") then
      table.insert(current, "programming")
    end
    o.spelllang = current
  end,
}
