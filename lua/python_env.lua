
local M = {}

local path = require('lspconfig.util').path

local function get_pipenv_dir()
    return vim.fn.trim(vim.fn.system 'pipenv --venv')
end

local function get_poetry_dir()
    local p = vim.fn.trim(vim.fn.system 'poetry env info -p')
    if string.sub(p, 0, 1) == "/" then
        return vim.fn.trim(vim.fn.system 'poetry env info -p')
    end
    return ''
end

local function get_venv_dir(workspace)
    return path.join(workspace)
end

local function get_pdm_package()
  return vim.fn.trim(vim.fn.system 'pdm info --packages')
end

local function get_python_dir(workspace)
  local poetry_match = vim.fn.glob(path.join(workspace, 'poetry.lock'))
  if poetry_match ~= '' then
    return get_poetry_dir()
  end

  local pipenv_match = vim.fn.glob(path.join(workspace, 'Pipfile.lock'))
  if pipenv_match ~= '' then
    return get_pipenv_dir()
  end

  -- Find and use virtualenv in workspace directory.
  for _, pattern in ipairs { '*', '.*' } do
    local match = vim.fn.glob(path.join(workspace, pattern, 'pyvenv.cfg'))
    if match ~= '' then
      return path.dirname(match)
    end
  end

  return ''
end

local function get_py_sys()
    return '/usr/bin/python'
end

local function py_bin_dir(dir)
  if is_windows then
    return path.join(dir, 'Scripts;')
  else
    return path.join(dir, 'bin', 'python')
  end
end

M.env = function(workspace)
    local envp = get_poetry_dir()
    local poetryExists = vim.fn.glob(path.join(workspace, 'poetry.lock'))
    local venvExists = vim.fn.glob(path.join(workspace, 'venv'))
    if poetryExists ~= '' then
        envp = get_poetry_dir()
        print("Using poetry.")
    end
    if venvExists ~= '' then
        envp = venvExists
        print(string.format("Using %s.", envp))
    end
    envp = path.join(envp, "bin", "python")

    if poetryExists == '' and venvExists == '' then
        print("Using system python.")
        envp = get_py_sys()
    end
    if vim.fn.executable(envp) ~= 1 or envp == '' then
        error("Cannot source env.")
    end
    return envp
end

-- PEP 582 support
M.pep582 = function(root_dir)
  local pdm_match = vim.fn.glob(path.join(root_dir, 'pdm.lock'))
  if pdm_match ~= '' then
    _package = get_pdm_package()
  end

  if _package ~= '' then
    return path.join(_package, 'lib')
  end
end

M.conda = function(root_dir) end

return M
