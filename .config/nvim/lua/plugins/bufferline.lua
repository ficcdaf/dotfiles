return {
  "akinsho/bufferline.nvim",
  opts = {
    options = {
      show_buffer_close_icons = false,
      show_close_icon = false,
      separator_style = "thin",
      hover = {
        enabled = false,
      },
      -- can be function(buffer_a, buffer_b)
      sort_by = "directory",
    },
  },
}
