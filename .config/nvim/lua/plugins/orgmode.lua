return {
  {
    "nvim-orgmode/orgmode",
    event = "VeryLazy",
    ft = { "org" },
    opts = function()
      require("nvim-treesitter.configs").setup({
        ignore_install = { "org" },
      })
      return {
        org_agenda_files = "~/orgfiles/**/*",
        org_default_notes_file = "~/orgfiles/refile.org",
        org_startup_folded = "inherit",
        org_hide_emphasis_markers = true,
        org_blank_before_new_entry = { heading = false, plain_list_item = false },
        win_split_mode = "auto",
        mappings = {
          org = {
            org_timestamp_down = "<C-a>",
            org_timestamp_up = "<C-i>",
          },
        },
      }
    end,
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
  {
    "nvim-orgmode/telescope-orgmode.nvim",
    event = "VeryLazy",
    dependencies = {
      "nvim-orgmode/orgmode",
      "nvim-telescope/telescope.nvim",
    },
    config = function()
      require("telescope").load_extension("orgmode")

      -- vim.keymap.set("n", "<leader>or", require("telescope").extensions.orgmode.refile_heading)
      vim.keymap.set("n", "<leader>ofh", require("telescope").extensions.orgmode.search_headings)
      vim.keymap.set("n", "<leader>ofl", require("telescope").extensions.orgmode.insert_link)
      vim.api.nvim_create_autocmd("FileType", {
        pattern = "org",
        group = vim.api.nvim_create_augroup("orgmode_telescope_nvim", { clear = true }),
        callback = function()
          vim.keymap.set("n", "<leader>or", require("telescope").extensions.orgmode.refile_heading)
        end,
      })
    end,
  },
}
