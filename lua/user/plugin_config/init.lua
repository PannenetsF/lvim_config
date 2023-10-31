local config_names = {
  "plugins",
  "vimspector",
  "copilot",
  "nvim-tree",
  "treesitter",
  "true-zen",
  "wrapping",
  "goto-preview",
  "lsp_help",
}

for _, name in ipairs(config_names)
do
  reload('user.plugin_config.' .. name)
end
