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

vim.keymap.set("n", "<C-q>", "<CMD>qa!<Cr>")
vim.keymap.set("n", "<leader>gg", "<CMD>Neogit<Cr>")

-- Setup lazy.nvim
require("lazy").setup({
	spec = {
		-- "ficcdaf/ashen.nvim",
		{
			dir = "~/dev/plugins/ashen.nvim/",
			opts = {
				variant = "light",
			},
		},
		{
			"ibhagwan/fzf-lua",
			-- optional for icon support
			-- dependencies = { "nvim-tree/nvim-web-devicons" },
			-- or if using mini.icons/mini.nvim
			dependencies = { "echasnovski/mini.icons" },
			opts = {
				-- fzf_colors = true,
			},
		},
		-- {
		-- 	"NeogitOrg/neogit",
		-- 	dependencies = {
		-- 		"nvim-lua/plenary.nvim", -- required
		-- 		"sindrets/diffview.nvim", -- optional - Diff integration
		--
		-- 		-- Only one of these is needed.
		-- 		"ibhagwan/fzf-lua", -- optional
		-- 	},
		-- 	config = true,
		-- },
	},
	-- Configure any other settings here. See the documentation for more details.
	-- colorscheme that will be used when installing plugins.
	install = { colorscheme = { "ashen" } },
	-- automatically check for plugin updates
	checker = { enabled = true },
})

vim.keymap.set("n", "<leader><leader>", "<CMD>FzfLua<Cr>")

-- require("ashen").setup()
require("ashen").load()

-- vim.inspect(require("ashen.plugins.lualine"))
-- print(require("ashen.plugins.lualine").lualine_opts.options.component_separators.left)
