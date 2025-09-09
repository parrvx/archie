return {
  {
    "folke/tokyonight.nvim",
    name = "tokyonight",
    priority = 1000,

    config = function()
      local config_options = {
        style = "night",
        transparent = true,
        styles = {
          comments = { "italic" },
          keywords = { "italic" },
        },
        integrations = {
          treesitter = true,
          native_lsp = {
            enabled = true,
          },
          telescope = true,
          mason = true,
          cmp = true,
        },
      }

      -- Tenta configurar o tema com segurança.
      pcall(require("tokyonight").setup, config_options)

      -- Tenta aplicar o tema de cores.
      pcall(vim.cmd.colorscheme, "tokyonight")
    end,
  },
}
