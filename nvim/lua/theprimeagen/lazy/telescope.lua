-- ~/.config/nvim/lua/theprimeagen/lazy/telescope.lua
return {
  "nvim-telescope/telescope.nvim",
  tag = "0.1.5",
  dependencies = {
    "nvim-lua/plenary.nvim",
    -- Declara o plugin do Zotero e sua dependência aqui
    {
      "jmbuhr/telescope-zotero.nvim",
      dependencies = { "kkharji/sqlite.lua" },
    },
  },

  config = function()
    -- Configuração principal do Telescope
    require("telescope").setup({
      -- Configuração específica para a extensão zotero
      extensions = {
        zotero = {
          -- Aponta para o seu diretório de dados do Zotero
          zotero_path = os.getenv("HOME") .. "/Zotero",
        },
      },
    })

    -- Carrega a extensão APÓS a configuração
    require("telescope").load_extension("zotero")

    -- Seus atalhos existentes
    local builtin = require('telescope.builtin')
    vim.keymap.set('n', '<leader>pf', builtin.find_files, {})
    vim.keymap.set('n', '<C-p>', builtin.git_files, {})
    vim.keymap.set('n', '<leader>pr', builtin.oldfiles, { desc = "Arquivos Recentes" })
    vim.keymap.set('n', '<leader>pws', function()
        local word = vim.fn.expand("<cword>")
        builtin.grep_string({ search = word })
    end)
    vim.keymap.set('n', '<leader>pWs', function()
        local word = vim.fn.expand("<cWORD>")
        builtin.grep_string({ search = word })
    end)
    vim.keymap.set('n', '<leader>ps', function()
        builtin.grep_string({ search = vim.fn.input("Grep > ") })
    end)
    vim.keymap.set('n', '<Leader>pg', builtin.live_grep, {
        desc = '[F]ind by [G]rep'
    })
    vim.keymap.set('n', '<leader>vh', builtin.help_tags, {})

    -- Atalho final para o Zotero
    vim.keymap.set("n", "<leader>zc", "<cmd>Telescope zotero<cr>", { desc = "Zotero: Citações" })
  end,
}
