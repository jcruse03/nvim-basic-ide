-- Make sure to install colorschemes in pluggins.lua

-- Set colorscheme here
local colorscheme = "dracula"

-- Do not change here. If scheme_type is not detected,
-- set it in manualy in colorscheme setting below
-- eg: See tokyonight colorscheme below.
local scheme_type = "lua"

-- The "_" here throws away the return value from the pcall function.
--  pcall is like a try catch block, where the return value is the error_message.
--  SEE: https://riptutorial.com/lua/example/16000/using-pcall
--  If we needed the return value we could put a variable there.
--  The ".." is string concatination in lua.
--  This is the lua version.
local status_ok, _ = pcall(require, colorscheme)
if not status_ok then
	-- May not always detect scheme_type
	-- Set in colorscheme if statements below if this is the case.
	scheme_type = "vim"
	status_ok, _ = pcall(vim.cmd, "colorscheme " .. colorscheme)
	if not status_ok then
		-- Set sane default.
		-- TODO Might want to change this to a built in colorscheme.
		vim.cmd("colorscheme darkplus")
		vim.notify("colorscheme " .. colorscheme .. " not found, check plugins.lua and colorscheme.lua")
		return
	end
end

-- Colorscheme Settings --
-- Make a new elseif for each colorscheme if setup is needed.

-- Onedark https://github.com/navarasu/onedark.nvim --
if colorscheme == "onedark" then
	require(colorscheme).setup({
		-- Main options --
		style = "darker", -- Default theme style. Choose between 'dark', 'darker', 'cool', 'deep', 'warm', 'warmer' and 'light'
		transparent = true, -- Show/hide background
		term_colors = true, -- Change terminal color as per the selected theme style
		ending_tildes = false, -- Show the end-of-buffer tildes. By default they are hidden
		cmp_itemkind_reverse = false, -- reverse item kind highlights in cmp menu

		-- toggle theme style ---
		toggle_style_key = nil, -- keybind to toggle theme style. Leave it nil to disable it, or set it to a string, for example "<leader>ts"
		toggle_style_list = { "dark", "darker", "cool", "deep", "warm", "warmer", "light" }, -- List of styles to toggle between

		-- Change code style ---
		-- Options are italic, bold, underline, none
		-- You can configure multiple style with comma seperated, For e.g., keywords = 'italic,bold'
		code_style = {
			comments = "italic",
			keywords = "none",
			functions = "none",
			strings = "italic",
			variables = "bold",
		},

		-- Custom Highlights --
		colors = {}, -- Override default colors
		highlights = {}, -- Override highlight groups

		-- Plugins Config --
		diagnostics = {
			darker = true, -- darker colors for diagnostic
			undercurl = true, -- use undercurl instead of underline for diagnostics
			background = true, -- use background color for virtual text
		},
	})

-- Tokyonight https://github.com/folke/tokyonight.nvim
elseif colorscheme == "tokyonight" then
	scheme_type = "vim"
	vim.g.tokyonight_style = "night"

-- Monokai https://github.com/tanvirtin/monokai.nvim
elseif colorscheme == "monokaipro" then
	scheme_type = "vim"
	-- Filter options: default, machine, ristretto, octogon spectrum, and classic
	vim.g.monokaipro_filter = "default"
	vim.g.monokaipro_transparent = "true"
	vim.g.monokaipro_hide_inactive_statusline = "false"

-- Dracula https://github.com/Mofiqul/dracula.nvim
-- Make sure to set or reset theme to "auto" in lualine.lua as dracula
--  already exists and will not be set automatically.
elseif colorscheme == "dracula" then
	scheme_type = "lua"
  local dracula = require("dracula")
  dracula.setup({
	-- require(colorscheme).setup({
	-- 	-- customize dracula color palette
		colors = {
			bg = "#282A36",
			fg = "#F8F8F2",
			selection = "#44475A",
			comment = "#6272A4",
			red = "#FF5555",
			orange = "#FFB86C",
			yellow = "#F1FA8C",
			green = "#50fa7b",
			purple = "#BD93F9",
			cyan = "#8BE9FD",
			pink = "#FF79C6",
			bright_red = "#FF6E6E",
			bright_green = "#69FF94",
			bright_yellow = "#FFFFA5",
			bright_blue = "#D6ACFF",
			bright_magenta = "#FF92DF",
			bright_cyan = "#A4FFFF",
			bright_white = "#FFFFFF",
			menu = "#21222C",
			visual = "#3E4452",
			gutter_fg = "#4B5263",
			nontext = "#3B4048",
		},
		-- show the '~' characters after the end of buffers
		show_end_of_buffer = true, -- default false
		-- use transparent background
		transparent_bg = true, -- default false
		-- set custom lualine background color
		lualine_bg_color = "#44475a", -- default nil
		-- set italic comment
		italic_comment = true, -- default false
		-- overrides the default highlights see `:h synIDattr`
		overrides = {
			-- Examples
			-- NonText = { fg = dracula.colors().white }, -- set NonText fg to white
			-- NvimTreeIndentMarker = { link = "NonText" }, -- link to NonText highlight
			-- Nothing = {}, -- clear highlight of Nothing
		},
	})
else
end

-- Reload colorscheme after setup has taken place.
if scheme_type == "lua" then
	require(colorscheme).load()
elseif scheme_type == "dracula" then
  vim.cmd[[colorscheme dracula]]
else
	vim.cmd("colorscheme " .. colorscheme)
end
