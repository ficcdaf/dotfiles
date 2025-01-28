return {
  "vyfor/cord.nvim",
  branch = "client-server",
  build = ":Cord update",
  opts = {
    log_level = vim.log.levels.OFF,
    editor = {
      tooltip = "Autismmaxxing",
    },
    timestamp = {
      reset_on_idle = true,
    },
    idle = {
      tooltip = "battery life begone",
    },
  },
}
