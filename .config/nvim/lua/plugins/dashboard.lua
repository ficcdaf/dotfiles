return {
  "nvimdev/dashboard-nvim",
  lazy = false, -- As https://github.com/nvimdev/dashboard-nvim/pull/450, dashboard-nvim shouldn't be lazy-loaded to properly handle stdin.
  opts = function()
    -- local logo = [[
    --      ██╗      █████╗ ███████╗██╗   ██╗██╗   ██╗██╗███╗   ███╗          Z
    --      ██║     ██╔══██╗╚══███╔╝╚██╗ ██╔╝██║   ██║██║████╗ ████║      Z
    --      ██║     ███████║  ███╔╝  ╚████╔╝ ██║   ██║██║██╔████╔██║   z
    --      ██║     ██╔══██║ ███╔╝    ╚██╔╝  ╚██╗ ██╔╝██║██║╚██╔╝██║ z
    --      ███████╗██║  ██║███████╗   ██║    ╚████╔╝ ██║██║ ╚═╝ ██║
    --      ╚══════╝╚═╝  ╚═╝╚══════╝   ╚═╝     ╚═══╝  ╚═╝╚═╝     ╚═╝
    -- ]]

    local saturn = [[
                                         _.oo. 
                 _.u[[/;:,.         .odMMMMMM' 
              .o888UU[[[/;:-.  .o@P^    MMM^   
             oN88888UU[[[/;::-.        dP^     
            dNMMNN888UU[[[/;:--.   .o@P^       
           ,MMMMMMN888UU[[/;::-. o@^           
           NNMMMNN888UU[[[/~.o@P^              
           888888888UU[[[/o@^-..               
          oI8888UU[[[/o@P^:--..                
       .@^  YUU[[[/o@^;::---..                 
     oMP     ^/o@P^;:::---..                   
  .dMMM    .o@^ ^;::---...                     
 dMMMMMMM@^`       `^^^^                       
YMMMUP^                                        
 ^^                                            
]]

    -- logo = string.rep("\n", 8) .. logo .. "\n\n"
    saturn = string.rep("\n", 8) .. saturn .. "\n\n"

    local function loadObsidian()
      -- require("lazy").setup(require("plugins.obsidian"))
      require("obsidian")
      -- vim.api.nvim_input("<cmd>ObsidianWorkspace<cr>")
      vim.api.nvim_input("<cmd>ObsidianTags<cr>")
    end
    local function openConfig()
      local dir = "~/.config/nvim/"
      vim.api.nvim_set_current_dir(dir)
      vim.cmd("edit" .. dir)
    end

    local opts = {
      theme = "doom",
      hide = {
        -- this is taken care of by lualine
        -- enabling this messes up the actual laststatus setting after loading a file
        statusline = false,
      },
      config = {
        -- header = vim.split(logo, "\n"),
        header = vim.split(saturn, "\n"),
        -- stylua: ignore
        center = {
          -- { action = function() vim.cmd("edit " .. "~/second-brain/00-index/00-index.md") end, desc = " Open Obsidian Vault",       icon = " ", key = "o" },
          -- { action = 'lua LazyVim.pick()()',                           desc = " Find File",       icon = " ", key = "f" },
          -- { action = loadObsidian, desc = " Obsidian Tags",       icon = "󱤇 ", key = "o" },
          { action = "ene | startinsert",                              desc = " New File",        icon = " ", key = "n" },
          { action = 'lua LazyVim.pick("oldfiles")()',                 desc = " Recent Files",    icon = " ", key = "r" },
          -- { action = 'lua LazyVim.pick("live_grep")()',                desc = " Grep",       icon = " ", key = "/" },
          -- { action = function() LazyVim.lazygit( { cwd = LazyVim.root.git() }) end,                desc = " Git",       icon = " ", key = "g" },
          { action = 'lua LazyVim.pick.config_files()()',              desc = " Search Config",          icon = " ", key = "c" },
          -- { action = openConfig,              desc = " Open Config",          icon = " ", key = "c" },
          { action = 'lua require("persistence").load()',              desc = " Restore Session", icon = " ", key = "s" },
          -- { action = 'lua require("persistence").select()',              desc = " Select Session", icon = "󱦞 ", key = "S" },
          { action = "LazyExtras",                                     desc = " Lazy Extras",     icon = " ", key = "x" },
          { action = "Lazy",                                           desc = " Lazy",            icon = "󰒲 ", key = "l" },
          { action = function() vim.api.nvim_input("<cmd>qa<cr>") end, desc = " Quit",            icon = " ", key = "q" },
        },
        footer = function()
          local stats = require("lazy").stats()
          local ms = (math.floor(stats.startuptime * 100 + 0.5) / 100)
          return { "⚡ Neovim loaded " .. stats.loaded .. "/" .. stats.count .. " plugins in " .. ms .. "ms" }
        end,
      },
    }

    for _, button in ipairs(opts.config.center) do
      button.desc = button.desc .. string.rep(" ", 43 - #button.desc)
      button.key_format = "  %s"
    end

    -- open dashboard after closing lazy
    if vim.o.filetype == "lazy" then
      vim.api.nvim_create_autocmd("WinClosed", {
        pattern = tostring(vim.api.nvim_get_current_win()),
        once = true,
        callback = function()
          vim.schedule(function()
            vim.api.nvim_exec_autocmds("UIEnter", { group = "dashboard" })
          end)
        end,
      })
    end

    return opts
  end,
}
