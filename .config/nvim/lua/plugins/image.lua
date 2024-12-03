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
  local working_dir = vim.fn.getcwd()
  Snacks.notify.notify("Resolving... " .. working_dir)
  -- Format path for Obsidian vault
  if working_dir:find("/home/fic/second-brain", 1, true) then
    -- if working_dir:find("~/second-brain/") then
    local out = "Obsidian image: " .. working_dir .. "/" .. image_path
    Snacks.notify.notify(out)
    return working_dir .. "/" .. image_path
  end
  -- fallback to default
  return fallback(document_path, image_path)
end
local function tester(document_path, image_path, fallback)
  return fallback(document_path, image_path)
end
-- local function simple_resolver(document_path, image_path, fallback)
--   image_path = "/home/fic/second-brain"
-- end
return {
  {
    "3rd/image.nvim",
    lazy = false,
    opts = {
      tmux_show_only_in_active_window = true,
      integrations = {
        markdown = {
          enabled = true,
          resolve_image_path = resolver,
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
