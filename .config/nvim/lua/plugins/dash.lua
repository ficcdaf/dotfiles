local function gen_header()
  local h = vim.fn.system("~/dev/pyku/pyku.py --tree")
  return h
end
local function get_haiku()
  local h = vim.fn.system("fortune -s computers linux")
  return h
end
return {
  "folke/snacks.nvim",
  opts = {
    dashboard = {
      width = 60,
      row = nil, -- dashboard position. nil for center
      col = nil, -- dashboard position. nil for center
      pane_gap = 0, -- empty columns between vertical panes
      autokeys = "1234567890abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ", -- autokey sequence
      -- These settings are used by some built-in sections
      preset = {
        -- Defaults to a picker that supports `fzf-lua`, `telescope.nvim` and `mini.pick`
        ---@type fun(cmd:string, opts:table)|nil
        pick = nil,
        -- Used by the `keys` section to show keymaps.
        -- Set your custom keymaps here.
        -- When using a function, the `items` argument are the default keymaps.
        ---@type snacks.dashboard.Item[]
        keys = {
          { icon = " ", key = "n", desc = "New File", action = ":ene | startinsert" },
          {
            action = function()
              vim.api.nvim_input("<CMD>ObsidianQuickSwitch<CR>")
            end,
            desc = "Obsidian",
            icon = " ",
            key = "o",
          },
          -- { icon = " ", key = "f", desc = "Find File", action = ":lua Snacks.dashboard.pick('files')" },
          -- { icon = " ", key = "/", desc = "Find Text", action = ":lua Snacks.dashboard.pick('live_grep')" },
          { icon = " ", key = "r", desc = "Recent Files", action = ":lua Snacks.dashboard.pick('oldfiles')" },
          {
            icon = " ",
            key = "c",
            desc = "Config",
            action = ":cd /home/fic/.config/nvim | lua Snacks.dashboard.pick('files', {cwd = vim.fn.stdpath('config')})",
          },
          { icon = " ", key = "s", desc = "Restore Session", section = "session" },
          -- { icon = "󰒲 ", key = "L", desc = "Lazy", action = ":Lazy", enabled = package.loaded.lazy ~= nil },
          { icon = " ", key = "q", desc = "Quit", action = ":qa" },
        },
        -- Used by the `header` section
        --         header = [[
        --                                          _.oo.
        --                  _.u[[/;:,.         .odMMMMMM'
        --               .o888UU[[[/;:-.  .o@P^    MMM^
        --              oN88888UU[[[/;::-.        dP^
        --             dNMMNN888UU[[[/;:--.   .o@P^
        --            ,MMMMMMN888UU[[/;::-. o@^
        --            NNMMMNN888UU[[[/~.o@P^
        --            888888888UU[[[/o@^-..
        --           oI8888UU[[[/o@P^:--..
        --        .@^  YUU[[[/o@^;::---..
        --      oMP     ^/o@P^;:::---..
        --   .dMMM    .o@^ ^;::---...
        --  dMMMMMMM@^`       `^^^^
        -- YMMMUP^
        --  ^^
        --          ]],
        header = [[
             ,----------------,              ,---------,
        ,-----------------------,          ,"        ,"|
      ,"                      ,"|        ,"        ,"  |
     +-----------------------+  |      ,"        ,"    |
     |  .-----------------.  |  |     +---------+      |
     |  |                 |  |  |     | -==----'|      |
     |  | $ sudo rm -rf / |  |  |     |         |      |
     |  | $               |  |  |/----|`---=    |      |
     |  | $ m̸̨̧̱̭̃̾̏͒͛̊̔͂͘̚͝ỵ̶̛͋̆̐̔̋̓́̾̄̈̍́̈́̂̕ ̵̨̩̟̰̭̦̭̖̭̼̓̓̀̋͑̏̚͘͝s̸̡̭̞̬̹̙̩͕͙̖̘̳͊͒́̿̑̃͗t̸͍̭̣̞̹̗̳̑̀̄̌̐̓̌̀́͊͗̅a̴̛̦͚̼̪̘̲͎̤̦͙͔̭̪̲̯̻̎̽̾́̆̃̀̓͛͠͝͠ͅc̸̯͎͍̳͙̳̤͉͆̈́̂̍̄k̸̨̨͉̘͇̥͔͇̭̮͍͕̥̗̘̏̐̀́̈́̓̌̌̐͛̕͜ ̸̣̱̥̲͕̯̐́̇͗̓͆̃̎͒͠f̷͓̯̹̮̝̳̗̘̙͓͉͍͔̪̈́̃͆̀̉̎̉͂l̷̹̳̔̓͗̋̀̊̃͠͝o̷̢̭̜̲͋̃̂̊̾͗̈́̒̓̀̃̍̄̋̑̕ẇ̸̨̨̢̨̨̢͈͎̻̹̺̮̠̮̎̏̋̑̀̋̍̽̌̐̕ͅe̴̡̡̢̧̩͈̰̱̠̥̻͚̲̫̼̦̤̓̾̂̿͌̇͛̆̋̑͒̈́͑̍̅͌̏ṱ̵̡̛͎̤͈͉̬͎̞̋̍̿̉̍̍̇̈́̇̎̋́̈̿̈͘ḩ̸͒̋́̂̃̏̏̍̂̿͗̐̀͝ ̶̛̹̪̭͋̑̒͊̔̒͋̆̇̒̚͝õ̶̱̲͈̦̰͈͓̹̲͔̰̟̉̒̆̈̓̃̚͝v̶̧̧̹͎̞̰̥̯̼͎̀̎̽ͅe̷̬̞̮̠̪̋̐̿̅̽͑̓̾͑̏̐́̓̚͝͝r̵͚̈́̓̐͘   ,/|==== ooo |      ;
     |  |                 |  |  |  // |(((( [33]|    ," 
     |  `-----------------'  |," .;'| |((((     |  ,"   
     +-----------------------+  ;;  | |         |,"     
        /_)______________(_/  //'   | +---------+       
   ___________________________/___  `,                  
  /  oooooooooooooooo  .o.  oooo /,   \,"-----------    
 / ==ooooooooooooooo==.o.  ooo= //   ,`\--{)B     ,"    
/_==__==========__==_ooo__ooo=_/'   /___________,"      
        ]],
        -- header = gen_header(),
        -- header = "test",
        -- footer = "testing",
      },
      -- item field formatters
      formats = {
        icon = function(item)
          if item.file and item.icon == "file" or item.icon == "directory" then
            return M.icon(item.file, item.icon)
          end
          return { item.icon, width = 2, hl = "icon" }
        end,
        footer = { "%s", align = "center" },
        header = { "%s", align = "center" },
        terminal = { "%s", align = "center" },
        file = function(item, ctx)
          local fname = vim.fn.fnamemodify(item.file, ":~")
          fname = ctx.width and #fname > ctx.width and vim.fn.pathshorten(fname) or fname
          if #fname > ctx.width then
            local dir = vim.fn.fnamemodify(fname, ":h")
            local file = vim.fn.fnamemodify(fname, ":t")
            if dir and file then
              file = file:sub(-(ctx.width - #dir - 2))
              fname = dir .. "/…" .. file
            end
          end
          local dir, file = fname:match("^(.*)/(.+)$")
          return dir and { { dir .. "/", hl = "dir" }, { file, hl = "file" } } or { { fname, hl = "file" } }
        end,
      },
      sections = {
        { section = "header", gap = 0, padding = 0 },
        { text = get_haiku(), align = "center", gap = 0, padding = 0 },
        -- {
        --   -- pane = 2,
        --   section = "terminal",
        --   cmd = "colorscript -e 36",
        --   -- hl = "header",
        --   -- height = 30,
        --   random = 10,
        --   indent = 11,
        --   gap = 0,
        --   padding = 0,
        --   -- padding = 1,
        -- },
        { section = "keys", gap = 0, padding = 0 },
        { section = "startup", gap = 0, padding = 0 },
        -- { section = "footer" },
      },
    },
  },
}
