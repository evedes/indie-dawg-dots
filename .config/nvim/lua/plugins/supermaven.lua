return {
  "supermaven-inc/supermaven-nvim",
  enabled = true,
  event = "VeryLazy",
  config = function()
    require("supermaven-nvim").setup({
      keymaps = {
        accept_suggestion = "<C-l>",
        clear_suggestion = "<C-j>",
        accept_word = "<C-k>",
      },
      ignore_filetypes = { cpp = true },
      color = {
        suggestion_color = "#ffffff",
        cterm = 100,
      },
      log_level = "info",
      disable_inline_completion = false,
      disable_keymaps = false,
      condition = function()
        return true
      end,
    })
  end,
}

