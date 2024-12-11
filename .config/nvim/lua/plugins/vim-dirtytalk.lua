return {
  "psliwka/vim-dirtytalk",
  build = ":DirtytalkUpdate",
  config = function()
    require("spell-util").add("programming")
  end,
}
