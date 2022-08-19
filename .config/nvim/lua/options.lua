local opt = vim.opt
local g = vim.g
local api = vim.api

opt.mouse = 'a'
opt.clipboard = 'unnamedplus'
opt.swapfile = false
opt.completeopt = 'menuone,noinsert,noselect'

opt.number = true          -- Показывать номера строк
opt.foldenable = false     -- Отлючить по умолчанию сворачивание блоков текста
opt.foldmethod = 'syntax'  -- Сворачивать блоки в соответствии с синтаксисом
opt.colorcolumn = '120'    -- Рисовать ограничитель длины строки
opt.splitright = true      -- Открывать вертикальные панели справа
opt.splitbelow = true      -- Открывать горизонтальные панели снизу
opt.ignorecase = true      -- Игнорировать регистр букв при поиске
opt.smartcase = true       -- Поиск с заглавными буквами чувствителен к регистру
opt.wrap = false           -- Отключить перенос строк
opt.termguicolors = true   -- Включить 24-битные цвета
opt.laststatus = 2         -- Всегда показывать строку статуса 

opt.expandtab = true
opt.shiftwidth = 4
opt.tabstop = 4
opt.smartindent = false

opt.hidden = true
opt.history = 100
opt.lazyredraw = true
opt.synmaxcol = 240
opt.updatetime = 700

opt.shortmess:append "sI"

g.mapleader = ' '

local disabled_built_ins = {
   "2html_plugin",
   "getscript",
   "getscriptPlugin",
   "gzip",
   "logipat",
   "netrw",
   "netrwPlugin",
   "netrwSettings",
   "netrwFileHandlers",
   "matchit",
   "tar",
   "tarPlugin",
   "rrhelper",
   "spellfile_plugin",
   "vimball",
   "vimballPlugin",
   "zip",
   "zipPlugin",
   "tutor",
   "rplugin",
   "synmenu",
   "optwin",
   "compiler",
   "bugreport",
   "ftplugin",
}

for _, plugin in pairs(disabled_built_ins) do
   g["loaded_" .. plugin] = 1
end


-- api.nvim_create_autocmd("InsertLeave", {
--     command = "!setxkbmap us",
--     desc = "Switches the keyboard layout to US when leaving insert mode"
-- })

