return {
  {
    "nvim-orgmode/orgmode",
    event = "VeryLazy",
    ft = { "org" },
    dependencies = {
      {
        "ficcdaf/org-modern.nvim",
        dev = true,
      },
    },
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
        org_agenda_skip_scheduled_if_done = true,
        org_agenda_skip_deadline_if_done = true,
        win_split_mode = "auto",
        ui = {
          input = {
            use_vim_ui = true,
          },
          menu = {
            handler = function(data)
              local Menu = require("org-modern.menu")
              Menu:new({
                window = {
                  margin = { 1, 120, 1, 10 },
                  padding = { 0, 1, 0, 1 },
                  title_pos = "center",
                  border = "single",
                  zindex = 1000,
                },
                icons = {
                  separator = "➜",
                },
              }):open(data)
            end,
          },
        },
        mappings = {
          -- disable_all = true,
          org_return_uses_meta_return = false,
          org = {
            org_timestamp_down = "<C-a>",
            org_timestamp_up = "<C-i>",
            org_return = false,
            org_next_visible_heading = false,
            org_previous_visible_heading = false,
            org_forward_heading_same_level = false,
            org_backward_heading_same_level = false,
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
    -- dir = "~/dev/plugins/org-bullets.nvim",
    enabled = true,
    opts = {
      symbols = {
        -- list = false,
      },
    },
  },
  {
    "nvim-orgmode/telescope-orgmode.nvim",
    enabled = false,
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
