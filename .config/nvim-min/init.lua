local function display()
	vim.notify("Displaying something", vim.log.levels.INFO)
end
local key = "←"
vim.keymap.set({ "n", "i" }, key, display)
