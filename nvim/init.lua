vim.opt.clipboard = 'unnamedplus'
vim.g.tex_flavor = 'latex'

-- Highlights the matching parenthesis(or bracket) in insert mode
vim.opt.showmatch = true

-- Search is case insensitive unless it has a capital letter
vim.opt.ignorecase = true
vim.opt.smartcase = true

-- Highlights search
vim.opt.hlsearch = true

-- Incremental search
vim.opt.incsearch = true

vim.opt.tabstop = 4
vim.opt.softtabstop = 4
vim.opt.expandtab = true
vim.opt.shiftwidth = 4

vim.opt.autoindent = true
vim.opt.cindent = true

vim.opt.number = true

-- Creates a matching set of curly braces
-- https://vim.fandom.com/wiki/Quick_way_to_insert_opening_and_closing_braces_for_programmers
vim.keymap.set('i', '<C-F>', '{<CR>}<C-O>O')

vim.opt.scrolloff = 5

local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
  vim.fn.system({
    "git",
    "clone",
    "--filter=blob:none",
    "https://github.com/folke/lazy.nvim.git",
    "--branch=stable", -- latest stable release
    lazypath,
  })
end
vim.opt.rtp:prepend(lazypath)

vim.g.mapleader = " " -- Make sure to set `mapleader` before lazy so your mappings are correct

require("lazy").setup({
    {
    	"L3MON4D3/LuaSnip",
    	-- follow latest release.
    	version = "v2.*", -- Replace <CurrentMajor> by the latest released major (first number of latest release)
    	-- install jsregexp (optional!).
    	build = "make install_jsregexp"
    },
    {'williamboman/mason.nvim'},
    {'williamboman/mason-lspconfig.nvim'},

    {'VonHeikemen/lsp-zero.nvim', branch = 'v3.x'},
    {'neovim/nvim-lspconfig'},
    {'hrsh7th/cmp-nvim-lsp'},
    {'hrsh7th/nvim-cmp'},
    {"lervag/vimtex"},
})

local lsp_zero = require('lsp-zero')

lsp_zero.on_attach(function(client, bufnr)
  -- see :help lsp-zero-keybindings
  -- to learn the available actions
  lsp_zero.default_keymaps({buffer = bufnr})
end)

require('mason').setup({})
require('mason-lspconfig').setup({
  ensure_installed = {'clangd', 'pyright'},
  handlers = {
    lsp_zero.default_setup,
  },
})

local ls = require("luasnip")
-- Load snippets from ~/.config/nvim/LuaSnip/
require("luasnip.loaders.from_lua").load({paths = "~/.config/nvim/LuaSnip"})
-- Setting LuaSnip config
ls.setup({
    store_selection_keys = "<Tab>",
    update_events = {"TextChanged", "TextChangedI"},
    enable_autosnippets = true,
})

vim.keymap.set({"i"}, "<C-K>", function() ls.expand() end, {silent = true})
vim.keymap.set({"i", "s"}, "<C-L>", function() ls.jump( 1) end, {silent = true})
vim.keymap.set({"i", "s"}, "<C-J>", function() ls.jump(-1) end, {silent = true})

vim.keymap.set({"i", "s"}, "<C-E>", function()
	if ls.choice_active() then
		ls.change_choice(1)
	end
end, {silent = true})

vim.g.vimtex_view_method = "zathura"
vim.keymap.set("n", "<leader>v", "<plug>(vimtex-view)")
