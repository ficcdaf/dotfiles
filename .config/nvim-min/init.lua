-- Bootstrap lazy.nvim
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not (vim.uv or vim.loop).fs_stat(lazypath) then
	local lazyrepo = "https://github.com/folke/lazy.nvim.git"
	local out = vim.fn.system({ "git", "clone", "--filter=blob:none", "--branch=stable", lazyrepo, lazypath })
	if vim.v.shell_error ~= 0 then
		vim.api.nvim_echo({
			{ "Failed to clone lazy.nvim:\n", "ErrorMsg" },
			{ out, "WarningMsg" },
			{ "\nPress any key to exit..." },
		}, true, {})
		vim.fn.getchar()
		os.exit(1)
	end
end
vim.opt.rtp:prepend(lazypath)

-- Make sure to setup `mapleader` and `maplocalleader` before
-- loading lazy.nvim so that mappings are correct.
-- This is also a good place to setup other settings (vim.opt)
vim.g.mapleader = " "
vim.g.maplocalleader = ","

-- Setup lazy.nvim
require("lazy").setup({
	spec = {
		{
			dir = "~/dev/plugins/ashen.nvim/",
		},
	},
	-- Configure any other settings here. See the documentation for more details.
	-- colorscheme that will be used when installing plugins.
	install = { colorscheme = { "habamax" } },
	-- automatically check for plugin updates
	checker = { enabled = true },
})

require("ashen").setup({
	hl = {
		-- merge_override = { Normal = { nil, "#FFFFFF" } },
		-- merge_override = { Normal = { "#FFFFFF" } },
		-- merge_override = { NotifyBackground = { "#121212" } },
		merge_override = { Normal = { "#FFFFFF" } },
	},
	terminal = {
		colors = {
			[0] = "#121212",
			[1] = "#B14242",
			[2] = "#1E6F54",
			[3] = "#E49A44",
			[4] = "#949494",
			[5] = "#949494",
			[6] = "#a7a7a7",
			[7] = "#b4b4b4",
			[8] = "#d5d5d5",
			[9] = "#B14242",
			[10] = "#D87C4A",
			[11] = "#B14242",
			[12] = "#949494",
			[13] = "#a7a7a7",
			[14] = "#b4b4b4",
			[15] = "#d5d5d5",
		},
	},
})
require("ashen").load()
