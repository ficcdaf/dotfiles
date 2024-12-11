local harperSettings = {
  fileDictPath = "/home/fic/.config/harper-ls/file_dictionaries/",
  userDictPath = "/home/fic/.config/harper-ls/dictionary.txt",
  diagnosticSeverity = "warning",
  linters = {
    spell_check = true,
    spelled_numbers = false,
    an_a = true,
    sentence_capitalization = true,
    unclosed_quotes = true,
    wrong_quotes = false,
    long_sentences = false,
    repeated_words = true,
    spaces = true,
    matcher = true,
    correct_number_suffix = true,
    number_suffix_capitalization = true,
    multiple_sequential_pronouns = true,
    linking_verbs = true,
    avoid_curses = true,
    terminating_conjunctions = true,
  },
}
local enabled = false
local spec = {
  {
    "neovim/nvim-lspconfig",
    opts = {
      servers = {
        harper_ls = {
          -- autostart = false,
          filetypes = {
            "markdown",
          },
          settings = {
            ["harper-ls"] = harperSettings,
          },
        },
      },
    },
  },
  {
    "williamboman/mason-lspconfig.nvim",
    opts = { ensure_installed = { "harper_ls" } },
  },
}
if enabled then
  return spec
else
  return {
    "williamboman/mason-lspconfig.nvim",
    config = function()
      vim.cmd("LspUninstall harper_ls")
    end,
  }
end
