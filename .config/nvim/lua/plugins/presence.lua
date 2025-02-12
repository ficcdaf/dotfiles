local function format_func(filename)
  if string.find(filename, ".md") and not string.find(filename, "README") then
    return "Editing Markdown"
  else
    return "Editing " .. filename
  end
end
return {
  "jiriks74/presence.nvim",
  event = "UIEnter",
  enabled = false,
  pin = true,
  opts = {
    -- show_time = false,
    -- log_level = "warn",
  },
}
