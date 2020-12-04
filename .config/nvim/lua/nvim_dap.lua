-- Import
local dap = require('dap')
local dap_python = require('dap-python')

-- Module
local M = {}
local last_gdb_config

-- ....................................
-- theHamsta/nvim-dap-virtual-text
-- ....................................
vim.g.dap_virtual_text = 'all frames'

-- ....................................
-- mfussenegger/nvim-dap-python
-- ....................................
dap_python.setup('usr/bin/python3')

-- ....................................
-- mfussenegger/nvim-dap
-- ....................................
dap.adapters.cpp = {
    type = 'executable',
    attach = {
        pidProperty = "pid",
        pidSelect = "ask"
    },
    command = 'lldb-vscode', -- my binary was called 'lldb-vscode-11'
    env = { 
        LLDB_LAUNCH_FLAG_LAUNCH_IN_TTY = "YES"
    },
    name = "lldb"
}

M.start_c_debugger = function(args, mi_mode, mi_debugger_path) 
    if args and #args > 0 then
        last_gdb_config = {
            type = "cpp",
            name = args[1],
            request = "launch",
            program = table.remove(args, 1),
            args = args,
            cwd = vim.fn.getcwd(),
            env = function()
                local variables = {}
                for k, v in pairs(vim.fn.environ()) do
                    table.insert(variables, string.format("%s=%s", k, v))
                end
                return variables
            end,
            externalConsole = true,
            MIMode = mi_mode or "gdb",
            MIDebuggerPath = mi_debugger_path or "gdb"
        }
    end

    if not last_gdb_config then
        print('No binary to debug set! Use ":DebugC <binary> <args>" or ":DebugRust <binary> <args>"')
        return
    end

    dap.run(last_gdb_config)
    dap.repl.open()
end

vim.cmd [[
    command! -complete=file -nargs=* DebugC lua require "nvim_dap".start_c_debugger({<f-args>}, "gdb")
]]
vim.cmd [[
    command! -complete=file -nargs=* DebugRust lua require "nvim_dap".start_c_debugger({<f-args>}, "gdb", "rust-gdb")
]]

return M
