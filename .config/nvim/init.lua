-- set up debugging

_G.dd = function(...)
  Snacks.debug.inspect(...)
end
_G.bt = function()
  Snacks.debug.backtrace()
end
vim.print = _G.dd

-- bootstrap lazy.nvim, LazyVim and your plugins
require("config.lazy")
-- if vim.g.neovide then
--   local nv_opts = {
--     cursor = {
--       animation_length = 0.05,
--       trail_size = 0.5,
--       animate_command_line = false,
--     },
--     animations = {
--       position_animation_length = 0.10,
--       scroll_animation_length = 0.1,
--       hide_mouse_when_typing = true,
--     },
--   }
--   require("neovide-config").setup(nv_opts)
-- end
