local function resolver(document_path, image_path, fallback)
  local vault_dir = "/home/fic/second-brain"
  -- Format path for Obsidian vault
  if document_path:find(vault_dir, 1, true) then
    return vault_dir .. "/" .. image_path
  end
  -- fallback to default
  return fallback(document_path, image_path)
end

local function resolver_ahmed(document_path, image_path, fallback)
  -- my vault root
  vim.env.NOTES_DIR = "/home/fic/second-brain"
  local working_dir = vim.fn.getcwd()
  local notes_dir = vim.fn.expand(vim.env.NOTES_DIR)
  -- Format image path for Obsidian notes
  if working_dir:find(notes_dir, 1, true) then
    return vim.fn.shellescape(notes_dir .. "/" .. image_path)
  end
  -- Fallback to the default behavior
  return fallback(document_path, image_path)
end
local function resolver_ahmed_fixed(document_path, image_path, fallback)
  -- my vault root
  vim.env.NOTES_DIR = "/home/fic/second-brain"
  local working_dir = vim.fn.getcwd()
  local notes_dir = vim.fn.expand(vim.env.NOTES_DIR)
  -- Format image path for Obsidian notes
  if working_dir:find(notes_dir, 1, true) then
    return (notes_dir .. "/" .. image_path)
  end
  -- Fallback to the default behavior
  return fallback(document_path, image_path)
end
return {
  {
    "3rd/image.nvim",
    lazy = false,
    opts = {
      tmux_show_only_in_active_window = true,
      integrations = {
        markdown = {
          enabled = true,
          resolve_image_path = resolver_ahmed,
        },
      },
    },
  },
}
