-- ################# Basic settings dependent on plugins ################ --

-- ================= Visualization ================= --

vim.o.termguicolors = true
vim.o.linebreak = true
vim.o.cursorline = true
--vim.o.cursorcolumn = true
--vim.o.background = 'light'
--vim.cmd('colorscheme PaperColorSlim')
vim.o.background = 'dark'
vim.cmd('colorscheme nightfly')
--vim.cmd('colorscheme underwater')
--vim.cmd('colorscheme muon')
--vim.cmd('colorscheme habamax')
--vim.cmd('colorscheme everforest')

vim.api.nvim_command('let g:palenight_terminal_italics=1')
vim.api.nvim_command('let g:everforest_transparent_background=1')
vim.api.nvim_command('let g:everforest_better_performance=1')
vim.api.nvim_command('let g:everforest_background=\"medium\"')

require("nvim-tree").setup()
