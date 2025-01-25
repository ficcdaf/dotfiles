return {
  "ibhagwan/fzf-lua",
  opts = function()
    local actions = require("fzf-lua").actions
    return {
      actions = {
        ["default"] = actions.file_edit,
        ["ctrl-s"] = actions.file_split,
        ["ctrl-v"] = actions.file_vsplit,
        ["ctrl-t"] = actions.file_tabedit,
        ["alt-q"] = actions.file_sel_to_qf,
        ["ctrl-p"] = actions.paste_register,
      },
      files = {
        cwd_prompt = false,
        find_opts = [[-type f -not -path '*/\.git/*']],
        rg_opts = [[--color=never --files -g "!.git"]],
        fd_opts = [[--color=never --type f --type l --exclude .git]],
      },
      -- fzf_colors = true,
    }
  end,
}
