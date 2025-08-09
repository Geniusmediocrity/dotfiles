-- nvim/lua/plugins/lsp/python_env.lua

local function is_dir(path)
    local stat = vim.uv.fs_stat(path)
    return stat and stat.type == "directory" or false
end

local function find_venv_ancestor(start_path)
    local venv_names = { ".venv", "venv", "env", ".env", "myenv" } -- исправлено: .myemv → myenv
    local root_markers = { ".git", "pyproject.toml", "setup.py", "requirements.txt", "Pipfile", "poetry.lock" }

    local current = vim.fs.normalize(start_path)  -- нормализуем путь

    while current do
        for _, name in ipairs(venv_names) do
            local venv_path = vim.fs.joinpath(current, name)
            if is_dir(venv_path) then
                local python_exec = vim.uv.os_uname().sysname == "Windows"
                    and vim.fs.joinpath(venv_path, "Scripts", "python.exe")
                    or vim.fs.joinpath(venv_path, "bin", "python")
                if vim.uv.fs_stat(python_exec) then
                    return python_exec
                end
            end
        end

        -- Проверим, достигли ли корня ФС
        local parent = vim.fs.dirname(current)
        if parent == current then break end
        current = parent
    end

    return nil
end

local function get_py_venv()
    local bufname = vim.api.nvim_buf_get_name(0)
    local start_path = bufname == "" and vim.fn.getcwd() or vim.fn.fnamemodify(bufname, ":p:h")

    local python_path = find_venv_ancestor(start_path)
    if python_path then return python_path end

    -- Fallback: ищем python в PATH
    return vim.fn.exepath("python3") or vim.fn.exepath("python") or "python"
end

return {
    get_py_venv = get_py_venv,
}
