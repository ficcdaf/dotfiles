-- Tmux won't forward <C-Cr> to Neovim.
-- So, I've mapped ctrl+enter to \u2190 in kitty,
-- which is the "←" unicode symbol.
local M = {}

M.config = {
  special = "←",
  remap = "<C-CR>",
  autoset = true,
}

M.set = function(opts)
  if not opts then
    opts = M.config
  end
  vim.keymap.set({ "n", "i", "x" }, opts.special, opts.remap, { remap = true })
end

M.setup = function(opts)
  M.config = vim.tbl_extend("force", M.config, opts or {})
  TMUX_SPECIAL = M.config.special
  TMUX_REMAP = M.config.remap
  if not vim.g.tmux_special then
    vim.g.tmux_special = TMUX_SPECIAL
  end
  if not vim.g.tmux_remap then
    vim.g.tmux_remap = TMUX_REMAP
  end
  if M.config.autoset then
    M.set()
  end
end

return M
