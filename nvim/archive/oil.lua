-- Em seu arquivo de configuração para o oil.nvim

return {
  'stevearc/oil.nvim',
  dependencies = { "nvim-tree/nvim-web-devicons" }, -- Para ícones bonitos
  config = function()
    require('oil').setup({
      -- As configurações principais do oil.nvim vêm aqui.
      default_file_explorer = true,
      view_options = {
        show_hidden = true,
      },
    })

    -- Abre o Oil no diretório do arquivo atual
    vim.keymap.set("n", "<leader>e", "<cmd>Oil %:p:h<cr>", { desc = "Open Oil in current file's directory" })

    -- Abre o Oil no diretório de trabalho (cwd)
    vim.keymap.set("n", "<leader>-", "<cmd>Oil<cr>", { desc = "Open Oil in cwd" })
  end,
}
