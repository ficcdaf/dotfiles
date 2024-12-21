---@type Flash.Config
local conf = {
  labels = "arstgmneioqwfpbjluyzxcdvkh",
  jump = {
    -- inclusive = false,
    nohlsearch = false,
    offset = nil,
  },
  label = {
    uppercase = true,
  },
  highlight = {
    backdrop = false,
  },
  modes = {
    char = {
      jump_labels = false,
      highlight = { backdrop = false },
      keys = { "f", "F", "t", "T" },
      char_actions = function(motion)
        return { [motion:lower()] = "next", [motion:upper()] = "prev" }
      end,
    },
  },
}
local function diagHL()
  require("flash").jump({
    matcher = function(win)
      ---@param diag Diagnostic
      return vim.tbl_map(function(diag)
        return {
          pos = { diag.lnum + 1, diag.col },
          end_pos = { diag.end_lnum + 1, diag.end_col - 1 },
        }
      end, vim.diagnostic.get(vim.api.nvim_win_get_buf(win)))
    end,
    action = function(match, state)
      vim.api.nvim_win_call(match.win, function()
        vim.api.nvim_win_set_cursor(match.win, match.pos)
        vim.diagnostic.open_float()
      end)
      state:restore()
    end,
  })
end
return {
  "folke/flash.nvim",
  event = "VeryLazy",
  vscode = true,
  ---@type Flash.Config
  opts = conf,
  keys = {
    {
      "s",
      mode = { "n", "x", "o" },
      function()
        require("flash").jump({ jump = {
          inclusive = true,
        } })
      end,
      desc = "Flash Inclusive",
    },
    {
      "<c-s>",
      mode = { "n", "x", "o" },
      function()
        require("flash").jump({ jump = {
          inclusive = false,
        } })
      end,
      desc = "Flash Exclusive",
    },
    {
      "S",
      mode = { "n", "o", "x" },
      function()
        require("flash").treesitter()
      end,
      desc = "Flash Treesitter",
    },
    {
      "r",
      mode = "o",
      function()
        require("flash").remote()
      end,
      desc = "Remote Flash",
    },
    {
      "R",
      mode = { "o", "x" },
      function()
        require("flash").treesitter_search()
      end,
      desc = "Treesitter Search",
    },
    -- {
    --   "<c-s>",
    --   mode = { "c" },
    --   function()
    --     require("flash").toggle()
    --   end,
    --   desc = "Toggle Flash Search",
    -- },
    -- {
    --   "<c-s>",
    --   mode = { "n", "x", "o" },
    --   function()
    --     diagHL()
    --   end,
    --   desc = "Toggle Flash Search",
    -- },
  },
}
