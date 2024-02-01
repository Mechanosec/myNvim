return {
  "nvimtools/none-ls.nvim",
  config = function()
    local null_ls = require("null-ls")

    local lint = null_ls.builtins.diagnostics
    local format = null_ls.builtins.formatting

    null_ls.setup({
      sources = {
        -- lua
        format.stylua,

        -- js/ts
        lint.eslint.with({
          method = null_ls.methods.DIAGNOSTICS_ON_SAVE,
        }),
        format.prettier,
      },
    })
  end,
}
