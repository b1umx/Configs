local map = vim.api.nvim_set_keymap

-- Управление окнами
map('n', '<A-\\>', ':vsplit<CR>', { noremap = true, silent = true })
map('n', '<A-/>', ':split<CR>', { noremap = true, silent = true })
map('n', '<A-q>', ':wincmd c<CR>', { noremap = true, silent = true })
map('n', '<A-k>', ':wincmd k<CR>', { noremap = true, silent = true })
map('n', '<A-j>', ':wincmd j<CR>', { noremap = true, silent = true })
map('n', '<A-h>', ':wincmd h<CR>', { noremap = true, silent = true })
map('n', '<A-l>', ':wincmd l<CR>', { noremap = true, silent = true })
map('n', '<A-[>', ':wincmd <<CR>', { noremap = true, silent = true })
map('n', '<A-]>', ':wincmd ><CR>', { noremap = true, silent = true })
map('n', '<A-->', ':wincmd -<CR>', { noremap = true, silent = true })
map('n', '<A-+>', ':wincmd +<CR>', { noremap = true, silent = true })

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
map('n', '<leader>fg', '<CMD>Telescope live_grep<CR>', { noremap = true, silent = false })
map('n', '<leader>fb', '<CMD>Telescope buffers<CR>', { noremap = true, silent = false })
map('n', '<leader>ft', '<CMD>Telescope help_tags<CR>', { noremap = true, silent = false })
map('n', '<leader>fe', '<CMD>Telescope diagnostics<CR>', { noremap = true, silent = false })
map('n', '<leader>fr', '<CMD>Telescope lsp_references<CR>', { noremap = true, silent = false })

-- Манипуляция с интерфейсом
map('n', '<leader>n', ':set nu! rnu!<CR>', { noremap = true, silent = true })
map('n', '<leader>h', ':nohl<CR>', { noremap = true, silent = true })

-- Управление LSP
map('n', '<leader>e', '<CMD>lua vim.diagnostic.open_float()<CR>', { noremap = true, silent = true })
map('n', '<leader>lq', '<CMD>lua vim.lsp.stop_client(vim.lsp.get_active_clients())<CR>', { noremap = true, silent = true })

-- Управление отладчиком
map('n', '<leader>db', '<CMD>lua require("dap").toggle_breakpoint()<CR>', { noremap = true, silent = true })
map('n', '<leader>dn', '<CMD>lua require("dap").step_over()<CR>', { noremap = true, silent = true })
map('n', '<leader>di', '<CMD>lua require("dap").step_into()<CR>', { noremap = true, silent = true })
map('n', '<leader>dc', '<CMD>lua require("dap").continue()<CR>', { noremap = true, silent = true })

-- Управление CMake
map('n', '<leader>cc', ':CMake configure<CR>', { noremap = true, silent = true })
map('n', '<leader>cb', ':CMake build<CR>', { noremap = true, silent = true })
map('n', '<leader>cba', ':CMake build all<CR>', { noremap = true, silent = true })
map('n', '<leader>cr', ':CMake run<CR>', { noremap = true, silent = true })
map('n', '<leader>cd', ':CMake debug<CR>', { noremap = true, silent = true })
map('n', '<leader>ct', ':CMake select_target<CR>', { noremap = true, silent = true })
map('n', '<leader>cx', ':CMake cancel<CR>', { noremap = true, silent = true })

