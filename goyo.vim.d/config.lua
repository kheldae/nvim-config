local fwatch = require 'fwatch'

-- Light/dark theme watch
fwatch.watch(os.getenv("XDG_RUNTIME_DIR") .. "/theme",
    { on_event =
        function()
            vim.defer_fn(vim.fn.SetColor, 10)
            vim.loop.spawn("kitty", { args = { "@", "set-background-opacity", "1" } })
        end
    })
