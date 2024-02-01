return {
  {
    "williamboman/mason.nvim",
    opts = {
      ensure_installed = {
        "stylua",
        "prettier",
      },
    },
    config = function(_, opts)
      require("mason").setup(opts)
      local mr = require("mason-registry")
      mr:on("package:install:success", function()
        vim.defer_fn(function()
          -- trigger FileType event to possibly load this newly installed LSP server
          require("lazy.core.handler.event").trigger({
            event = "FileType",
            buf = vim.api.nvim_get_current_buf(),
          })
        end, 100)
      end)
      local function ensure_installed()
        for _, tool in ipairs(opts.ensure_installed) do
          local p = mr.get_package(tool)
          if not p:is_installed() then
            p:install()
          end
        end
      end
      if mr.refresh then
        mr.refresh(ensure_installed)
      else
        ensure_installed()
      end
    end,
  },
  {
    "williamboman/mason-lspconfig.nvim",
    opts = {
      ensure_installed = { "lua_ls", "tsserver", "html", "prismals" },
      automatic_installation = true,
    },
  },
  {
    "neovim/nvim-lspconfig",
    config = function()
      local capabilities = require("cmp_nvim_lsp").default_capabilities()

      require("mason-lspconfig").setup_handlers({
        function(server_name)
          require("lspconfig")[server_name].setup({
            capabilities = capabilities,
            init_options = {
              preferences = {
                importModuleSpecifierPreference = "relative",
              },
            },
          })
        end,
      })

      vim.keymap.set("n", "gh", vim.lsp.buf.hover, {})
      vim.keymap.set("n", "gD", vim.lsp.buf.declaration, {})
      vim.keymap.set("n", "gd", vim.lsp.buf.definition, {})
      vim.keymap.set("n", "gr", vim.lsp.buf.references, {})
      vim.keymap.set("n", "gi", vim.lsp.buf.implementation, {})

      vim.keymap.set("n", "<leader>la", vim.lsp.buf.code_action, {})
      vim.keymap.set("n", "<leader>ls", vim.lsp.buf.signature_help, {})
      vim.keymap.set("n", "<leader>lf", vim.lsp.buf.format, {})

      -- icons
      local signs = { Error = " ", Warn = " ", Hint = " ", Info = " " }
      for type, icon in pairs(signs) do
        local hl = "DiagnosticSign" .. type
        vim.fn.sign_define(hl, { text = icon, texthl = hl, numhl = hl })
      end
    end,
  },
}
