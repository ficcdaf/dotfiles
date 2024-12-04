return {
  "epwalsh/pomo.nvim",
  version = "*", -- Recommended, use latest release instead of latest commit
  lazy = true,
  cmd = { "TimerStart", "TimerRepeat", "TimerSession" },
  dependencies = {
    -- Optional, but highly recommended if you want to use the "Default" timer
    "rcarriga/nvim-notify",
  },
  opts = {
    -- See below for full list of options 👇
    notifiers = {
      {
        name = "Default",
        opts = {
          sticky = false,
          title_icon = "󱎫",
          text_icon = "󰄉",
        },
      },
      {
        name = "System",
        opts = {
          sticky = false,
          title_icon = "󱎫",
          text_icon = "󰄉",
        },
      },
    },
    sessions = {
      pomodoro = {
        { name = "Work", duration = "25m" },
        { name = "Short Break", duration = "5m" },
        { name = "Work", duration = "25m" },
        { name = "Short Break", duration = "5m" },
        { name = "Work", duration = "25m" },
        { name = "Long Break", duration = "15m" },
      },
      test = {
        { name = "Work", duration = "5s" },
        { name = "Short Break", duration = "5s" },
      },
    },
  },
}
