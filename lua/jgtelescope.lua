local actions = require('telescope.actions')

require('telescope').setup{
  defaults = {
    mappings = {
      i = {
        ['<C-u>'] = false,
        ["<C-g>"] = actions.close
      }
    }
  },
--  pickers = {
--	  command_history = {
--		  sorter = require'telescope.sorters'.get_fuzzy_with_index_bias
--	  }
--  }
}
