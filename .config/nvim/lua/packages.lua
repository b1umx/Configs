-- Автоматически устанавливаем packer
local fn = vim.fn
local install_path = fn.stdpath('data') .. '/site/pack/packer/start/packer.nvim'

if fn.empty(fn.glob(install_path)) > 0 then
    fn.system({ 'git', 'clone', '--depth', '1', 'https://github.com/wbthomason/packer.nvim',
        install_path })
    vim.o.runtimepath = vim.fn.stdpath('data') .. '/site/pack/*/start/*,' .. vim.o.runtimepath
end

-- Автоматическая перезагрузка Neovim после сохранения этого файла
vim.cmd [[
    augroup packer_user_config
        autocmd!
        autocmd BufWritePost packages.lua source <afile> | PackerSync
    augroup end
]]

local packer = require('packer')

return packer.startup(function(use)
    -- Сам packer
    use 'wbthomason/packer.nvim'

    -- Цветовая схема
    use 'sainnhe/sonokai'

    -- Строка статуса
    use {
        'nvim-lualine/lualine.nvim',
        requires = { 'kyazdani42/nvim-web-devicons', opt = true }
    }

    -- Строка открытых буферов
    use {
        'akinsho/bufferline.nvim',
        tag = "v2.*",
        requires = { 'kyazdani42/nvim-web-devicons', opt = true }
    }

    -- Аккуратное удаление буферов
    use 'famiu/bufdelete.nvim'

    -- Навигация по файловой системе
    use {
        'kyazdani42/nvim-tree.lua',
        requires = { 'kyazdani42/nvim-web-devicons', opt = true }
    }

    -- Подсветка, редактирование и навигация по коду
    use 'nvim-treesitter/nvim-treesitter'

    -- Коллекция конфигураций для LSP-клиента
    use 'neovim/nvim-lspconfig'

    -- Автодополнение
    use 'hrsh7th/nvim-cmp'
    use 'hrsh7th/cmp-nvim-lsp'
    use 'hrsh7th/cmp-nvim-lsp-signature-help'
    use 'hrsh7th/cmp-buffer'
    use 'hrsh7th/cmp-path'
    use {
        'L3MON4D3/LuaSnip',
        requires = { 'saadparwaiz1/cmp_luasnip' }
    }

    -- Поиск
    use {
        'nvim-telescope/telescope.nvim',
        tag = '0.1.0',
        requires = { 'nvim-lua/plenary.nvim' }
    }

    -- Комментирование строк по сочетанию клавиш
    use {
        'numToStr/Comment.nvim',
        config = function()
            require('Comment').setup()
        end
    }
end)

