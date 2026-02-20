--[[
-- These are settings intended for use with vscode-neovim extension
-- BE SURE TO SET THE NVIM EXECUTABLE LOCATION IN THE SETTINGS
-- IF USING WSL, TICK THE USING WSL OPTION IN THE SETTINGS
-- Check logs for conflicts. If using existing plugins, considering tweaking the config. Location depends on OS
-- Either that from above, or nuke the plugin directory also if it exists. Location depends on the plugin manager
--]]

-- plugin manager bootstrapping
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not (vim.uv or vim.loop).fs_stat(lazypath) then
  local lazyrepo = "https://github.com/folke/lazy.nvim.git"
  local out = vim.fn.system({ "git", "clone", "--filter=blob:none", "--branch=stable", lazyrepo, lazypath })
  if vim.v.shell_error ~= 0 then
    vim.api.nvim_echo({
      { "Failed to clone lazy.nvim:\n", "ErrorMsg" },
      { out,                            "WarningMsg" },
      { "\nPress any key to exit..." },
    }, true, {})
    vim.fn.getchar()
    os.exit(1)
  end
end
vim.opt.rtp:prepend(lazypath)

-- assigning <\> as leader key
vim.g.mapleader = '<BSlash>'

vim.api.nvim_create_autocmd("TextYankPost", {
  callback = function()
    vim.highlight.on_yank()
  end,
})

if vim.g.vscode then
  local vscode = require('vscode')
  -- [VSCODE Settings]
  -- [[
  -- current settings of vscode making use of this neovim config requires the use of binocular extension, which provides telescope-like functionality
  -- it requires the following programs: cargo, ripgrep, fzf, fd, bat, and delta
  -- binocular-cli must also be installed using cargo
  -- bat may be renamed as batcat, if not found, symlink to it in linux based systems as bat under ~/.local
  -- same goes for fd (it may renamed as fdfind)
  --]]
else
  vim.g.mapleader = " " -- <Space> as leader key in neovim native
  -- opening config file on <leader>c; applicable only on linux
  vim.cmd("nmap <leader>c :e ~/.config/nvim/init.lua<cr>")
  --[[Settings applicable exclusively on Neovim application]]
  -- vim line numbers
  vim.opt.number = true
  -- relative line numbering
  vim.opt.relativenumber = true
  -- smart indent
  vim.opt.smartindent = true
end

-- [general options]
-- these options could also affect vscode as well. honestly, i don't keep tabs of which one's working or not for vscode. just hope it works or something
-- syncing system clipboard and nvim's clipboard
vim.opt.clipboard = "unnamedplus"
-- ignore case letters on search
vim.opt.ignorecase = true
-- disable ignore case option if the search pattern contains upper case characters
vim.opt.smartcase = true
-- disables highlight on search
vim.opt.hlsearch = false
-- for more side columns to see where i'm working at
vim.opt.sidescrolloff = 4
-- prevent word wrap
vim.opt.wrap = false


-- groups for autocommands; set to clear if it already exists to prevent autocmd duplication
local textOperationsGroup = vim.api.nvim_create_augroup('textOps', { clear = true })
-- highlight on yank
vim.api.nvim_create_autocmd("TextYankPost", {
  group = textOperationsGroup,
  callback = function()
    vim.hl.on_yank({ higroup = 'Search' })
  end,
})

-- plugin loading
require("lazy").setup({
  spec = {
    {
      -- essential plugin, can't live without it
      "kylechui/nvim-surround",
      version = "^3.0.0", -- Use for stability; omit to use `main` branch for the latest features
      event = "VeryLazy",
      main = "nvim-surround",
      opts = {
      }
    },
    {
      -- qol plugin for sneaking around(?)
      "justinmk/vim-sneak",
      init = function()
        -- disabling sneak highligting
        vim.cmd("highlight link Sneak None")
        vim.cmd("highlight link SneakCurrent None")

      end
    },
    {
	    "romainl/vim-cool",
      cond = true 
    },
  },
  checker = { enabled = true },
})
