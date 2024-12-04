local function resolver(document_path, image_path, fallback)
  local vault_dir = "/home/fic/second-brain"
  -- Format path for Obsidian vault
  if document_path:find(vault_dir, 1, true) then
    return vault_dir .. "/" .. image_path
  end
  -- fallback to default
  return fallback(document_path, image_path)
end

return {
  {
    "3rd/image.nvim",
    enabled = false,
    opts = {
      tmux_show_only_in_active_window = true,
      window_overlap_clear_enabled = true,
      integrations = {
        markdown = {
          enabled = true,
          clear_in_insert_mode = true,
          only_render_image_at_cursor = true,
          resolve_image_path = resolver,
        },
      },
    },
  },
}
