local spec = {
  guess = {
    enabled = false,
    "nmac427/guess-indent.nvim",
    opts = {},
  },

  matic = {
    "Darazaki/indent-o-matic",
    enabled = false,
    opts = {
      max_lines = 2048,
      standard_widths = { 2, 4, 8 },
      skip_multiline = true,
    },
  },
}

return spec.matic
