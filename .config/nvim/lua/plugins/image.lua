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
return {
  {
    "3rd/image.nvim",
    opts = {
      integrations = {
        markdown = {
          -- From https://github.com/3rd/image.nvim/issues/190
          resolve_image_path = function(document_path, image_path, fallback)
            local working_dir = vim.fn.getcwd()
            -- Format path for Obsidian vault
            if working_dir:find("~/second-brain/", 1, true) then
              -- if working_dir:find("~/second-brain/") then
              print("Res image: " .. working_dir .. "/" .. image_path)
              return working_dir .. "/" .. image_path
            end
            -- fallback to default
            return fallback(document_path, image_path)
          end,
        },
      },
    },
  },
}
