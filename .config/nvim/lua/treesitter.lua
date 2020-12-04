local configs = require('nvim-treesitter.configs') 

configs.setup {
  ensure_installed = {'bash', 'css', 'html', 'javascript', 'json', 'lua', 'python', 'toml'}, -- one of "all", "maintained" (parsers with maintainers), or a list of languages
    highlight = {
        enable = true,
    },
}
