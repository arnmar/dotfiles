require('core.plugin_config.leap')
require('core.plugin_config.telescope')
require('core.plugin_config.comment')
require('core.plugin_config.lspconfig')
require('core.plugin_config.mini-surround')
require('core.plugin_config.mini-bracketed')
require('core.plugin_config.treesitter')
require('core.plugin_config.indent_blankline')
require('core.plugin_config.cmp')
require('core.plugin_config.mason')
require('core.plugin_config.mason-lspconfig')
require('core.plugin_config.lualine')
require('core.plugin_config.bufferline')

require("neotest").setup({
  adapters = {
    require("neotest-python")
  }
})
