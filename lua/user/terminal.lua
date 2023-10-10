-- Shell
-- Check for zsh, then bash, then sh, in that order
if vim.fn.executable("zsh") == 1 then
    vim.o.shell = "/bin/zsh"
elseif vim.fn.executable("bash") == 1 then
    vim.o.shell = "/bin/bash"
else
    vim.o.shell = "/bin/sh"
end

vim.g.maplocalleader = "\\"

-- Terminal Shortcuts
lvim.builtin.which_key.mappings["t"] = {
  name = "+Terminal",
  f = { "<cmd>ToggleTerm<cr>", "Floating terminal" },
  t = { "<cmd>ToggleTerm direction=tab<cr>", "Table terminal" },
  v = { "<cmd>2ToggleTerm size=30 direction=vertical<cr>", "Vertical terminal" },
  h = { "<cmd>2ToggleTerm size=30 direction=horizontal<cr>", "Horizontal terminal" },
}

-- Buffer Actions
lvim.builtin.which_key.mappings["bx"] = { "<cmd>BufferKill<CR>", "Buffer Kill" }


vim.keymap.set('n', '<space>E', vim.diagnostic.open_float)
vim.keymap.set('n', '[d', vim.diagnostic.goto_prev)
vim.keymap.set('n', ']d', vim.diagnostic.goto_next)
vim.keymap.set('n', '<space>q', vim.diagnostic.setloclist)

_G.close_other_buffers = function()
  local bufs=vim.api.nvim_list_bufs()
  local current_buf=vim.api.nvim_get_current_buf()
  for _,i in ipairs(bufs) do
    local bufname = vim.api.nvim_buf_get_name(i)
    if vim.fn.filereadable(bufname) == 1 or vim.fn.isdirectory(bufname) == 1 then
      if i~=current_buf then
          vim.api.nvim_buf_delete(i,{})
      end
    end
  end
end
lvim.builtin.which_key.mappings["bX"] = { ":lua _G.close_other_buffers() <CR>", "Buffer Kill Others" }
