-- ~/.config/nvim/lua/theprimeagen/lazy/telescope.lua
return {
  "nvim-telescope/telescope.nvim",
  tag = "0.1.5",
  dependencies = {
    "nvim-lua/plenary.nvim",
    -- 1. Declara a extensão Zotero e sua dependência sqlite.lua aqui
    {
      "jmbuhr/telescope-zotero.nvim",
      dependencies = { "kkharji/sqlite.lua" },
    },
  },

  config = function()
    -- Para facilitar, vamos carregar as 'actions' do telescope em uma variável local
    local actions = require("telescope.actions")
    -- 2. Configuração principal do Telescope
    require("telescope").setup({
      -- Adicione a seção de "defaults" para aplicar a configuração
      defaults = {
        initial_mode = "normal", -- ⭐ Inicia o Telescope em modo normal
                -- ⭐ Adicione esta seção de mapeamentos
        mappings = {
          n = {
            ["q"] = actions.close,
          },
        },
      },
      -- Adiciona a seção de configuração para a extensão zotero
      extensions = {
        zotero = {
          -- Aponta para o seu diretório de dados do Zotero
            zotero_path = os.getenv("HOME") .. "/.var/app/org.zotero.Zotero/data/Zotero",
        },
      },
    })

    -- 3. Carrega a extensão APÓS a configuração
    require("telescope").load_extension("zotero")

    -- Seus atalhos existentes do Telescope
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

    -- 4. Atalho final para o Zotero
    vim.keymap.set("n", "<leader>zc", "<cmd>Telescope zotero<cr>", { desc = "Zotero: Citações" })
  end,
}
