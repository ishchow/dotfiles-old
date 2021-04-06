" Automatically generated packer.nvim plugin loader code

if !has('nvim-0.5')
  echohl WarningMsg
  echom "Invalid Neovim version for packer.nvim!"
  echohl None
  finish
endif

packadd packer.nvim

try

lua << END
local package_path_str = "/home/ishaat/.cache/nvim/packer_hererocks/2.1.0-beta3/share/lua/5.1/?.lua;/home/ishaat/.cache/nvim/packer_hererocks/2.1.0-beta3/share/lua/5.1/?/init.lua;/home/ishaat/.cache/nvim/packer_hererocks/2.1.0-beta3/lib/luarocks/rocks-5.1/?.lua;/home/ishaat/.cache/nvim/packer_hererocks/2.1.0-beta3/lib/luarocks/rocks-5.1/?/init.lua"
local install_cpath_pattern = "/home/ishaat/.cache/nvim/packer_hererocks/2.1.0-beta3/lib/lua/5.1/?.so"
if not string.find(package.path, package_path_str, 1, true) then
  package.path = package.path .. ';' .. package_path_str
end

if not string.find(package.cpath, install_cpath_pattern, 1, true) then
  package.cpath = package.cpath .. ';' .. install_cpath_pattern
end

local function try_loadstring(s, component, name)
  local success, err = pcall(loadstring(s))
  if not success then
    print('Error running ' .. component .. ' for ' .. name)
    error(err)
  end
end

_G.packer_plugins = {
  VOoM = {
    loaded = true,
    path = "/home/ishaat/.local/share/nvim/site/pack/packer/start/VOoM"
  },
  ["auto-pairs"] = {
    loaded = true,
    path = "/home/ishaat/.local/share/nvim/site/pack/packer/start/auto-pairs"
  },
  ["fzterm.nvim"] = {
    loaded = true,
    path = "/home/ishaat/.local/share/nvim/site/pack/packer/start/fzterm.nvim"
  },
  ["gina.vim"] = {
    loaded = true,
    path = "/home/ishaat/.local/share/nvim/site/pack/packer/start/gina.vim"
  },
  ["goyo.vim"] = {
    loaded = true,
    path = "/home/ishaat/.local/share/nvim/site/pack/packer/start/goyo.vim"
  },
  indentLine = {
    loaded = true,
    path = "/home/ishaat/.local/share/nvim/site/pack/packer/start/indentLine"
  },
  ["is.vim"] = {
    loaded = true,
    path = "/home/ishaat/.local/share/nvim/site/pack/packer/start/is.vim"
  },
  ["lightline.vim"] = {
    loaded = true,
    path = "/home/ishaat/.local/share/nvim/site/pack/packer/start/lightline.vim"
  },
  ["limelight.vim"] = {
    loaded = true,
    path = "/home/ishaat/.local/share/nvim/site/pack/packer/start/limelight.vim"
  },
  ["lspsaga.nvim"] = {
    loaded = true,
    path = "/home/ishaat/.local/share/nvim/site/pack/packer/start/lspsaga.nvim"
  },
  ["nvim-compe"] = {
    loaded = true,
    path = "/home/ishaat/.local/share/nvim/site/pack/packer/start/nvim-compe"
  },
  ["nvim-deardiary"] = {
    loaded = true,
    path = "/home/ishaat/.local/share/nvim/site/pack/packer/start/nvim-deardiary"
  },
  ["nvim-lightbulb"] = {
    loaded = true,
    path = "/home/ishaat/.local/share/nvim/site/pack/packer/start/nvim-lightbulb"
  },
  ["nvim-lspconfig"] = {
    loaded = true,
    path = "/home/ishaat/.local/share/nvim/site/pack/packer/start/nvim-lspconfig"
  },
  ["nvim-treesitter"] = {
    loaded = true,
    path = "/home/ishaat/.local/share/nvim/site/pack/packer/start/nvim-treesitter"
  },
  ["packer.nvim"] = {
    loaded = false,
    path = "/home/ishaat/.local/share/nvim/site/pack/packer/opt/packer.nvim"
  },
  ["quick-scope"] = {
    loaded = true,
    path = "/home/ishaat/.local/share/nvim/site/pack/packer/start/quick-scope"
  },
  sonokai = {
    loaded = true,
    path = "/home/ishaat/.local/share/nvim/site/pack/packer/start/sonokai"
  },
  tcomment_vim = {
    loaded = true,
    path = "/home/ishaat/.local/share/nvim/site/pack/packer/start/tcomment_vim"
  },
  ["todo.txt-vim"] = {
    loaded = true,
    path = "/home/ishaat/.local/share/nvim/site/pack/packer/start/todo.txt-vim"
  },
  ["vim-floaterm"] = {
    loaded = true,
    path = "/home/ishaat/.local/share/nvim/site/pack/packer/start/vim-floaterm"
  },
  ["vim-gitgutter"] = {
    loaded = true,
    path = "/home/ishaat/.local/share/nvim/site/pack/packer/start/vim-gitgutter"
  },
  ["vim-grepper"] = {
    loaded = true,
    path = "/home/ishaat/.local/share/nvim/site/pack/packer/start/vim-grepper"
  },
  ["vim-jinja"] = {
    loaded = true,
    path = "/home/ishaat/.local/share/nvim/site/pack/packer/start/vim-jinja"
  },
  ["vim-lexical"] = {
    loaded = true,
    path = "/home/ishaat/.local/share/nvim/site/pack/packer/start/vim-lexical"
  },
  ["vim-pencil"] = {
    loaded = true,
    path = "/home/ishaat/.local/share/nvim/site/pack/packer/start/vim-pencil"
  },
  ["vim-sandwich"] = {
    loaded = true,
    path = "/home/ishaat/.local/share/nvim/site/pack/packer/start/vim-sandwich"
  },
  ["vim-simple-todo"] = {
    loaded = true,
    path = "/home/ishaat/.local/share/nvim/site/pack/packer/start/vim-simple-todo"
  },
  ["vim-visual-star-search"] = {
    loaded = true,
    path = "/home/ishaat/.local/share/nvim/site/pack/packer/start/vim-visual-star-search"
  },
  ["vim-vsnip"] = {
    loaded = true,
    path = "/home/ishaat/.local/share/nvim/site/pack/packer/start/vim-vsnip"
  }
}

END

catch
  echohl ErrorMsg
  echom "Error in packer_compiled: " .. v:exception
  echom "Please check your config for correctness"
  echohl None
endtry
