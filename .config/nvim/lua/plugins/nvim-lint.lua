return {
  {
    "mfussenegger/nvim-lint",
    opts = {
      linters_by_ft = {
        markdown = { "vale" },
        tex = { "vale" },
      },
    },
  },
  { "williamboman/mason.nvim", opts = {
    ensure_installed = { "vale" },
  } },
}
