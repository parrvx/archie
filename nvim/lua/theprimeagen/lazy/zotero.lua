-- ~/.config/nvim/lua/theprimeagen/lazy/zotero.lua
return {
  "karb94/zotero.nvim",
  dependencies = {
    "nvim-lua/plenary.nvim",
    "nvim-telescope/telescope.nvim",
  },
  config = function()
    require("zotero").setup({
      -- suas configurações aqui, se necessário
    })

    -- Atalho para buscar e inserir citação
    vim.keymap.set("n", "<leader>zc", function()
      require("telescope").extensions.zotero.citations()
    end, { desc = "Zotero: Inserir Citação" })

    -- Atalho para buscar e inserir notas
    vim.keymap.set("n", "<leader>zn", function()
      require("telescope").extensions.zotero.notes()
    end, { desc = "Zotero: Inserir Notas" })
  end,
}
