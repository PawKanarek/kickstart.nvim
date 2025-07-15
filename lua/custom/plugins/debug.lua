return {
    'mfussenegger/nvim-dap',
    dependencies = {
        'rcarriga/nvim-dap-ui',
        'nvim-neotest/nvim-nio', -- Required dependency for nvim-dap-ui
        'mfussenegger/nvim-dap-python',
    },
    keys = {
        -- Basic debugging keymaps, feel free to change to your liking!
        { '<F5>',      function() require('dap').continue() end,                                            desc = 'Debug: Start/Continue' },
        { '<F1>',      function() require('dap').step_into() end,                                           desc = 'Debug: Step Into' },
        { '<F2>',      function() require('dap').step_over() end,                                           desc = 'Debug: Step Over' },
        { '<F3>',      function() require('dap').step_out() end,                                            desc = 'Debug: Step Out' },
        { '<leader>b', function() require('dap').toggle_breakpoint() end,                                   desc = 'Debug: Toggle Breakpoint' },
        { '<leader>B', function() require('dap').set_breakpoint(vim.fn.input 'Breakpoint condition: ') end, desc = 'Debug: Set Breakpoint' },
        -- Toggle to see last session result. Without this, you can't see session output in case of unhandled exception.
        { '<F7>',      function() require('dapui').toggle() end,                                            desc = 'Debug: See last session result.' },
    },
    config = function()
        local dap = require('dap')
        local dapui = require('dapui')
        dap.adapters.cppdbg = {
            id = 'cppdbg',
            type = 'executable',
            command = "/Users/raix/.cursor/extensions/ms-vscode.cpptools-1.23.6-darwin-arm64/debugAdapters/bin/OpenDebugAD7",
            options = { detached = false}
        }

        -- dap.configurations.cpp = {
        --     {
        --         name = 'Debug VulkanGame', -- Same name as in launch.json
        --         type = 'cppdbg',
        --         request = 'launch',
        --         -- Use a function to get the current project path
        --         program = function()
        --             return vim.fn.getcwd() .. '/build/VulkanGame'
        --         end,
        --         cwd = '${workspaceFolder}', -- Use the project root as the current working directory
        --         stopAtEntry = false,
        --         MIMode = 'lldb',            -- Important for macOS
        --         externalConsole = false,
        --
        --         -- Replicate the environment variables
        --         environment = {
        --             {
        --                 name = 'VK_ICD_FILENAMES',
        --                 value = function()
        --                     return vim.fn.getcwd()
        --                         .. '/VulkanSDK/1.4.313.1/macOS/share/vulkan/icd.d/MoltenVK_icd.json'
        --                 end,
        --             },
        --             {
        --                 name = 'VK_LAYER_PATH',
        --                 value = function()
        --                     return vim.fn.getcwd() .. '/VulkanSDK/1.4.313.1/macOS/share/vulkan/explicit_layer.d'
        --                 end,
        --             },
        --         },
        --
        --         -- Replicate setupCommands for pretty printing
        --         setupCommands = {
        --             {
        --                 description = 'Enable pretty-printing for lldb',
        --                 text = '-enable-pretty-printing',
        --                 ignoreFailures = true,
        --             },
        --         },
        --     },
        -- }
        -- dap.configurations.c = dap.configurations.cpp

        -- Dap UI setup
        -- For more information, see |:help nvim-dap-ui|
        dapui.setup {
            -- Set icons to characters that are more likely to work in every terminal.
            --    Feel free to remove or use ones that you like more! :)
            --    Don't feel like these are good choices.
            icons = { expanded = '▾', collapsed = '▸', current_frame = '*' },
            controls = {
                icons = {
                    pause = '⏸',
                    play = '▶',
                    step_into = '⏎',
                    step_over = '⏭',
                    step_out = '⏮',
                    step_back = 'b',
                    run_last = '▶▶',
                    terminate = '⏹',
                    disconnect = '⏏',
                },
            },
        }

        -- Change breakpoint icons
        -- vim.api.nvim_set_hl(0, 'DapBreak', { fg = '#e51400' })
        -- vim.api.nvim_set_hl(0, 'DapStop', { fg = '#ffcc00' })
        -- local breakpoint_icons = vim.g.have_nerd_font
        --     and { Breakpoint = '', BreakpointCondition = '', BreakpointRejected = '', LogPoint = '', Stopped = '' }
        --   or { Breakpoint = '●', BreakpointCondition = '⊜', BreakpointRejected = '⊘', LogPoint = '◆', Stopped = '⭔' }
        -- for type, icon in pairs(breakpoint_icons) do
        --   local tp = 'Dap' .. type
        --   local hl = (type == 'Stopped') and 'DapStop' or 'DapBreak'
        --   vim.fn.sign_define(tp, { text = icon, texthl = hl, numhl = hl })
        -- end

        dap.listeners.after.event_initialized['dapui_config'] = dapui.open
        dap.listeners.before.event_terminated['dapui_config'] = dapui.close
        dap.listeners.before.event_exited['dapui_config'] = dapui.close
    end,
}
