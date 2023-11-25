return {
  "akinsho/bufferline.nvim",
  config = function()
    require("bufferline").setup({
      options = {
        numbers = "ordinal", -- Show buffer numbers as ordinal (1st, 2nd, 3rd, etc.)
        diagnostics = "nvim_lsp", -- Show diagnostics indicators in the bufferline
        diagnostics_indicator = function(count, level, diagnostics_dict, context)
          return "(" .. count .. ")"
        end,
        offsets = { text_align = "center" }, -- Center align buffer names
        separator_style = { "|", "|" }, -- Use vertical bars as separators
        indicator_icon = '▎', -- Use a thin vertical bar as the indicator
        show_buffer_close_icons = false,
        show_close_icon = false,
        show_tab_indicators = false,
        always_show_bufferline = true,
        custom_filter = function(buf_number)
          -- Exclude certain buffers from the bufferline (e.g., NERDTree)
          local exluded_ft = {"NvimTree", "packer"}
          local ft = vim.fn.getbufvar(buf_number, "&filetype")

          for _, value in ipairs(exluded_ft) do
            if value == ft then
              return false
            end
          end
          return true
        end,
      },
    })
  end,
}

