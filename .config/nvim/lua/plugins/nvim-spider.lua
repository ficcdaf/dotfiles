return {
  "chrisgrieser/nvim-spider",
  lazy = true,
  enabled = false,
  keys = {
    { "e", "<cmd>lua require('spider').motion('e')<CR>", mode = { "n", "o", "x" } },
    { "w", "<cmd>lua require('spider').motion('w')<CR>", mode = { "n", "o", "x" } },
    { "b", "<cmd>lua require('spider').motion('b')<CR>", mode = { "n", "o", "x" } },
    { "ge", "<cmd>lua require('spider').motion('ge')<CR>", mode = { "n", "o", "x" } },
  },
  opts = {
    skipInsignificantPunctuation = true,
    consistentOperatorPending = true, -- see "Consistent Operator-pending Mode" in the README
    subwordMovement = true,
    customPatterns = {}, -- check "Custom Movement Patterns" in the README for details
  },
  dependencies = {
    "https://github.com/starwing/luautf8",
  },
}
