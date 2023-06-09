local dap = require("dap")


pythonPath = function()
    -- debugpy supports launching an application with a different interpreter then the one used to launch debugpy itself.
    -- The code below looks for a `venv` or `.venv` folder in the current directly and uses the python within.
    -- You could adapt this - to for example use the `VIRTUAL_ENV` environment variable.
    local cwd = vim.fn.getcwd()
    if vim.fn.executable(cwd .. '/venv/bin/python') == 1 then
        return cwd .. '/venv/bin/python'
    elseif vim.fn.executable(cwd .. '/.venv/bin/python') == 1 then
        return cwd .. '/.venv/bin/python'
    else
        return '/usr/bin/python'
    end
end;

function SetPythonDapMode(mode, file)
    mode = mode or "single";
    file = file or "${file}";

    if mode == "single" then
        dap.configurations.python = {
            {
                name = "Launch file";
                type = 'python';
                request = "launch";
                program = file;
            }
        }
    elseif mode == "pytest" then
        dap.configurations.python = {
            {
                name= "Pytest: Current File",
                type= 'python',
                request= "launch",
                module= "pytest",
                args= {
                    file,
                    "-sv",
                    "--log-cli-level=INFO",
                    "--log-file=test_out.log"
                },
                console= "integratedTerminal",
            }
        }
    end;
end;

dap.adapters.python = {
  type = 'executable';
  command = pythonPath();
  args = { '-m', 'debugpy.adapter' };
}

SetPythonDapMode();

vim.keymap.set("n", "<leader>db", dap.toggle_breakpoint)
vim.keymap.set("n", "<leader>dr", dap.repl.open)
vim.keymap.set("n", "<leader>dc", dap.continue)
