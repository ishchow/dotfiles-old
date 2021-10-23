lua <<EOF
  local cmp = require'cmp'

  cmp.setup({
    snippet = {
      expand = function(args)
        require('luasnip').lsp_expand(args.body)
      end,
    },
    mapping = {
      ['<C-d>'] = cmp.mapping.scroll_docs(-4),
      ['<C-f>'] = cmp.mapping.scroll_docs(4),
      ['<C-Space>'] = cmp.mapping.complete(),
      ['<C-e>'] = cmp.mapping.close(),
      ['<CR>'] = cmp.mapping.confirm({
        select = true,
      }),
    },
    sources = cmp.config.sources({
      { name = "nvim_lua" },
      { name = "path" },
      { name = 'nvim_lsp' },
      { name = 'luasnip' },
      { name = 'buffer', keyword_length = 5 },
    }),
    experimental = {
      native_menu = false,
      ghost_text = true,
    },
  })
EOF
