-- Plugin management with the built-in `vim.pack` (Neovim 0.12+)
-- Install: restart nvim after editing this file. Update: :vim.pack.update

vim.pack.add({
  -- Completion engine: LSP, snippets, path, buffer + cmdline completion.
  -- Pinned to the stable 1.x line; the `main` branch is unstable V2.
  -- On a tag, blink downloads its prebuilt Rust fuzzy matcher on first run
  -- (falls back to the Lua implementation automatically).
  { src = 'https://github.com/Saghen/blink.cmp', version = vim.version.range('1') },

  -- JSON snippets for the snippet source (used by vim.snippet)
  'https://github.com/rafamadriz/friendly-snippets',

  -- Community-maintained LSP server configurations (works with the
  -- built-in `vim.lsp.config` / `vim.lsp.enable` API, see lua/lsp.lua)
  'https://github.com/neovim/nvim-lspconfig',
})

require('blink.cmp').setup({
  -- 'super-tab': Tab accepts, like VS Code. Alternatives:
  -- 'default' (Ctrl-y accepts), 'enter', 'none'.
  -- All presets also give: Ctrl-space trigger, Ctrl-n/p select, Ctrl-e dismiss,
  -- Ctrl-k signature toggle.
  keymap = { preset = 'super-tab' },

  appearance = { nerd_font_variant = 'mono' },

  completion = {
    -- Inline hint of the selected item, and auto docs popup
    ghost_text = { enabled = true },
    documentation = { auto_show = true, auto_show_delay_ms = 250 },
  },

  -- Signature help while typing function arguments
  signature = { enabled = true },

  sources = {
    default = { 'lsp', 'path', 'snippets', 'buffer' },
  },

  fuzzy = { implementation = 'prefer_rust_with_warning' },
})
