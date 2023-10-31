-- icons
lvim.use_icons = false
-- gruvbox italics
vim.g.gruvbox_material_disable_italic_comment = true
-- Color Scheme Settings
vim.o.background = "dark"

local hours = tonumber(os.date("%H"))
if hours <= 8 or hours >= 19 then
  lvim.colorscheme = "catppuccin-frappe"
else
  lvim.colorscheme = "catppuccin-latte"
end

