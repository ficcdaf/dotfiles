return {
  "ibhagwan/fzf-lua",
  opts = {
    files = {
      cwd_prompt = false,
      find_opts = [[-type f -not -path '*/\.git/*']],
      rg_opts = [[--color=never --files -g "!.git"]],
      fd_opts = [[--color=never --type f --type l --exclude .git]],
    },
    -- fzf_colors = true,
  },
}
