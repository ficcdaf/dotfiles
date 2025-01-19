return {
  {
    "nvim-orgmode/orgmode",
    event = "VeryLazy",
    ft = { "org" },
    opts = {
      org_agenda_files = "~/orgfiles/**/*",
      org_default_notes_file = "~/orgfiles/refile.org",
      org_startup_folded = "content",
      win_split_mode = "auto",
    },
  },
  {
    "chipsenkbeil/org-roam.nvim",
    -- tag = "0.1.1",
    enabled = false,
    dependencies = {
      {
        "nvim-orgmode/orgmode",
        -- tag = "0.3.7",
      },
    },
    config = function()
      require("org-roam").setup({
        directory = "~/orgfiles/roam",
        -- optional
      })
    end,
  },
  {
    "akinsho/org-bullets.nvim",
    opts = {},
  },
}
