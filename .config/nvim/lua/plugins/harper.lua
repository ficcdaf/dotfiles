local harperSettings = {
  fileDictPath = "/home/fic/.config/harper-ls/file_dictionaries/",
  userDictPath = "/home/fic/.config/harper-ls/dictionary.txt",
  linters = {
    spell_check = true,
    spelled_numbers = false,
    an_a = true,
    sentence_capitalization = true,
    unclosed_quotes = true,
    wrong_quotes = false,
    long_sentences = true,
    repeated_words = true,
    spaces = true,
    matcher = true,
    correct_number_suffix = true,
    number_suffix_capitalization = true,
    multiple_sequential_pronouns = true,
    linking_verbs = false,
    avoid_curses = true,
    terminating_conjunctions = true,
  },
}
require("lspconfig").harper_ls.setup({
  settings = {
    ["harper-ls"] = harperSettings,
  },
})
return {
  {
    "neovim/nvim-lspconfig",
    opts = {
      servers = {
        harper_ls = {
          -- autostart = false,
          filetypes = {
            "markdown",
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
