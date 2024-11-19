local function format_func(filename)
  if string.find(filename, ".md") and not string.find(filename, "README") then
    return "Editing Markdown"
  else
    return "Editing " .. filename
  end
end
return {
  "andweeb/presence.nvim",
  opts = {
    show_time = false,
    editing_text = format_func,
    log_level = "debug",
  },
}
