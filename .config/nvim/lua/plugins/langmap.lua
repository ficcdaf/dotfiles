return {
  "Wansmer/langmapper.nvim",
  enabled = false,
  lazy = false,
  priority = 1500, -- High priority is needed if you will use `autoremap()`
  config = function()
    require("langmapper").setup({})
    require("langmapper").automapping({ global = true, buffer = true })
    require("langmapper").autoremap({ global = true, buffer = true })
  end,
}
