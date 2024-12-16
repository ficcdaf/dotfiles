local M = {}

local defaults = {
  font_maps = {
    enabled = true,
    scale_factor = 1.1,
  },
  animations = {
    position_animation_length = nil,
    scroll_animation_length = nil,
    scroll_animation_far_lines = nil,
    hide_mouse_when_typing = nil,
    underline_stroke_scale = nil,
  },
  cursor = {
    -- prefixed with neovide_cursor
    animation_length = nil,
    trail_size = nil,
    antialiasing = nil,
    animate_in_insert_mode = nil,
    animate_command_line = nil,
    unfocused_outline_width = nil,
    smooth_blink = nil,
  },
}

M.setup = function(opts)
  opts = vim.tbl_extend("force", defaults, opts or {})
  if opts.font_maps.enabled then
    local change_scale_factor = function(delta)
      vim.g.neovide_scale_factor = vim.g.neovide_scale_factor * delta
    end
    vim.keymap.set("n", "<C-+>", function()
      change_scale_factor(opts.font_maps.scale_factor)
    end)
    vim.keymap.set("n", "<C-=>", function()
      change_scale_factor(1 / opts.font_maps.scale_factor)
    end)
  end
  local animations = opts.animations
  if animations then
    for k, v in pairs(animations) do
      if k ~= nil then
        vim.g[k] = v
      end
    end
  end
  local cursor = opts.cursor
  if cursor then
    for k, v in pairs(cursor) do
      if k ~= nil then
        vim.g["neovide_cursor_" .. k] = v
      end
    end
  end
end

return M
