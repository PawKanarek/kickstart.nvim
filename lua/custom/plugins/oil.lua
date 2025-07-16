return {
    'stevearc/oil.nvim',
    config = function()
        require('oil').setup {
            default_file_explorer = true,
            delete_to_trash = true,
            keymaps = {
                ["<BS>"] = { "actions.parent", mode = "n", desc = "Parent folder [Backspace]" },
                ["<CR>"] = "actions.select",
                ["<leader>op"] = { "actions.preview", mode = "n", desc = "[o]il [p]review" },
                ["<leader>oc"] = { "actions.close", mode = "n", desc = "[o]il [c]lose" },
                ["<leader>or"] = {"actions.refresh", desc = "[o]il [R]efresh"},
                ["<leader>o?"] = { "actions.show_help", mode = "n", desc = "[o]il show help[?]" },
                ["<leader>os"] = { "actions.change_sort", mode = "n", desc = "[o]il change [s]ort" },
                ["<leader>oe"] = {"actions.open_external", desc = "[o]il open [e]xternal"},
                ["<leader>oh"] = { "actions.toggle_hidden", mode = "n", desc = "[o]il toggle [h]idden" },
                ["<leader>ot"] = { "actions.toggle_trash", mode = "n", desc = "[o]il toggle [t]rash" },
                ["<leader>oV"] = { "actions.select", opts = { vertical = true }, desc = '[o]il open in [V]ertical' },
                ["<leader>oH"] = { "actions.select", opts = { horizontal = true }, desc = '[o]il open in [H]orizontal' },
                ["<leader>oT"] = { "actions.select", opts = { tab = true }, desc = '[o]il open in [T]ab' },
                ["<leader>ow"] = { "actions.open_cwd", mode = "n", desc = '[o]il open current [w]orking directory' },
                ["<leader>ox"] = { "actions.cd", mode = "n", desc = '[o]il cd ' },
                ["<leader>oz"] = { "actions.cd", opts = { scope = "tab" }, mode = "n", desc = "[o]il cd tab" },
            },
            use_default_keymaps = false,
        }
    end,
}
