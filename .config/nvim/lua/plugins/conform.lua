return {
  "stevearc/conform.nvim",
  event = "BufWritePre",
  opts = {
    notify_on_error = false,
    formatters_by_ft = {
      javascript = { "prettier", name = "dprint", timeout_ms = 500, lsp_format = "fallback" },
      javascriptreact = { "prettier", name = "dprint", timeout_ms = 500, lsp_format = "fallback" },
      json = { "prettier", stop_on_first = true, name = "dprint", timeout_ms = 500 },
      jsonc = { "prettier", stop_on_first = true, name = "dprint", timeout_ms = 500 },
      less = { "prettier" },
      lua = { "stylua" },
      markdown = { "prettier" },
      scss = { "prettier" },
      sh = { "shfmt" },
      typescript = { "prettier", name = "dprint", timeout_ms = 500, lsp_format = "fallback" },
      typescriptreact = { "prettier", name = "dprint", timeout_ms = 500, lsp_format = "fallback" },
      elixir = { "mix_format" },
      -- For filetypes without a formatter:
      ["_"] = { "trim_whitespace", "trim_newlines" },
    },
    format_on_save = function()
      -- Don't format when minifiles is open, since that triggers the "confirm without
      -- synchronization" message.
      if vim.g.minifiles_active then
        return nil
      end

      -- Stop if we disabled auto-formatting.
      if not vim.g.autoformat then
        return nil
      end

      return {}
    end,
  },
  init = function()
    -- Use conform for gq.
    vim.o.formatexpr = "v:lua.require'conform'.formatexpr()"

    -- Start auto-formatting by default (and disable with my ToggleFormat command).
    vim.g.autoformat = true
  end,
}
