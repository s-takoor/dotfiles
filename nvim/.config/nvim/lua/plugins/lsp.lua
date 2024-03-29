local opts = { noremap=true, silent=true }

-- Diagnostic key mappings
vim.keymap.set("n", "<Leader>e", vim.diagnostic.open_float, opts)
vim.keymap.set("n", "<Leader>a", vim.lsp.buf.code_action, opts)
vim.keymap.set('n', '<space>d', vim.diagnostic.open_float)
vim.keymap.set('n', '[d', vim.diagnostic.goto_prev)
vim.keymap.set('n', ']d', vim.diagnostic.goto_next)

-- LSP key mappings
local function on_attach()
  vim.keymap.set("n", "K", vim.lsp.buf.hover, { buffer = 0 })
  vim.keymap.set("n", "gd", vim.lsp.buf.definition, { buffer = 0 })
  vim.keymap.set("n", "<Leader>rn", vim.lsp.buf.rename, { buffer = 0 })
  vim.keymap.set("n", "gs", "<cmd>lua vim.lsp.buf.signature_help()<cr>", { buffer = 0 })
end

-- List of languages for LSP setup
local languages = { 
  "ansiblels",
  "clangd",
  "cssls",
  "dockerls",
  "html",
  "jqls",
  "jsonls",
  "kotlin_language_server",
  "pyright",
  "terraformls",
  "texlab",
  "tsserver",
  "yamlls",
}

return {
  {
    "neovim/nvim-lspconfig",
    dependencies = { "hrsh7th/cmp-nvim-lsp" },
    config = function()
      local capabilities = require('cmp_nvim_lsp').default_capabilities(vim.lsp.protocol.make_client_capabilities())

      -- Set up the default LSP server for Lua
      require("lspconfig").lua.setup({
        on_attach = on_attach,
        capabilities = capabilities,
        settings = {
          Lua = {
            diagnostics = {
              globals = {"vim"},
            },
          },
        },
      })

      -- Set up LSP servers for additional languages
      for _, language in pairs(languages) do
        require("lspconfig")[language].setup({
          on_attach = on_attach,
          capabilities = capabilities,
        })
      end

      -- Disable virtual text for diagnostics
      vim.lsp.handlers["textDocument/publishDiagnostics"] = vim.lsp.with(
        vim.lsp.diagnostic.on_publish_diagnostics, {
          virtual_text = false
        }
      )
    end
  },
  {
    "williamboman/mason.nvim",
    opts = {}
  },
  {
    "williamboman/mason-lspconfig.nvim",
    opts = {
      ensure_installed = { 
        "ansiblels", 
        "clangd",
        "cssls",
        "dockerls",
        "graphql",
        "html",
        "jqls",
        "jsonls",
        "kotlin_language_server",
        "lua_ls",
        "pyright", 
        "rust_analyzer",
        "terraformls",
        "texlab",
        "tsserver",
        "yamlls",
      }
    }
  }
}

