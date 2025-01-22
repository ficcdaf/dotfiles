local harperSettings = {
  -- fileDictPath = "/home/fic/.config/harper-ls/file_dictionaries/",
  -- userDictPath = "/home/fic/.config/harper-ls/dictionary.txt",
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
local enabled = true
local har = ""
if enabled then
  har = "harper_ls"
end
local spec = {
  {
    "neovim/nvim-lspconfig",
    opts = {
      servers = {
        harper_ls = {
          autostart = false,
          filetypes = {
            "markdown",
            "org",
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
    opts = { ensure_installed = { har } },
  },
}
if enabled then
  return spec
else
  return {
    "neovim/nvim-lspconfig",
  }
end
