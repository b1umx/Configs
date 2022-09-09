local path = require('plenary.path')
local cmake = require('cmake')
cmake.setup({
    build_dir = tostring(path:new('{cwd}', 'build'))
})
