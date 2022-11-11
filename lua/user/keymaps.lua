-- Shorten function name
local keymap = vim.keymap.set
-- Silent keymap option
local opts = { silent = true }

--Remap space as leader key
keymap("", "<Space>", "<Nop>", opts)
vim.g.mapleader = " "

-- Modes
--   normal_mode = "n",
--   insert_mode = "i",
--   visual_mode = "v",
--   visual_block_mode = "x",
--   term_mode = "t",
--   command_mode = "c",

-- Normal --
-- Better window navigation
keymap("n", "<c-h>", "<c-w>h", opts)
keymap("n", "<c-j>", "<c-w>j", opts)
keymap("n", "<c-k>", "<c-w>k", opts)
keymap("n", "<c-l>", "<c-w>l", opts)

-- And window navigation with arrows
keymap("n", "<c-Left>", "<c-w>h", opts)
keymap("n", "<c-Down>", "<c-w>j", opts)
keymap("n", "<c-Up>", "<c-w>k", opts)
keymap("n", "<c-Right>", "<c-w>l", opts)

-- Resize window
keymap("n", "<C-S-K>", ":resize +2<CR>", opts) -- <CR> stands for Carage Return, means press enter.
keymap("n", "<C-S-J>", ":resize -2<CR>", opts)
keymap("n", "<C-S-H>", ":vertical resize -2<CR>", opts)
keymap("n", "<C-S-L>", ":vertical resize +2<CR>", opts)

-- Resize window with arrows
keymap("n", "<C-S-Up>", ":resize +2<CR>", opts) -- <CR> stands for Carage Return, means press enter.
keymap("n", "<C-S-Down", ":resize -2<CR>", opts)
keymap("n", "<C-S-Left>", ":vertical resize -2<CR>", opts)
keymap("n", "<C-S-Right>", ":vertical resize +2<CR>", opts)

-- Navigate buffers
keymap("n", "<S-l>", ":bnext<CR>", opts)
keymap("n", "<S-h>", ":bprevious<CR>", opts)

-- Navigate buffers with arrows
keymap("n", "<S-Right>", ":bnext<CR>", opts)
keymap("n", "<S-Left>", ":bprevious<CR>", opts)

-- Clear highlights
keymap("n", "<leader>h", "<cmd>nohlsearch<CR>", opts)

-- Close buffers
keymap("n", "<S-q>", "<cmd>Bdelete!<CR>", opts)

-- Better paste
keymap("v", "p", '"_dP', opts)

-- Insert --
-- Press jk fast to enter
keymap("i", "jk", "<ESC>", opts)

-- Visual --
-- Stay in indent mode
keymap("v", "<", "<gv", opts)
keymap("v", ">", ">gv", opts)

-- Move text up and down
keymap("v", "<A-j>", ":m .+1<CR>==", opts)
keymap("v", "<A-k>", ":m .-2<CR>==", opts)
keymap("v", "p", '"_dP', opts)

-- Visual Block --
-- Move text up and down
keymap("x", "J", ":move '>+1<CR>gv-gv", opts)
keymap("x", "K", ":move '<-2<CR>gv-gv", opts)
keymap("x", "<A-j>", ":move '>+1<CR>gv-gv", opts)
keymap("x", "<A-k>", ":move '<-2<CR>gv-gv", opts)

-- Plugins --

-- NvimTree
keymap("n", "<leader>e", ":NvimTreeToggle<CR>", opts)

-- Telescope
keymap("n", "<leader>ff", ":Telescope find_files<CR>", opts)
keymap("n", "<leader>ft", ":Telescope live_grep<CR>", opts)
keymap("n", "<leader>fp", ":Telescope projects<CR>", opts)
keymap("n", "<leader>fb", ":Telescope buffers<CR>", opts)

-- Git
keymap("n", "<leader>gg", "<cmd>lua _LAZYGIT_TOGGLE()<CR>", opts)

-- Comment
-- see https://github.com/numToStr/Comment.nvim/tree/master/lua/Comment
keymap("n", "<leader>/", "<Plug>(comment_toggle_linewise_current)", opts)
keymap("x", "<leader>/", "<Plug>(comment_toggle_linewise_visual)", opts)

-- DAP
keymap("n", "<leader>db", "<cmd>lua require'dap'.toggle_breakpoint()<cr>", opts)
keymap("n", "<leader>dc", "<cmd>lua require'dap'.continue()<cr>", opts)
keymap("n", "<leader>di", "<cmd>lua require'dap'.step_into()<cr>", opts)
keymap("n", "<leader>do", "<cmd>lua require'dap'.step_over()<cr>", opts)
keymap("n", "<leader>dO", "<cmd>lua require'dap'.step_out()<cr>", opts)
keymap("n", "<leader>dr", "<cmd>lua require'dap'.repl.toggle()<cr>", opts)
keymap("n", "<leader>dl", "<cmd>lua require'dap'.run_last()<cr>", opts)
keymap("n", "<leader>du", "<cmd>lua require'dapui'.toggle()<cr>", opts)
keymap("n", "<leader>dt", "<cmd>lua require'dap'.terminate()<cr>", opts)

-- Lsp Stuff, Do not uncomment, for refference only.
-- keymap(bufnr, "n", "gD", "<cmd>lua vim.lsp.buf.declaration()<CR>", opts)
-- keymap(bufnr, "n", "gd", "<cmd>lua vim.lsp.buf.definition()<CR>", opts)
-- keymap(bufnr, "n", "K", "<cmd>lua vim.lsp.buf.hover()<CR>", opts)
-- keymap(bufnr, "n", "gI", "<cmd>lua vim.lsp.buf.implementation()<CR>", opts)
-- keymap(bufnr, "n", "gr", "<cmd>lua vim.lsp.buf.references()<CR>", opts)
-- keymap(bufnr, "n", "gl", "<cmd>lua vim.diagnostic.open_float()<CR>", opts)
-- keymap(bufnr, "n", "<leader>lf", "<cmd>lua vim.lsp.buf.formatting()<cr>", opts)
-- keymap(bufnr, "n", "<leader>li", "<cmd>LspInfo<cr>", opts)
-- keymap(bufnr, "n", "<leader>lI", "<cmd>LspInstallInfo<cr>", opts)
-- keymap(bufnr, "n", "<leader>la", "<cmd>lua vim.lsp.buf.code_action()<cr>", opts)
-- keymap(bufnr, "n", "<leader>lj", "<cmd>lua vim.diagnostic.goto_next({buffer=0})<cr>", opts)
-- keymap(bufnr, "n", "<leader>lk", "<cmd>lua vim.diagnostic.goto_prev({buffer=0})<cr>", opts)
-- keymap(bufnr, "n", "<leader>lr", "<cmd>lua vim.lsp.buf.rename()<cr>", opts)
-- keymap(bufnr, "n", "<leader>ls", "<cmd>lua vim.lsp.buf.signature_help()<CR>", opts)
-- keymap(bufnr, "n", "<leader>lq", "<cmd>lua vim.diagnostic.setloclist()<CR>", opts)

-- Folding
-- See: https://neovim.io/doc/user/fold.html
-- "zf" create fold, use visual mode or zf + motion.
-- "zc" close fold
-- "zo" open_fold
-- "zd" delete 1 fold under curser.

-- Marks
-- ma	set mark a at current cursor location
-- 'a	jump to line of mark a (first non-blank character in line)
-- `a	jump to position (line and column) of mark a
-- d'a	delete from current line to line of mark a
-- d`a	delete from current cursor position to position of mark a
-- c'a	change text from current line to line of mark a
-- y`a	yank text to unnamed buffer from cursor to position of mark a
-- :marks	list all the current marks
-- :marks aB	list marks a, B

-- NERDTree Menu. Use j/k/enter and the shortcuts indicated
-- ==========================================================
-- > (a)dd a childnode
--   (m)ove the current node
--   (d)elete the current node
--   (r)eveal in Finder the current node
--   (o)pen the current node with system editor
--   (q)uicklook the current node
--   (c)opy the current node
-- Add a childnode
