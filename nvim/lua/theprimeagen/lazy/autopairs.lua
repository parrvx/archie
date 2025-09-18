-- Crie um novo arquivo: lua/theprimeagen/lazy/autopairs.lua
return {
  "windwp/nvim-autopairs",
  -- O evento 'InsertEnter' garante que o plugin só carregue quando você entrar no modo de inserção
  event = "InsertEnter",
  dependencies = { "hrsh7th/nvim-cmp" },
  config = function()
    local autopairs = require("nvim-autopairs")
    autopairs.setup({
      check_ts = true, -- Ativa a verificação com Treesitter
      ts_config = {
        lua = { "string" },
        javascript = { "template_string" },
        java = false,
      },
    })

    -- Integração com nvim-cmp
    local cmp_autopairs = require("nvim-autopairs.completion.cmp")
    local cmp = require("cmp")
    cmp.event:on("confirm_done", cmp_autopairs.on_confirm_done())
  end,
}
