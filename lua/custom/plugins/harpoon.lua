return {
    'ThePrimeagen/harpoon',
    branch = 'harpoon2',
    dependencies = {
        'nvim-lua/plenary.nvim',
        'nvim-telescope/telescope.nvim',
    },
    config = function()
        local harpoon = require 'harpoon'
        harpoon:setup()

        local conf = require('telescope.config').values
        local function toggle_telescope(harpoon_files)
            local file_paths = {}
            for _, item in ipairs(harpoon_files.items) do
                table.insert(file_paths, item.value)
            end

            require('telescope.pickers')
                .new({}, {
                    prompt_title = 'Harpoon',
                    finder = require('telescope.finders').new_table {
                        results = file_paths,
                    },
                    previewer = conf.file_previewer {},
                    sorter = conf.generic_sorter {},
                })
                :find()
        end

        vim.keymap.set('n', '<leader>h', function() toggle_telescope(harpoon:list()) end,
            { desc = 'Open harpoon window' })
        vim.keymap.set('n', '<leader>ha', function() harpoon:list():add() end, { desc = 'Add to harpoon' })
        vim.keymap.set('n', '<leader>h1', function() harpoon:list():select(1) end, { desc = 'Add harpoon 1' })
        vim.keymap.set('n', '<leader>h2', function() harpoon:list():select(2) end, { desc = 'Add harpoon 2' })
        vim.keymap.set('n', '<leader>h3', function() harpoon:list():select(3) end, { desc = 'Add harpoon 3' })
        vim.keymap.set('n', '<leader>h4', function() harpoon:list():select(4) end, { desc = 'Add harpoon 4' })

        -- Toggle previous & next buffers stored within Harpoon list
        vim.keymap.set('n', '<leader>hp', function() harpoon:list():prev() end, { desc = 'Toggle prev hapoon' })
        vim.keymap.set('n', '<leader>hn', function() harpoon:list():next() end, { desc = 'Toggle next harpoon' })
    end,
}
