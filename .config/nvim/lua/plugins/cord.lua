return {
  "vyfor/cord.nvim",
  branch = "client-server",
  build = ":Cord update",
  opts = {
    log_level = vim.log.levels.WARN,
    editor = {
      tooltip = "Lean Mean Text Editing Machine",
    },
    timestamp = {
      reset_on_idle = true,
    },
    idle = {
      tooltip = "battery life begone",
    },
  },
}
