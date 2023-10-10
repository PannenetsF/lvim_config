-- Set the nvim-tree
-- Make the function globally accessible
_G.set_nvim_tree_width_according_to_filename = function()
    local bufnr = -1

    -- Search for the NvimTree buffer by matching its pattern
    for _, buf in ipairs(vim.api.nvim_list_bufs()) do
        if string.match(vim.api.nvim_buf_get_name(buf), "NvimTree_%d+") then
            bufnr = buf
            break
        end
    end

    if bufnr == -1 then
        print("NvimTree buffer not found.")
        return
    end

    local lines = vim.api.nvim_buf_get_lines(bufnr, 0, -1, false)
    local max_col = 0

    for _, line in ipairs(lines) do
        -- Find the index of the last non-space character in the line
        local last_char_col = #line - #line:match(" *$")
        max_col = math.max(max_col, last_char_col)
    end

    print("Longest filename ends at column:", max_col)

    -- Set the nvim-tree window width
    for _, win in ipairs(vim.api.nvim_list_wins()) do
        if vim.api.nvim_win_get_buf(win) == bufnr then
            vim.api.nvim_win_set_width(win, max_col)
            print("Adjusted NvimTree window width.")
            break
        end
    end
end

local function my_on_attach(bufnr)
  local api = require "nvim-tree.api"

  local function opts(desc)
    return { desc = "nvim-tree: " .. desc, buffer = bufnr, noremap = true, silent = true, nowait = true }
  end

  -- default mappings
  api.config.mappings.default_on_attach(bufnr)

  -- custom mappings
  vim.keymap.set('n', 'L',     set_nvim_tree_width_according_to_filename, opts('Adjust Width'))
end
lvim.builtin.nvimtree.setup.on_attach = my_on_attach
