return {
  "mikavilpas/yazi.nvim",
  -- ⭐ OTIMIZAÇÃO: Carrega o plugin apenas quando necessário
  event = "VeryLazy",

  -- Adicione esta seção para desabilitar o netrw e preparar o terreno para o Yazi
  dependencies = {
    "nvim-tree/nvim-web-devicons", -- Para ícones (opcional, mas recomendado)
  },
  init = function()
    -- Desabilita o netrw para que o Yazi possa assumir como padrão
    vim.g.loaded_netrw = 1
    vim.g.loaded_netrwPlugin = 1
  end,

  keys = {
    {
      -- ✅ Atalho principal e mais intuitivo: Abrir no diretório do arquivo atual
      "<leader><leader>",
      "<cmd>Yazi<cr>",
      desc = "Yazi: Open at current file's directory",
    },
    {
      -- Mantém o atalho para abrir no diretório de trabalho (cwd)
      "<leader>E", -- Alterado para 'E' maiúsculo para diferenciar
      "<cmd>Yazi cwd<cr>",
      desc = "Yazi: Open at nvim's working directory",
    },
    {
      -- Mantém o atalho para alternar/resumir a última sessão
      "<c-up>",
      "<cmd>Yazi toggle<cr>",
      desc = "Yazi: Resume last session",
    },
  },

  opts = {
    -- ✅ OTIMIZAÇÃO: Torna o Yazi o explorador de arquivos padrão
    open_for_directories = true,

    -- ✅ OTIMIZAÇÃO: Define a aparência da janela (flutuante e centralizada)
    popup_layout = {
      width = "90%",
      height = "90%",
    },

    -- Suas configurações existentes
    keymaps = {
      show_help = "<f1>",
    },
  },
}
