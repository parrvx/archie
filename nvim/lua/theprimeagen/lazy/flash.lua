-- Adicione este arquivo em lua/theprimeagen/lazy/flash.lua
return {
  "folke/flash.nvim",
  event = "VeryLazy",
  opts = {},
  -- Opcional: Descomente para usar os atalhos padrão 's' e 'S'
  keys = {
    { "s", mode = { "n", "x", "o" }, function() require("flash").jump() end, desc = "Flash" },
    { "S", mode = { "n", "x", "o" }, function() require("flash").treesitter() end, desc = "Flash Treesitter" },
  },
}
