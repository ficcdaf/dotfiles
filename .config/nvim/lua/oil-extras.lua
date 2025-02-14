local M = {}

local parse_output = function(proc)
  local result = proc:wait()
  local ret = {}
  if result.code == 0 then
    for line in vim.gsplit(result.stdout, "\n", { plain = true, triempty = true }) do
      line = line:gsub("/$", "")
      ret[line] = true
    end
  end
  return ret
end

local new_git_status = function()
  return setmetatable({}, {
    __index = function(self, key)
      local ignore_proc = vim.system(
        { "git", "ls-files", "--ignored", "--exclude-standard", "--others", "--directory" },
        {
          cwd = key,
          text = true,
        }
      )
      local tracked_proc = vim.system({ "git", "ls-tree", "HEAD", "--name-only" }, {
        cwd = key,
        text = true,
      })
      local ret = {
        ignored = parse_output(ignore_proc),
        tracked = parse_output(tracked_proc),
      }

      rawset(self, key, ret)
      return ret
    end,
  })
end

local git_status = new_git_status()

M.handle_git = function(name, bufnr)
  local refresh = require("oil.actions").refresh
  local orig_refresh = refresh.callback
  refresh.callback = function(...)
    git_status = new_git_status()
    orig_refresh(...)
  end
  local dir = require("oil").get_current_dir(bufnr)
  local is_dotfile = vim.startswith(name, ".") and name ~= ".."
  if not dir then
    return is_dotfile
  end
  if is_dotfile then
    return not git_status[dir].tracked[name]
  else
    return git_status[dir].ignored[name]
  end
end

return M
