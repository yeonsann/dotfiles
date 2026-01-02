return {
    'nvim-treesitter/nvim-treesitter',
    build = ':TSUpdate',
    config = function()
        require 'nvim-treesitter'.install { 'lua', 'typescript', 'javascript', 'zig', 'cpp', 'c' }
    end
}
