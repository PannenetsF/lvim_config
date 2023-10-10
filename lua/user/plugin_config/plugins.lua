-- Plugin Configuration
lvim.plugins = {
  "github/copilot.vim",
  "stevearc/dressing.nvim",
  {
    "Pocco81/auto-save.nvim",
     config = function()
      require("auto-save").setup()
    end,
  },
  "APZelos/blamer.nvim",
  "sainnhe/gruvbox-material",
  {
    "Pocco81/true-zen.nvim",
    config = function()
      require("true-zen").setup {
        modes = { -- configurations per mode
          ataraxis = {
            minimum_writing_area = { -- minimum size of main window
              width = 80,
              height = 44,
            },
            padding = { -- padding windows
              left = 200,
              right = 200,
              top = 0,
              bottom = 0,
            },
          },
          minimalist = {
            options = {
              relativenumber = true,
            }
          }
        }
      }
    end,
  },
  "puremourning/vimspector",
  {
    "andrewferrier/wrapping.nvim",
    config = function()
        require("wrapping").setup {
          create_keymaps = false,
      }
    end,
  }
}
