return {
  {
    "williamboman/mason.nvim",
    opts = {
      ensure_installed = {
        "stylua",
        "prettier",
        "yamlfmt",
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
      ensure_installed = { "lua_ls", "tsserver", "html", "prismals", "yamlls" },
      automatic_installation = true,
    },

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
    end,
  },
  {
    "neovim/nvim-lspconfig",
    opts = {
      autoformat = true,
    },
    config = function()
      -- Handle lsp on attach
      vim.api.nvim_create_autocmd("LspAttach", {
        group = vim.api.nvim_create_augroup("UserLspConfig", {}),
        callback = function(ev)
          -- Enable completion triggered by <c-x><c-o>
          vim.bo[ev.buf].omnifunc = "v:lua.vim.lsp.omnifunc"

          -- Buffer local mappings.
          -- See `:help vim.lsp.*` for documentation on any of the below functions
          local opts = { buffer = ev.buf }
          vim.keymap.set("n", "gD", vim.lsp.buf.declaration, { unpack(opts), desc = "Declaration" })
          vim.keymap.set("n", "gd", vim.lsp.buf.definition, { unpack(opts), desc = "Definition" })
          vim.keymap.set("n", "gr", vim.lsp.buf.references, { unpack(opts), desc = "References" })
          vim.keymap.set("n", "gi", vim.lsp.buf.implementation, { unpack(opts), desc = "Implementation" })
          vim.keymap.set("n", "gh", vim.lsp.buf.hover, { unpack(opts), desc = "Hover" })

          vim.keymap.set("n", "<leader>la", vim.lsp.buf.code_action, { unpack(opts), desc = "Code action" })
          vim.keymap.set(
            "n",
            "<leader>ls",
            vim.lsp.buf.signature_help,
            { unpack(opts), desc = "Signature help" }
          )
          vim.keymap.set("n", "<leader>lf", vim.lsp.buf.format, { unpack(opts), desc = "Format" })

          vim.keymap.set(
            "n",
            "<leader>lt",
            ":TroubleToggle document_diagnostics<cr>",
            { unpack(opts), desc = "Trouble" }
          )
        end,
      })

      -- Format on save
      vim.api.nvim_create_autocmd("BufWritePre", {
        callback = function()
          vim.lsp.buf.format()
        end,
      })

      -- Add icons
      local signs = require("icons").signs
      for type, icon in pairs(signs) do
        local hl = "DiagnosticSign" .. type
        vim.fn.sign_define(hl, { text = icon, texthl = hl, numhl = hl })
      end
    end,
  },
  {
    "folke/trouble.nvim",
    dependencies = { "nvim-tree/nvim-web-devicons" },
    opts = {},
  },
}
