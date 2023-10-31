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
        modes = {                    -- configurations per mode
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
  },
  {
    "rmagatti/goto-preview",
    config = function()
      require('goto-preview').setup {}
    end
  },
  {
    "lervag/vimtex",
    ft = "tex",
    config = function()
      vim.g.vimtex_view_general_viewer = 'okular'
      vim.cmd("call vimtex#init()")
      vim.g.tex_comment_nospell = 1
      vim.g.vimtex_compiler_progname = 'nvr'
      vim.g.vimtex_view_general_options = [[--unique file:@pdf\#src:@line@tex]]
      vim.g.vimtex_view_general_options_latexmk = '--unique'
    end,
  },
  {
    "ray-x/lsp_signature.nvim",
    event = "VeryLazy",
    opts = {},
    config = function(_, opts) require 'lsp_signature'.setup(opts) end
  },
  {
    "catppuccin/nvim",
    name = "catppuccin"
  }
}
