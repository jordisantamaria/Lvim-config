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
lvim.colorscheme = "onedarker"

-- keymappings [view all the defaults by pressing <leader>Lk]
lvim.leader = "space"
-- add your own keymapping
lvim.keys.normal_mode["<C-s>"] = ":w<cr>"


-- MY CONFIG
vim.g.goyo_width=120
vim.g.goyo_height=95


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
    let g:workspace_autosave_always = 1
    let g:workspace_autocreate = 1
    let g:workspace_session_directory = $HOME . '/.vim/sessions/'
    let g:workspace_undodir = $HOME . '/.vim/undo/'
    " let g:workspace_autosave_ignore = ['TelescopePrompt', 'NvimTree', '無名', '[Command Line]', 'vim', 'ignored', 'qf']
    let g:nvim_tree_width = 45 "30 by default
    let g:nvim_tree_ignore = [ '.git', '.idea', '.cache', '.undodir' ] "empty by default
    let g:workspace_autosave_files = ['python', 'typescript', 'yaml', 'yml', 'javascript', 'json', 'lua', 'vue', 'markdown', 'make', 'toml', 'sh', 'csv', 'zsh', 'conf', 'dockerfile', 'php']
    let g:workspace_only_git_dir = 1

    function! CleanupStuff()
        NvimTreeClose
    endfunction

    autocmd VimLeavePre * call CleanupStuff()
]])

vim.g.qs_highlight_on_keys = {'f', 'F', 't', 'T'}

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



-- unmap a default keymapping
-- lvim.keys.normal_mode["<C-Up>"] = ""
-- edit a default keymapping
-- lvim.keys.normal_mode["<C-q>"] = ":q<cr>"

-- Change Telescope navigation to use j and k for navigation and n and p for history in both input and normal mode.
-- we use protected-mode (pcall) just in case the plugin wasn't loaded yet.
-- local _, actions = pcall(require, "telescope.actions")
-- lvim.builtin.telescope.defaults.mappings = {
--   -- for input mode
--   i = {
--     ["<C-j>"] = actions.move_selection_next,
--     ["<C-k>"] = actions.move_selection_previous,
--     ["<C-n>"] = actions.cycle_history_next,
--     ["<C-p>"] = actions.cycle_history_prev,
--   },
--   -- for normal mode
--   n = {
--     ["<C-j>"] = actions.move_selection_next,
--     ["<C-k>"] = actions.move_selection_previous,
--   },
-- }

-- Use which-key to add extra bindings with the leader-key prefix
lvim.builtin.which_key.mappings["P"] = { "<cmd>Telescope projects<CR>", "Projects" }
lvim.builtin.which_key.mappings["z"] = { "<cmd>TZAtaraxis<CR>", "Zen" }
lvim.builtin.which_key.mappings["t"] = {
  name = "+Trouble",
  r = { "<cmd>Trouble lsp_references<cr>", "References" },
  f = { "<cmd>Trouble lsp_definitions<cr>", "Definitions" },
  d = { "<cmd>Trouble lsp_document_diagnostics<cr>", "Diagnostics" },
  q = { "<cmd>Trouble quickfix<cr>", "QuickFix" },
  l = { "<cmd>Trouble loclist<cr>", "LocationList" },
  w = { "<cmd>Trouble lsp_workspace_diagnostics<cr>", "Diagnostics" },
}
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
        ["1"] = {":BufferGoto 1<CR>", "Buffer 1"},
        ["2"] = {":BufferGoto 2<CR>", "Buffer 2"},
        ["3"] = {":BufferGoto 3<CR>", "Buffer 3"},
        ["4"] = {":BufferGoto 4<CR>", "Buffer 4"},
        ["5"] = {":BufferGoto 5<CR>", "Buffer 5"},
        ["6"] = {":BufferGoto 6<CR>", "Buffer 6"},
        ["7"] = {":BufferGoto 7<CR>", "Buffer 7"},
        ["8"] = {":BufferGoto 8<CR>", "Buffer 8"},
        ["9"] = {":BufferGoto 9<CR>", "Buffer 9"},
        d = {":BufferClose<CR>", "delete-buffer"},
        o = {":Bdelete hidden<CR>", "Delete all but current"},
        a = {":Bdelete all<CR>", "Delete all buffers"},
        h = {":TSBufToggle highlight<CR>", "Toogle treesitter highlight"},
}

lvim.builtin.which_key.mappings["d"] = {
        name = "+Database",
        t = {":DBUIToggle<CR>", "db ui toogle"},
        f = {":DBUIFindBuffer<CR>", "db find buffer"},
        r = {":DBUIRenameBuffer<CR>", "db rename buffer"},
        l = {":DBUILastQueryInfo<CR>", "db info last query"},
}

lvim.builtin.which_key.mappings["g"] = {
        name = "+Git",
        b = {":Gblame<CR>", "blame"},
        B = {":GBrowse<CR>", "browser current file"},
        d = {":Gdiffsplit<CR>", "diff split"},
        D = {":Git diff<CR>", "diff"},
		p = {"<cmd>PreviewHunk<cr>", "Preview Hunk"},
        r = {"<cmd>ResetHunk<cr>", "Reset Hunk"},
        R = {":ResetBuffer<CR>", "Reset buffer"},
        s = {":Gstatus<CR>", "status"},
        m = {"<Plug>(git-messenger)", "message"},
        ["1"] = {":diffget //2<CR>", "Diffget left"},
        ["3"] = {":diffget //3<CR>", "Diffget right"},
        o = {":!sh ~/scripts/repo.sh<CR>", "Open repo"},
}

lvim.builtin.which_key.mappings["q"] = {
        name = "+Quickfix",
        n = {":cnext<CR>"        , "cnext"},
        p = {":cprev<CR>"        , "cprev"},
        o = {":copen<CR>"        , "copen"},
        q = {":cclose<CR>"       , "cclose"},
        l = {":clast<CR>"        , "clast"},
        w = {":Rg<CR>"           , "find cursor word"},
        g = {":Glog %<CR>"       , "File git history"},
        t = {":TroubleToggle<CR>"       , "TroubleToggle errors"},
}

lvim.builtin.which_key.mappings["m"] = {
        t = {":TroubleToggle<CR>"       , "TroubleToggle errors"},
}

lvim.builtin.which_key.mappings["t"] = {
        name = "+Terminal",
        [";"] = {":FloatermNew --wintype=normal --height=8<CR>", "Terminal"},
        n = {":FloatermNew node<CR>", "Node"},
        f = {":FloatermNew python<CR>", "Python"},
        t = {":FloatermToggle<CR>", "Python"},
}

lvim.builtin.which_key.mappings["x"] = {
        name = "+Csv",
        h = {":HiColumn<CR>", "Highlight column"},
        H = {":HeaderToogle<CR>", "HeaderToogle"},
        d = {":DeleteColumn<CR>", "Delete column"},
        D = {":Duplicate<CR>", "Check duplicates in column"},
        w = {":WhatColumn!<CR>", "Column name"},
        W = {":WhatColumn<CR>", "Column number"},
        n = {":NrColumns<CR>", "Num columns"},
        s = {":SearchInColumn", "Search in column n, /t/"},
}

lvim.builtin.which_key.mappings["c"] = {
        name = "+Cheatsheets",
        c = {":e ~/projects/cheatsheets/cleanCode/index.md<CR>", "Clean code"},
        r = {":e ~/projects/cheatsheets/resources/index.md<CR>", "Resources"},
        d = {":e ~/projects/cheatsheets/docker/index.md<cr>", "Docker"},
        p = {":e ~/projects/cheatsheets/python/index.md<cr>", "Python"},
        v = {":e ~/projects/cheatsheets/vue/index.md<cr>", "Vue"},
        s = {":e ~/projects/cheatsheets/ddd/index.md<cr>", "Software structure"},
        a = {":e ~/projects/cheatsheets/aws/index.md<cr>", "Aws"},
        t = {":e ~/projects/cheatsheets/bash/tmux.md<cr>", "Tmux"},
        b = {":e ~/projects/cheatsheets/bash/index.md<cr>", "Bash"},
        m = {":e ~/projects/cheatsheets/markdown/README.md<cr>", "Markdown"},
        n = {":e ~/projects/cheatsheets/bash/vim/mappings.md<cr>", "Nvim"},
        q = {":e ~/projects/cheatsheets/postgres/index.md<cr>", "postgresql"},
}

vim.cmd([[
  nnoremap <silent> <M-k>  :resize -2<CR>
  nnoremap <silent> <M-j>  :resize +2<CR>
  nnoremap <silent> <M-h>  :vertical resize -2<CR>
  nnoremap <silent> <M-l>  :vertical resize +2<CR>
]])

-- better indenting
vim.api.nvim_set_keymap('v', '<', '<gv', {noremap = true, silent = true})
vim.api.nvim_set_keymap('v', '>', '>gv', {noremap = true, silent = true})
vim.api.nvim_set_keymap('n', '<', '<<', {noremap = true, silent = true, nowait = true})
vim.api.nvim_set_keymap('n', '>', '>>', {noremap = true, silent = true, nowait = true})
vim.api.nvim_set_keymap('n', '=', '=ii', {})

-- Move line start line end
vim.api.nvim_set_keymap('', 'H', '^', {noremap = true, silent = true})
vim.api.nvim_set_keymap('', 'L', '$', {noremap = true, silent = true})

-- Search word in buffer
vim.api.nvim_set_keymap('n', 's', ':HopWord<CR>', {noremap = true, silent = true})
vim.api.nvim_set_keymap('n', 'S', ':HopChar1<CR>', {noremap = true, silent = true})

-- Tab switch buffer
vim.api.nvim_set_keymap('n', '<TAB>', ':bnext<CR>', {noremap = true, silent = true})
vim.api.nvim_set_keymap('n', '<S-TAB>', ':bprevious<CR>', {noremap = true, silent = true})

-- go to ending of the copied/yank text
vim.api.nvim_set_keymap('v', 'y', 'y`]', {noremap = true, silent = true})
vim.api.nvim_set_keymap('v', 'p', 'p`]', {noremap = true, silent = true})
vim.api.nvim_set_keymap('n', 'p', 'p`]', {noremap = true, silent = true})

-- Move by quickfix faster
vim.api.nvim_set_keymap('n', '<C-m>', ':cnext<CR>', {noremap = true, silent = true})

-- Last insertion mark
vim.api.nvim_set_keymap('n', 'g.', '`^', {silent = true})



-- TODO: User Config for predefined plugins
-- After changing plugin config exit and reopen LunarVim, Run :PackerInstall :PackerCompile
lvim.builtin.dashboard.active = true
lvim.builtin.terminal.active = true
lvim.builtin.nvimtree.setup.view.side = "left"
lvim.builtin.nvimtree.show_icons.git = 0

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

vim.cmd("nnoremap <silent> <C-p> :Lspsaga diagnostic_jump_prev<CR>")
vim.cmd("nnoremap <silent> <C-n> :Lspsaga diagnostic_jump_next<CR>")
-- generic LSP settings

-- ---@usage disable automatic installation of servers
-- lvim.lsp.automatic_servers_installation = false

-- ---@usage Select which servers should be configured manually. Requires `:LvimCacheRest` to take effect.
-- See the full default list `:lua print(vim.inspect(lvim.lsp.override))`
-- vim.list_extend(lvim.lsp.override, { "pyright" })

-- ---@usage setup a server -- see: https://www.lunarvim.org/languages/#overriding-the-default-configuration
-- local opts = {} -- check the lspconfig documentation for a list of all possible options
-- require("lvim.lsp.manager").setup("pylsp", opts)

-- you can set a custom on_attach function that will be used for all the language servers
-- See <https://github.com/neovim/nvim-lspconfig#keybindings-and-completion>
-- lvim.lsp.on_attach_callback = function(client, bufnr)
--   local function buf_set_option(...)
--     vim.api.nvim_buf_set_option(bufnr, ...)
--   end
--   --Enable completion triggered by <c-x><c-o>
--   buf_set_option("omnifunc", "v:lua.vim.lsp.omnifunc")
-- end
-- you can overwrite the null_ls setup table (useful for setting the root_dir function)
-- lvim.lsp.null_ls.setup = {
--   root_dir = require("lspconfig").util.root_pattern("Makefile", ".git", "node_modules"),
-- }
-- or if you need something more advanced
-- lvim.lsp.null_ls.setup.root_dir = function(fname)
--   if vim.bo.filetype == "javascript" then
--     return require("lspconfig/util").root_pattern("Makefile", ".git", "node_modules")(fname)
--       or require("lspconfig/util").path.dirname(fname)
--   elseif vim.bo.filetype == "php" then
--     return require("lspconfig/util").root_pattern("Makefile", ".git", "composer.json")(fname) or vim.fn.getcwd()
--   else
--     return require("lspconfig/util").root_pattern("Makefile", ".git")(fname) or require("lspconfig/util").path.dirname(fname)
--   end
-- end

-- -- set a formatter, this will override the language server formatting capabilities (if it exists)
-- local formatters = require "lvim.lsp.null-ls.formatters"
-- formatters.setup {
--   { exe = "black" },
--   {
--     exe = "prettier",
--     ---@usage specify which filetypes to enable. By default a providers will attach to all the filetypes it supports.
--     filetypes = { "typescript", "typescriptreact" },
--   },
-- }

-- -- set additional linters
-- local linters = require "lvim.lsp.null-ls.linters"
-- linters.setup {
--   { exe = "black" },
--   {
--     exe = "eslint_d",
--     ---@usage specify which filetypes to enable. By default a providers will attach to all the filetypes it supports.
--     filetypes = { "javascript", "javascriptreact" },
--   },
-- }

-- Additional Plugins
lvim.plugins = {
    {"tpope/vim-fugitive"},
    {"tpope/vim-rhubarb"},
    {"rhysd/git-messenger.vim"},
    {"unblevable/quick-scope"}, -- Navigation with f or t
    {"kana/vim-textobj-user"}, -- common utils for textobj plugins
    {"kana/vim-textobj-entire"}, -- Object for file ae, file no empty lines ie
    {"kana/vim-textobj-lastpat"}, -- Object for search, i/ a/
    {"kana/vim-textobj-indent"}, -- For select text on same indent level with ai
    {"kana/vim-textobj-line"}, -- For select text on same indent level with ai
    {"Julian/vim-textobj-variable-segment"}, -- Object for select a variable segment, so snake case or camel case segment, with iv or av
    {"bkad/CamelCaseMotion"}, -- Motion for camelcase snakecase part
    {"jordisantamaria/vim-visual-star-search"}, -- Search visual text selected with *
    {"tpope/vim-abolish"}, -- For better abrev and change snake_case to camelCase with crs, crc
    {"jordisantamaria/vim-workspace"}, -- Auto save buffer and session
    {"tpope/vim-surround"},
    {"tpope/vim-repeat"},
    {"chrisbra/csv.vim"},
    {"jordisantamaria/nvcode-color-schemes.vim"},
    {"christoomey/vim-tmux-navigator"},
    {"jremmen/vim-ripgrep"},
    {"junegunn/fzf"},
    {"airblade/vim-rooter"},
    {"voldikss/vim-floaterm"},
    {"Pocco81/TrueZen.nvim"},
    {"junegunn/vim-easy-align"},
    {"mzlogin/vim-markdown-toc"},
    {"dhruvasagar/vim-table-mode"},
    {"tpope/vim-sleuth"},
    {"Asheq/close-buffers.vim"},
    {"tpope/vim-dadbod"},
    {"kristijanhusak/vim-dadbod-ui"},
    {"kristijanhusak/vim-dadbod-completion"},
    {"jordisantamaria/vim-replace"},
    {"metakirby5/codi.vim"},
    {"iamcco/markdown-preview.nvim"},
    {"numToStr/FTerm.nvim"},
    {"monaqa/dial.nvim"},
    {"nacro90/numb.nvim"},
    {"phaazon/hop.nvim"},
    {"norcalli/nvim-colorizer.lua"},
    {"windwp/nvim-spectre"},
    {"simrat39/symbols-outline.nvim"},
    {"nvim-treesitter/playground"},
    {"kevinhwang91/nvim-bqf"}, -- better quickfix
  }

require('hop').setup({create_hl_autocmd = true})

vim.api.nvim_set_keymap('n', 's', ":HopChar2<cr>", {silent = true})
vim.api.nvim_set_keymap('n', 'S', ":HopWord<cr>", {silent = true})
-- Autocommands (https://neovim.io/doc/user/autocmd.html)
-- lvim.autocommands.custom_groups = {
--   { "BufWinEnter", "*.lua", "setlocal ts=8 sw=8" },
-- }

