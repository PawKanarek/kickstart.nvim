return {
    'loctvl842/monokai-pro.nvim',
    config = function()
        require("monokai-pro").setup({
            filter = "classic"
        })
        vim.cmd([[colorscheme monokai-pro]])
    end
}
