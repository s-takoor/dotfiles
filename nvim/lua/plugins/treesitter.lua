vim.lsp.handlers['textDocument/publishDiagnostics'] = vim.lsp.with(
    vim.lsp.diagnostic.on_publish_diagnostics,
    {
        underline = true,
        virtual_text = {
            spacing = 5,
            severity_limit = 'Warning',
        },
        update_in_insert = true,
    }
)

require'nvim-treesitter.configs'.setup {
  ensure_installed = {"bash", "css", "go", "haskell", "html", "java", "javascript", "lua", "php", "python", "rust", "toml", "typescript", "yaml"},

  highlight = {
    enable = true,
    additional_vim_regex_highlighting = false,
  },

  autotag = {
    enable = true,
  },

  rainbow = {
    enable = true,
    extended_mode = false,
    max_file_lines = nil,
  },

  autopairs = {
    enable = true
  },

  indent = {
    enable = true
  },
}

