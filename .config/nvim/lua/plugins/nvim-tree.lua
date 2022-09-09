local nvim_tree = require('nvim-tree')

nvim_tree.setup({
    open_on_setup = true,
    view = {
        adaptive_size = true,
        float = {
            enable = false
        }
    },
    renderer = {
        full_name = true,
        highlight_opened_files = 'icon',
        symlink_destination = false
    },
    git = {
        enable = true,
        ignore = false,
        timeout = 400
    },
    filters = {
        custom = { ".git/" }
    },
    actions = {
        open_file = {
            resize_window = true
        }
    }
})

