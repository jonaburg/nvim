-- ################# Basic settings dependent on plugins ################ --

-- ================= Visualization ================= --

vim.o.termguicolors = true
vim.o.linebreak = true
vim.o.background = 'dark'
vim.cmd('colorscheme habamax')
vim.api.nvim_command('let g:palenight_terminal_italics=1')
vim.api.nvim_command('let g:everforest_transparent_background=1')
vim.api.nvim_command('let g:everforest_better_performance=1')
vim.api.nvim_command('let g:everforest_background=\"medium\"')

