return {
  "vyfor/cord.nvim",
  branch = "client-server",
  build = ":Cord update",
  opts = {
    log_level = vim.log.levels.OFF,
    display = {
      swap_icons = true,
    },
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
