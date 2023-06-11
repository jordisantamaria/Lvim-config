-- Read the docs: https://www.lunarvim.org/docs/configuration
-- Video Tutorials: https://www.youtube.com/watch?v=sFA9kX-Ud_c&list=PLhoH5vyxr6QqGu0i7tt_XoVK9v-KvZ3m6
-- Forum: https://www.reddit.com/r/lunarvim/
-- Discord: https://discord.com/invite/Xb9B4Ny
--
--


--[[
lvim is the global options object
Linters should be
filled in as strings with either
a global executable or a path to
an executable
]]
-- THESE ARE EXAMPLE CONFIGS FEEL FREE TO CHANGE TO WHATEVER YOU WANT

-- general

lvim.log.level = "warn"
lvim.format_on_save = false
lvim.colorscheme = "lunarvim"


-- keymappings [view all the defaults by pressing <leader>Lk]
lvim.leader = "space"
-- add your own keymapping
lvim.keys.normal_mode["<C-s>"] = ":w<cr>"

lvim.database = { save_location = '~/.config/nvcode_db', auto_execute = 1 }

-- MY CONFIG
vim.g.goyo_width = 120
vim.g.goyo_height = 95


vim.cmd([[
    augroup cloudformation
        au!
        au BufNewFile,BufRead *.yaml,*.yml set filetype=cloudformation
    augroup END
]])

-- Navigate in command line
vim.cmd([[
    cnoremap <C-p> <Up>
    cnoremap <C-n> <Down>
]])

vim.cmd([[
    let g:workspace_autosave_always = 0
    let g:workspace_autosave = 0
    let g:workspace_autocreate = 1
    let g:workspace_session_directory = $HOME . '/.vim/sessions/'
    let g:workspace_undodir = $HOME . '/.vim/undo/'
    " let g:workspace_autosave_ignore = ['TelescopePrompt', 'NvimTree', '無名', '[Command Line]', 'vim', 'ignored', 'qf']
    let g:nvim_tree_width = 45 "30 by default
    let g:nvim_tree_ignore = [ '.git', '.idea', '.cache', '.undodir' ] "empty by default
    let g:workspace_autosave_files = ['python', 'yaml', 'yml', 'json', 'lua', 'vue', 'markdown', 'make', 'toml', 'sh', 'csv', 'zsh', 'conf', 'dockerfile', 'php', 'typescriptreact']
    let g:workspace_only_git_dir = 1
    function! CleanupStuff()
        NvimTreeClose
    endfunction
    autocmd VimLeavePre * call CleanupStuff()
]])

vim.g.qs_highlight_on_keys = { 'f', 'F', 't', 'T' }

-- For format code to snippet format
vim.cmd([[
    let @s = 'i.jkr"La.jkr"a,jkHj'
]])


-- Toc config
vim.g.vmt_fence_text = 'TOC'
vim.g.vmt_fence_closing_text = '/TOC'
vim.g.vmt_list_item_char = '-'

-- Csv config
vim.g.csv_nomap_space = 1
vim.g.csv_nomap_h = 1
vim.g.csv_nomap_l = 1






-- Use which-key to add extra bindings with the leader-key prefix
lvim.builtin.which_key.mappings["P"] = { "<cmd>Telescope projects<CR>", "Projects" }
lvim.builtin.which_key.mappings["z"] = { "<cmd>TZAtaraxis<CR>", "Zen" }
lvim.builtin.which_key.mappings["v"] = { "<C-W>v", "Split Vertical" }
lvim.builtin.which_key.mappings["h"] = { "<C-W>s", "Split Horizontal" }
lvim.builtin.which_key.mappings["n"] = { "<cmd>nohlsearch<CR>", "No Highlight" }
lvim.builtin.which_key.mappings["T"] = { "<cmd>TSHighlightCapturesUnderCursor<CR>", "Treesitter highlight" }

lvim.builtin.which_key.mappings["a"] = {
  name = "+Actions",
  v = { "<cmd>Codi<cr>", "Virtual REPL on" },
  V = { "<cmd>Codi!<cr>", "Virtual REPL off" },
  l = { "<cmd>Bracey<cr>", "Html live server" },
  L = { "<cmd>BraceyStop<cr>", "Stop Html live server" },
  i = { "<cmd>set ignorecase<cr>", "ignore case" },
  I = { "<cmd>set ignorecase!<cr>", "not ignore case" },
}

lvim.builtin.which_key.mappings["b"] = {
  name = "+Buffer",
  ["1"] = { ":BufferGoto 1<CR>", "Buffer 1" },
  ["2"] = { ":BufferGoto 2<CR>", "Buffer 2" },
  ["3"] = { ":BufferGoto 3<CR>", "Buffer 3" },
  ["4"] = { ":BufferGoto 4<CR>", "Buffer 4" },
  ["5"] = { ":BufferGoto 5<CR>", "Buffer 5" },
  ["6"] = { ":BufferGoto 6<CR>", "Buffer 6" },
  ["7"] = { ":BufferGoto 7<CR>", "Buffer 7" },
  ["8"] = { ":BufferGoto 8<CR>", "Buffer 8" },
  ["9"] = { ":BufferGoto 9<CR>", "Buffer 9" },
  d = { ":bd<CR>", "delete-buffer" },
  o = { ":Bdelete hidden<CR>", "Delete all but current" },
  a = { ":Bdelete all<CR>", "Delete all buffers" },
  h = { ":TSBufToggle highlight<CR>", "Toogle treesitter highlight" },
}

lvim.builtin.which_key.mappings["d"] = {
  name = "+Database",
  t = { ":DBUIToggle<CR>", "db ui toogle" },
  f = { ":DBUIFindBuffer<CR>", "db find buffer" },
  r = { ":DBUIRenameBuffer<CR>", "db rename buffer" },
  l = { ":DBUILastQueryInfo<CR>", "db info last query" },
}

lvim.builtin.which_key.mappings["g"] = {
  name = "+Git",
  b = { ":Gblame<CR>", "blame" },
  B = { ":GBrowse<CR>", "browser current file" },
  d = { ":Gdiffsplit<CR>", "diff split" },
  D = { ":Git diff<CR>", "diff" },
  p = { "<cmd>PreviewHunk<cr>", "Preview Hunk" },
  r = { "<cmd>ResetHunk<cr>", "Reset Hunk" },
  R = { ":ResetBuffer<CR>", "Reset buffer" },
  s = { ":Gstatus<CR>", "status" },
  m = { "<Plug>(git-messenger)", "message" },
  ["1"] = { ":diffget //2<CR>", "Diffget left" },
  ["3"] = { ":diffget //3<CR>", "Diffget right" },
  o = { ":!sh ~/scripts/repo.sh<CR>", "Open repo" },
}

lvim.builtin.which_key.mappings["q"] = {
  name = "+Quickfix",
  n = { ":cnext<CR>", "cnext" },
  p = { ":cprev<CR>", "cprev" },
  o = { ":copen<CR>", "copen" },
  q = { ":cclose<CR>", "cclose" },
  l = { ":clast<CR>", "clast" },
  w = { ":Rg<CR>", "find cursor word" },
  g = { ":Glog %<CR>", "File git history" },
  t = { ":TroubleToggle<CR>", "TroubleToggle errors" },
}

lvim.builtin.which_key.mappings["t"] = {
  name = "+Terminal",
  [";"] = { ":FloatermNew --wintype=normal --height=8<CR>", "Terminal" },
  n = { ":FloatermNew node<CR>", "Node" },
  f = { ":FloatermNew python<CR>", "Python" },
  t = { ":FloatermToggle<CR>", "Python" },
}

lvim.builtin.which_key.mappings["x"] = {
  name = "+Csv",
  h = { ":HiColumn<CR>", "Highlight column" },
  H = { ":HeaderToogle<CR>", "HeaderToogle" },
  d = { ":DeleteColumn<CR>", "Delete column" },
  D = { ":Duplicate<CR>", "Check duplicates in column" },
  w = { ":WhatColumn!<CR>", "Column name" },
  W = { ":WhatColumn<CR>", "Column number" },
  n = { ":NrColumns<CR>", "Num columns" },
  s = { ":SearchInColumn", "Search in column n, /t/" },
}

lvim.builtin.which_key.mappings["c"] = {
  name = "+Cheatsheets",
  c = { ":e ~/projects/cheatsheets/cleanCode/index.md<CR>", "Clean code" },
  r = { ":e ~/projects/cheatsheets/resources/index.md<CR>", "Resources" },
  d = { ":e ~/projects/cheatsheets/docker/index.md<cr>", "Docker" },
  p = { ":e ~/projects/cheatsheets/python/index.md<cr>", "Python" },
  v = { ":e ~/projects/cheatsheets/vue/index.md<cr>", "Vue" },
  s = { ":e ~/projects/cheatsheets/ddd/index.md<cr>", "Software structure" },
  a = { ":e ~/projects/cheatsheets/aws/index.md<cr>", "Aws" },
  t = { ":e ~/projects/cheatsheets/bash/tmux.md<cr>", "Tmux" },
  b = { ":e ~/projects/cheatsheets/bash/index.md<cr>", "Bash" },
  m = { ":e ~/projects/cheatsheets/markdown/README.md<cr>", "Markdown" },
  n = { ":e ~/projects/cheatsheets/bash/vim/mappings.md<cr>", "Nvim" },
  q = { ":e ~/projects/cheatsheets/postgres/index.md<cr>", "postgresql" },
}

vim.cmd([[
  nnoremap <silent> <M-k>  :resize -2<CR>
  nnoremap <silent> <M-j>  :resize +2<CR>
  nnoremap <silent> <M-h>  :vertical resize -2<CR>
  nnoremap <silent> <M-l>  :vertical resize +2<CR>
]])

-- esc with jk
vim.api.nvim_set_keymap('i', 'jk', '<esc>', { noremap = true, silent = true })

-- better indenting
vim.api.nvim_set_keymap('v', '<', '<gv', { noremap = true, silent = true })
vim.api.nvim_set_keymap('v', '>', '>gv', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<', '<<', { noremap = true, silent = true, nowait = true })
vim.api.nvim_set_keymap('n', '>', '>>', { noremap = true, silent = true, nowait = true })
vim.api.nvim_set_keymap('n', '=', '=ii', {})

-- Move line start line end
vim.api.nvim_set_keymap('', 'H', '^', { noremap = true, silent = true })
vim.api.nvim_set_keymap('', 'L', '$', { noremap = true, silent = true })

-- Search word in buffer
vim.api.nvim_set_keymap('n', 's', ':HopWord<CR>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', 'S', ':HopChar1<CR>', { noremap = true, silent = true })

-- Tab switch buffer
vim.api.nvim_set_keymap('n', '<TAB>', ':bnext<CR>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<S-TAB>', ':bprevious<CR>', { noremap = true, silent = true })

-- go to ending of the copied/yank text
vim.api.nvim_set_keymap('v', 'y', 'y`]', { noremap = true, silent = true })
vim.api.nvim_set_keymap('v', 'p', 'p`]', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', 'p', 'p`]', { noremap = true, silent = true })

-- Move by quickfix faster
vim.api.nvim_set_keymap('n', '<C-m>', ':cnext<CR>', { noremap = true, silent = true })

-- Last insertion mark
vim.api.nvim_set_keymap('n', 'g.', '`^', { silent = true })



-- TODO: User Config for predefined plugins
-- After changing plugin config exit and reopen LunarVim, Run :PackerInstall :PackerCompile
lvim.builtin.alpha.active = true
lvim.builtin.alpha.mode = "dashboard"
lvim.builtin.terminal.active = true
lvim.builtin.nvimtree.setup.view.side = "left"
lvim.builtin.nvimtree.setup.renderer.icons.show.git = false

-- if you don't want all the parsers change this to a table of the ones you want
lvim.builtin.treesitter.ensure_installed = {
  "bash",
  "c",
  "javascript",
  "json",
  "lua",
  "python",
  "typescript",
  "css",
  "rust",
  "java",
  "yaml",
  "php"
}

lvim.builtin.treesitter.ignore_install = { "haskell" }
lvim.builtin.treesitter.highlight.enabled = true

vim.cmd("nnoremap <silent> <C-p> <cmd>lua vim.diagnostic.goto_prev()<cr>")
vim.cmd("nnoremap <silent> <C-n> <cmd>lua vim.diagnostic.goto_next()<cr>")



-- Additional Plugins
lvim.plugins = {
  { "jordisantamaria/vim-workspace" }, -- Auto save buffer and session
  { "tpope/vim-fugitive" },            -- :Git for see changes
  { "tpope/vim-rhubarb" },             -- :GBrowse to open current file in github
  { "rhysd/git-messenger.vim" },
  { "unblevable/quick-scope" },        -- Navigation with f or t with colors
  { "tpope/vim-abolish" },             -- For better abrev and change snake_case to camelCase with crs, crc
  { "tpope/vim-surround" },            -- to change surrond indicators like "" or ''
  { "tpope/vim-repeat" },
  { "chrisbra/csv.vim" },
  { "jordisantamaria/nvcode-color-schemes.vim" },
  { "christoomey/vim-tmux-navigator" },
  { "jremmen/vim-ripgrep" }, -- :Rg command for quicklist
  { "junegunn/fzf" },
  { "dhruvasagar/vim-table-mode" },
  -- {"tpope/vim-sleuth"},
  -- {"tpope/vim-dadbod"},
  --   {"kristijanhusak/vim-dadbod-ui"},
  -- {"kristijanhusak/vim-dadbod-completion"},
  { "Asheq/close-buffers.vim" }, -- space b o command to close other buffers
  { "jordisantamaria/vim-replace" },
  -- {"numToStr/FTerm.nvim"}, -- floating terminal
  { "phaazon/hop.nvim" }, -- jump with s
  {"NvChad/nvim-colorizer.lua"}, -- to see hexadecimals like #fff to its color
      {"nvim-treesitter/playground"},
      {"kevinhwang91/nvim-bqf"}, -- better quickfix
  -- {"glepnir/lspsaga.nvim"}, -- no need anymore I think
  {"pantharshit00/vim-prisma"}, -- prisma syntax suport
      {"windwp/nvim-ts-autotag"},






}

require('hop').setup()
require 'colorizer'.setup()
require('nvim-ts-autotag').setup()

vim.api.nvim_set_keymap('n', 's', ":HopChar2<cr>", {silent = true})
vim.api.nvim_set_keymap('n', 'S', ":HopWord<cr>", {silent = true})
