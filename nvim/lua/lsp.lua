-- LSP setup using the built-in `vim.lsp.config` / `vim.lsp.enable` API.
-- nvim-lspconfig (installed in lua/plugins.lua) provides the server
-- definitions; you only need to enable the ones you use.

-- Servers to enable. Add a line per installed server, e.g. via `:Mason`,
-- `brew install` etc. Blank config `{}` uses nvim-lspconfig defaults.
local servers = {
  lua_ls = {}, -- Lua, incl. this nvim config
  -- bashls = {},        -- bash
  -- ts_ls = {},         -- TypeScript/JavaScript
  -- rust_analyzer = {}, -- Rust
  -- pyright = {},       -- Python
  -- gopls = {},         -- Go
}

-- Advertise blink.cmp's extra completion capabilities to every server
vim.lsp.config('*', {
  capabilities = require('blink.cmp').get_lsp_capabilities(),
})

-- Teach lua_ls about the `vim` global and this config's runtime
vim.lsp.config('lua_ls', {
  settings = {
    Lua = {
      runtime = { version = 'LuaJIT' },
      diagnostics = { globals = { 'vim' } },
      workspace = { checkThirdParty = false },
    },
  },
})

for name in pairs(servers) do
  vim.lsp.enable(name)
end

-- Diagnostics UI
vim.diagnostic.config({
  virtual_text = true,
  severity_sort = true,
  underline = true,
  float = { border = 'rounded', source = 'if_many' },
})

-- Buffer-local keymaps when a client attaches.
-- Note: 0.11+ also ships defaults: K hover, grn rename, gra code action,
-- grr references, gri implementation, gO signature help.
vim.api.nvim_create_autocmd('LspAttach', {
  group = vim.api.nvim_create_augroup('my-lsp-attach', { clear = true }),
  callback = function(args)
    local opts = { buffer = args.buf, silent = true }
    local map = function(lhs, rhs, desc)
      opts.desc = desc
      vim.keymap.set('n', lhs, rhs, opts)
    end

    map('gd', vim.lsp.buf.definition, 'LSP: go to definition')
    map('gD', vim.lsp.buf.declaration, 'LSP: go to declaration')
    map('gl', vim.diagnostic.open_float, 'Diagnostics: show under cursor')
    map('<leader>rn', vim.lsp.buf.rename, 'LSP: rename')
    map('<leader>ca', vim.lsp.buf.code_action, 'LSP: code action')
    map('<leader>f', function()
      vim.lsp.buf.format({ async = true })
    end, 'LSP: format buffer')
  end,
})
