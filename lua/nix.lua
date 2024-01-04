local has_nix = false

Nix = {}

local f = io.open('/nix')
if f then
    f:close()
    has_nix = true
end

function Nix:new()
    if _G.nix then
        return _G.nix   -- Invoke global instance
    end
    local t = { conf_root = "", fetchlist = {} }
    t.conf_root = vim.api.nvim_list_runtime_paths()[1]
    setmetatable(t, { __index = self })
    _G.nix = t          -- Pin global instance
    return t
end

function Nix:path(pkg, path)
    if has_nix
    then
        table.insert(self.fetchlist, pkg)
        local drv = io.popen("nix --extra-experimental-features 'nix-command flakes' build --quiet --no-link --print-out-paths " .. self.conf_root .. "#" .. pkg):read()
        return drv .. path
    else
        return ""
    end
end

function Nix:shell(pkg, cmd)
    if has_nix and (vim.call('executable', cmd[1]) == 0)
    then        -- Generate nix shell wrapper
        table.insert(self.fetchlist, pkg)
        local cmdl = { "nix", "--extra-experimental-features", "nix-command flakes", "shell", self.conf_root .. "#" .. pkg, "-c" }
        for k, el in pairs(cmd) do
            table.insert(cmdl, el)
        end
        return cmdl
    else
        return cmd
    end
end

function _G.nixsh_prefetch()
    local op = { title = "LSP Servers over Nix" }
    if not has_nix then
        vim.notify("Auto-installing language servers requires Nix.", "error", op)
        return
    end
    local args = { "--extra-experimental-features", "nix-command flakes", "build", "--quiet", "--no-link" }
    for key, value in pairs(_G.nix.fetchlist) do
        table.insert(args, _G.nix.conf_root .. '#' .. value)
    end
    vim.notify("Prefetching language servers, hang tight...", "info", op)
    vim.loop.spawn("nix", { args = args },
        function()
            vim.notify("Done!", "info", op)
        end)
end
