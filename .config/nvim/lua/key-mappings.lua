local map = vim.api.nvim_set_keymap

-- Управление окнами
map('n', '<A-\\>', ':vsplit<CR>', { noremap = true, silent = true })
map('n', '<A-/>', ':split<CR>', { noremap = true, silent = true })
map('n', '<A-q>', ':wincmd c<CR>', { noremap = true, silent = true })
map('n', '<A-k>', ':wincmd k<CR>', { noremap = true, silent = true })
map('n', '<A-j>', ':wincmd j<CR>', { noremap = true, silent = true })
map('n', '<A-h>', ':wincmd h<CR>', { noremap = true, silent = true })
map('n', '<A-l>', ':wincmd l<CR>', { noremap = true, silent = true })

-- Открытие/закрытие боковой панели навигации
map('n', '<leader>b', ':NvimTreeRefresh<CR>:NvimTreeToggle<CR>', { noremap = true, silent = true })

-- Перемещение строк
map('n', '<A-Down>', ':m .+1<CR>==', { noremap = true, silent = true })
map('n', '<A-Up>', ':m .-2<CR>==', { noremap = true, silent = true })
map('i', '<A-Down>', '<Esc>:m .+1<CR>==gi', { noremap = true, silent = true })
map('i', '<A-Up>', '<Esc>:m .-2<CR>==gi', { noremap = true, silent = true })
map('v', '<A-Down>', ':m \'>+1<CR>gv=gv', { noremap = true, silent = true })
map('v', '<A-Up>', ':m \'<-2<CR>gv=gv', { noremap = true, silent = true })
map('n', '<A-Right>', '>>', { noremap = true, silent = true })
map('n', '<A-Left>', '<<', { noremap = true, silent = true })

-- Управление буферами
map('n', '<leader>w', ':w<CR>', { noremap = true, silent = false })
map('n', '<leader>q', ':Bdelete<CR>', { noremap = true, silent = true })
map('n', '<A-,>', ':BufferLineCyclePrev<CR>', { noremap = true, silent = true })
map('n', '<A-.>', ':BufferLineCycleNext<CR>', { noremap = true, silent = true })

-- Поиск
map('n', '<leader>ff', '<CMD>Telescope find_files<CR>', { noremap = true, silent = false })
map('n', '<leader>fg', '<CMD>Telescope find_files<CR>', { noremap = true, silent = false })
map('n', '<leader>fb', '<CMD>Telescope find_files<CR>', { noremap = true, silent = false })
map('n', '<leader>fh', '<CMD>Telescope find_files<CR>', { noremap = true, silent = false })

-- Манипуляция с интерфейсом
map('n', '<leader>n', ':set nu! rnu!<CR>', { noremap = true, silent = true })
map('n', '<leader>h', ':nohl<CR>', { noremap = true, silent = true })

