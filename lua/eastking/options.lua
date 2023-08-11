-- Search
vim.opt.hlsearch       = true -- Highlight search results
vim.opt.incsearch      = true -- Highlight all search results as you are typing
vim.opt.ignorecase     = true -- Ignore case for search
vim.opt.smartcase      = true -- If search is small case it's case insensitive if search term Capital Case then it's case sensitive

-- Indentation
vim.opt.autoindent     = true -- New lines inherit the indentation of previous lines
vim.opt.smartindent    = true -- Does the right thing (mostly) in programs
vim.opt.expandtab      = true -- Convert tabs to spaces (Practically I don't know what it do)
vim.opt.tabstop        = 2 -- 2 spaces for a line indent
vim.opt.shiftwidth     = 2 -- 2 spaces indentation  when using '>>' '<<'

-- Copy/Paste
vim.opt.clipboard      =
"unnamedplus"                     -- Allow nvim to access system  clipboard (On linux, you need 'xclip' if using x11 or 'wl-copy' & 'wl-paste' if using Wayland

-- Interface
vim.opt.number         = true -- Show line numbers
vim.opt.relativenumber = true -- Show line numbers relative to your current line
vim.opt.cursorline     = true -- Underline the current line
vim.opt.ruler          = true -- Display cursor position
vim.opt.confirm        = true -- Confirm leaving without saving changes or not (if exist)
vim.opt.scrolloff      = 8    -- Minimal number of screen lines to keep above and below the cursor.
vim.opt.sidescrolloff  = 8    -- Minimal number of screen columns to keep to the left and right of the cursor if wrap is 'false'
vim.opt.wrap           = false -- Disable line wrapping
vim.opt.showmode       = true -- Show the current mode you are in
vim.opt.mouse          = "a"  -- Enable mouse support  for scrolling and resizing
vim.opt.wildmenu       = true -- Display command line's tab complete options as menu
vim.opt.pumheight      = 10   -- pop up menu height
vim.opt.showtabline    = 0    -- Always show tabs
vim.opt.termguicolors  = true -- Enable 24-bit RGB colors. most terminals support it. (sometime make cool changes other times cause some bugs if you ever had any  issues in colorschemes come here  first)
vim.opt.cmdheight      = 1    -- More space in the neovim command line for displaying messages
vim.opt.laststatus     = 3    -- Only the last window will always have a status line
vim.opt.splitbelow     = true -- Force all horizental splits to go below current window
vim.opt.splitright     = true -- Force all vertical splits to go to the right of current window
vim.opt.signcolumn     =
"yes"                         -- Always show the sign column used for many purposes like debugger icons (e.g breakpoint), mark build errors or displayversion control status

-- Text Rendering
vim.opt.encoding       = "utf-8" -- Self Explanatory

-- Other
vim.opt.backup         = false                            --  Many online configurations recommend that
vim.opt.swapfile       = false                            -- Also very recommende in online configurations
vim.opt.completeopt    = { "menu", "menuone", "noselect" } -- For completions in insert mode
vim.opt.conceallevel   = 0                                -- so that `` is visible in makdown files
vim.opt.undofile       = true                             -- Enable persisten undo
vim.opt.undodir        = os.getenv("HOME") .. "/.vim.undodir" --  Specifiy a directory for undo files
vim.opt.updatetime     = 300                              -- Faster completion (4000ms default)
vim.opt.writebackup    = false                            -- If a file is being edited by another program (or was written to file while editing with another program),it is not allowed to be edited
vim.opt.formatoptions:remove { "c", "r", "o" }            -- Stop vim from adding comment leader when hitting enter in insert mode or "o"/"O" in normal mode and auto wrapping comments
vim.cmd('autocmd BufEnter * setlocal formatoptions-=cro') -- There is a bug the previous command doesn't work so as a workaround execute this command
