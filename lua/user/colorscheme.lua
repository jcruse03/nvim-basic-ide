-- Make sure to install colorschemes in pluggins.lua

-- Set colorscheme here
local colorscheme = 'onedark'

-- Do not change here. If scheme_type is not detected,
-- set it in manualy in colorscheme setting below
-- eg: See tokyonight colorscheme below.
local scheme_type = 'lua'

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
  scheme_type = 'vim'
  status_ok, _ = pcall(vim.cmd, "colorscheme " .. colorscheme)
  if not status_ok then
    -- Set sane default.
    -- TODO Might want to change this to a built in colorscheme.
    vim.cmd('colorscheme darkplus')
    vim.notify('colorscheme ' .. colorscheme .. ' not found, check plugins.lua and colorscheme.lua')
    return
  end
end

-- Colorscheme Settings --
-- Make a new elseif for each colorscheme if setup is needed.

-- Onedark https://github.com/navarasu/onedark.nvim --
if colorscheme == 'onedark' then
  require(colorscheme).setup {
  -- Main options --
      style = 'darker', -- Default theme style. Choose between 'dark', 'darker', 'cool', 'deep', 'warm', 'warmer' and 'light'
      transparent = true,  -- Show/hide background
      term_colors = true, -- Change terminal color as per the selected theme style
      ending_tildes = false, -- Show the end-of-buffer tildes. By default they are hidden
      cmp_itemkind_reverse = false, -- reverse item kind highlights in cmp menu

      -- toggle theme style ---
      toggle_style_key = nil, -- keybind to toggle theme style. Leave it nil to disable it, or set it to a string, for example "<leader>ts"
      toggle_style_list = {'dark', 'darker', 'cool', 'deep', 'warm', 'warmer', 'light'}, -- List of styles to toggle between

      -- Change code style ---
      -- Options are italic, bold, underline, none
      -- You can configure multiple style with comma seperated, For e.g., keywords = 'italic,bold'
      code_style = {
          comments = 'italic',
          keywords = 'none',
          functions = 'none',
          strings = 'italic',
          variables = 'bold'
      },

      -- Custom Highlights --
      colors = {}, -- Override default colors
      highlights = {}, -- Override highlight groups

      -- Plugins Config --
      diagnostics = {
          darker = true, -- darker colors for diagnostic
          undercurl = true,   -- use undercurl instead of underline for diagnostics
          background = true,    -- use background color for virtual text
      },
  }

-- Tokyonight https://github.com/folke/tokyonight.nvim
elseif colorscheme == 'tokyonight' then
  scheme_type = 'vim'
  vim.g.tokyonight_style = "night"
else
end

-- Reload colorscheme after setup has taken place. 
if scheme_type == 'lua' then
  require(colorscheme).load()
else
  vim.cmd('colorscheme ' .. colorscheme)
end
