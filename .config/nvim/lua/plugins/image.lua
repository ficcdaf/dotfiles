-- require("lazy").setup({
--     {
--         "3rd/image.nvim",
--         opts = {}
--     },
-- }, {
--     rocks = {
--         hererocks = true,  -- recommended if you do not have global installation of Lua 5.1.
--     },
-- })
local function resolver(document_path, image_path, fallback)
  local vault_dir = "/home/fic/second-brain"
  -- Format path for Obsidian vault
  if document_path:find(vault_dir, 1, true) then
    return vault_dir .. "/" .. image_path
  end
  -- fallback to default
  return fallback(document_path, image_path)
end

local function tester(document_path, image_path, fallback)
  local working_dir = vim.fn.getcwd()
  local notes_dir = vim.fn.expand(vim.env.NOTES_DIR)
  -- Format image path for Obsidian notes
  if working_dir:find(notes_dir, 1, true) then
    return vim.fn.shellescape(notes_dir .. "/" .. image_path)
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
          resolve_image_path = tester,
          -- From https://github.com/3rd/image.nvim/issues/190
          -- resolve_image_path = function(document_path, image_path, fallback)
          --   Snacks.notify.notify("This prints")
          --   -- document_path is the path to the file that contains the image
          --   -- image_path is the potentially relative path to the image. for
          --   -- markdown it's `![](this text)`
          --
          --   -- you can call the fallback function to get the default behavior
          --   return fallback(document_path, image_path)
          -- end,
        },
      },
    },
  },
}
