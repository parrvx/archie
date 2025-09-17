-- ~/.config/nvim/lua/theprimeagen/lazy/csv.lua

return {
  "hat0uma/csvview.nvim",
  -- Carrega o plugin apenas para arquivos .csv, .tsv, etc.
  ft = { "csv", "tsv" },
  config = function()
    require("csvview").setup()

    -- Comando para ativar/desativar a visualização
    vim.keymap.set("n", "<leader>cv", "<cmd>CsvViewToggle<cr>", { desc = "Toggle CSV View" })
  end
}
