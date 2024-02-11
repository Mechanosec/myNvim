return {
  {
    "nvimtools/none-ls.nvim",
    config = function()
      local null_ls = require("null-ls")

      local formatting = null_ls.builtins.formatting
      local lint = null_ls.builtins.diagnostics
      local code_actions = null_ls.builtins.code_actions

      null_ls.setup({
        sources = {
          -- Web
          formatting.prettier,
          lint.eslint_d.with({
            method = null_ls.methods.DIAGNOSTICS_ON_SAVE,
          }),
          code_actions.eslint_d,
          -- Lua
          formatting.stylua,

          -- yaml
          formatting.yamlfmt,
        },
      })
    end,
  },
}
