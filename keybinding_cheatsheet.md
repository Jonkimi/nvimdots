# Neovim Keybindings Cheatsheet

This document lists keybindings defined in the Neovim configuration (`config.md`) for quick reference.

## Keybindings

Here's a list of keybindings defined in this Neovim configuration:

- **Core:**

  - `n|<leader>ph`: `Lazy` (Show lazy.nvim UI)
  - `n|<leader>ps`: `Lazy sync` (Sync packages)
  - `n|<leader>pu`: `Lazy update` (Update packages)
  - `n|<leader>pi`: `Lazy install` (Install packages)
  - `n|<leader>pl`: `Lazy log` (Show lazy.nvim log)
  - `n|<leader>pc`: `Lazy check` (Check packages)
  - `n|<leader>pd`: `Lazy debug` (Debug packages)
  - `n|<leader>pp`: `Lazy profile` (Profile packages)
  - `n|<leader>pr`: `Lazy restore` (Restore packages)
  - `n|<leader>px`: `Lazy clean` (Clean packages)

- **Completion/LSP:**

  - `n|<A-f>`: `FormatToggle` (Toggle format on save)
  - `n|<A-S-f>`: `Format` (Format buffer manually)
  - `n|<leader>li`: `LspInfo` (LSP Info)
  - `n|<leader>lr`: `LspRestart` (LSP Restart)
  - `n|go`: Toggle outline (using `edgy.nvim`)
  - `n|g[`: `Lspsaga diagnostic_jump_prev` (Previous diagnostic)
  - `n|g]`: `Lspsaga diagnostic_jump_next` (Next diagnostic)
  - `n|<leader>lx`: `Lspsaga show_line_diagnostics ++unfocus` (Line diagnostic)
  - `n|gs`: `vim.lsp.buf.signature_help()` (Signature help)
  - `n|gr`: `Lspsaga rename` (Rename in file range)
  - `n|gR`: `Lspsaga rename ++project` (Rename in project range)
  - `n|K`: `Lspsaga hover_doc` (Show documentation)
  - `nv|ga`: `Lspsaga code_action` (Code action for cursor)
  - `n|gd`: `Glance definitions` (Preview definition)
  - `n|gD`: `Lspsaga goto_definition` (Goto definition)
  - `n|gh`: `Glance references` (Show references)
  - `n|gm`: `Glance implementations` (Show implementation)
  - `n|gci`: `Lspsaga incoming_calls` (Show incoming calls)
  - `n|gco`: `Lspsaga outgoing_calls` (Show outgoing calls)
  - `n|<leader>lv`: Toggle virtual text display
  - `n|<leader>lh`: Toggle inlay hints display

- **Editor:**

  - `n|<C-s>`: `write` (Save file)
  - `n|<C-q>`: `wq` (Save file and quit)
  - `n|<A-S-q>`: `q!` (Force quit)
  - `i|<C-u>`: `<C-G>u<C-U>` (Delete previous block)
  - `i|<C-b>`: `<Left>` (Move cursor to left)
  - `i|<C-a>`: `<ESC>^i` (Move cursor to line start)
  - `i|<C-s>`: `<Esc>:w<CR>` (Save file)
  - `i|<C-q>`: `<Esc>:wq<CR>` (Save file and quit)
  - `c|<C-b>`: `<Left>` (Left)
  - `c|<C-f>`: `<Right>` (Right)
  - `c|<C-a>`: `<Home>` (Home)
  - `c|<C-e>`: `<End>` (End)
  - `c|<C-d>`: `<Del>` (Delete)
  - `c|<C-h>`: `<BS>` (Backspace)
  - `c|<C-t>`: Complete path of current file
  - `v|J`: `:m '>+1<CR>gv=gv` (Move this line down)
  - `v|K`: `:m '<-2<CR>gv=gv` (Move this line up)
  - `v|<`: `<gv` (Decrease indent)
  - `v|>`: `>gv` (Increase indent)
  - `n|Y`: `y$` (Yank text to EOL)
  - `n|D`: `d$` (Delete text to EOL)
  - `n|n`: `nzzzv` (Next search result)
  - `n|N`: `Nzzzv` (Prev search result)
  - `n|J`: `mzJ`z` (Join next line)
  - `n|<S-Tab>`: `normal za` (Toggle code fold)
  - `n|<Esc>`: Clear search highlight
  - `n|<leader>o`: `setlocal spell! spelllang=en_us` (Toggle spell check)

  - `n|zz`: Center current line vertically
  - `n|zl`: Scroll window one character left
  - `n|zh`: Scroll window one character right
  - `n|zL`: Scroll window full width left
  - `n|zH`: Scroll window full width right

- **Session (persisted.nvim):**

  - `n|<leader>ss`: `SessionSave` (Save session)
  - `n|<leader>sl`: `SessionLoad` (Load session)
  - `n|<leader>sd`: `SessionDelete` (Delete session)

- **Comments (comment.nvim):**

  - `n|gcc`: Toggle comment for line
  - `n|gbc`: Toggle comment for block
  - `n|gc`: `<Plug>(comment_toggle_linewise)` (Toggle comment for line with operator)
  - `n|gb`: `<Plug>(comment_toggle_blockwise)` (Toggle comment for block with operator)
  - `x|gc`: `<Plug>(comment_toggle_linewise_visual)` (Toggle comment for line with selection)
  - `x|gb`: `<Plug>(comment_toggle_blockwise_visual)` (Toggle comment for block with selection)

- **Diffview (diffview.nvim):**

  - `n|<leader>gd`: `DiffviewOpen` (Show diff)
  - `n|<leader>gD`: `DiffviewClose` (Close diff)

- **Hop (hop.nvim):**

  - `nv|<leader>w`: `<Cmd>HopWordMW<CR>` (Goto word)
  - `nv|<leader>j`: `<Cmd>HopLineMW<CR>` (Goto line)
  - `nv|<leader>k`: `<Cmd>HopLineMW<CR>` (Goto line)
  - `nv|<leader>c`: `<Cmd>HopChar1MW<CR>` (Goto one char)
  - `nv|<leader>C`: `<Cmd>HopChar2MW<CR>` (Goto two chars)

- **Grug Far (grug-far.nvim):**

  - `n|<leader>Ss`: Toggle search & replace panel
  - `n|<leader>Sp`: search&replace current word (project)
  - `v|<leader>Sp`: search & replace current word (project)
  - `n|<leader>Sf`: search & replace current word (file)

- **Treesitter (nvim-treesitter):**

  - `o|m`: `lua require('tsht').nodes()` (Operate across syntax tree)

- **Suda (suda.vim):**

  - `n|<A-s>`: `SudaWrite` (Save file using sudo)

- **Markdown (render-markdown.nvim, markdown-preview.nvim):**

  - `n|<F1>`: `RenderMarkdown toggle` (Toggle markdown preview within nvim)
  - `n|<F12>`: `MarkdownPreviewToggle` (Preview markdown)

- **Git (vim-fugitive):**

  - `n|gps`: `G push` (Git push)
  - `n|gpl`: `G pull` (Git pull)
  - `n|<leader>gG`: `Git` (Open git-fugitive)

- **File Tree (nvim-tree.lua):**

  - `n|<leader>nf`: `NvimTreeFindFile` (Find file in file tree)
  - `n|<leader>nr`: `NvimTreeRefresh` (Refresh file tree)

- **Sniprun (sniprun):**

  - `v|<leader>r`: `SnipRun` (Run code by range)
  - `n|<leader>r`: `%SnipRun` (Run code by file)

- **Terminal (toggleterm.nvim):**

  - `t|<Esc><Esc>`: `<C-\><C-n>` (Switch to normal mode in terminal)
  - `n|<C-\\>`: `ToggleTerm direction=horizontal` (Toggle horizontal terminal)
  - `i|<C-\\>`: `ToggleTerm direction=horizontal` (Toggle horizontal terminal)
  - `t|<C-\\>`: `ToggleTerm` (Toggle horizontal terminal)
  - `n|<A-\\>`: `ToggleTerm direction=vertical` (Toggle vertical terminal)
  - `i|<A-\\>`: `ToggleTerm direction=vertical` (Toggle vertical terminal)
  - `t|<A-\\>`: `ToggleTerm` (Toggle vertical terminal)
  - `n|<F5>`: `ToggleTerm direction=vertical` (Toggle vertical terminal)
  - `i|<F5>`: `ToggleTerm direction=vertical` (Toggle horizontal terminal)
  - `t|<F5>`: `ToggleTerm` (Toggle vertical terminal)
  - `n|<A-d>`: `ToggleTerm direction=float` (Toggle float terminal)
  - `i|<A-d>`: `ToggleTerm direction=float` (Toggle horizontal terminal)
  - `t|<A-d>`: `ToggleTerm` (Toggle vertical terminal)

- **Lazygit:**

  - `n|<leader>gg`: Toggle lazygit

- **Trouble (trouble.nvim):**

  - `n|gt`: `Trouble diagnostics toggle` (Toggle trouble list)
  - `n|<leader>lw`: `Trouble diagnostics toggle` (Show workspace diagnostics)
  - `n|<leader>lp`: `Trouble project_diagnostics toggle` (Show project diagnostics)
  - `n|<leader>ld`: `Trouble diagnostics toggle filter.buf=0` (Show document diagnostics)

- **Telescope (telescope.nvim):**

  - `n|<C-p>`: Toggle command panel
  - `n|<leader>fc`: Open Telescope collections
  - `n|<leader>ff`: Find files (using Telescope)
  - `n|<leader>fp`: Find patterns (using Telescope)
  - `v|<leader>fs`: Find word under cursor (using Telescope)
  - `n|<leader>fg`: Locate Git objects (using Telescope)
  - `n|<leader>fd`: Retrieve dossiers (using Telescope)
  - `n|<leader>fm`: Miscellaneous (using Telescope)

- **DAP (mfussenegger/nvim-dap):**

  - `n|<F6>`: `require("dap").continue()` (Run/Continue debugging)
  - `n|<F7>`: `require("dap").terminate()` (Stop debugging)
  - `n|<F8>`: `require("dap").toggle_breakpoint()` (Toggle breakpoint)
  - `n|<F9>`: `require("dap").step_into()` (Step into debugging)
  - `n|<F10>`: `require("dap").step_out()` (Step out debugging)
  - `n|<F11>`: `require("dap").step_over()` (Step over debugging)
  - `n|<leader>db`: Set breakpoint with condition
  - `n|<leader>dc`: Run to cursor
  - `n|<leader>dl`: Run last
  - `n|<leader>do`: Open REPL

- **UI (Builtins):**

  - `n|<leader>bn`: `enew` (Create a new buffer)
  - `t|<C-w>h`: `<Cmd>wincmd h<CR>` (Focus left window)
  - `t|<C-w>l`: `<Cmd>wincmd l<CR>` (Focus right window)
  - `t|<C-w>j`: `<Cmd>wincmd j<CR>` (Focus down window)
  - `t|<C-w>k`: `<Cmd>wincmd k<CR>` (Focus up window)
  - `n|tn`: `tabnew` (Create a new tab)
  - `n|tk`: `tabnext` (Move to next tab)
  - `n|tj`: `tabprevious` (Move to previous tab)
  - `n|to`: `tabonly` (Only keep current tab)

- **Bufferline (akinsho/bufferline.nvim):**

  - `n|<A-q>`: `BufDel` (Close current buffer)
  - `n|<A-i>`: `BufferLineCycleNext` (Switch to next buffer)
  - `n|<A-o>`: `BufferLineCyclePrev` (Switch to previous buffer)
  - `n|<A-S-i>`: `BufferLineMoveNext` (Move current buffer to next)
  - `n|<A-S-o>`: `BufferLineMovePrev` (Move current buffer to previous)
  - `n|<leader>be`: `BufferLineSortByExtension` (Sort buffers by extension)
  - `n|<leader>bd`: `BufferLineSortByDirectory` (Sort buffers by directory)
  - `n|<A-1>`: `BufferLineGoToBuffer 1` (Goto buffer 1)
  - `n|<A-2>`: `BufferLineGoToBuffer 2` (Goto buffer 2)
  - `n|<A-3>`: `BufferLineGoToBuffer 3` (Goto buffer 3)
  - `n|<A-4>`: `BufferLineGoToBuffer 4` (Goto buffer 4)
  - `n|<A-5>`: `BufferLineGoToBuffer 5` (Goto buffer 5)
  - `n|<A-6>`: `BufferLineGoToBuffer 6` (Goto buffer 6)
  - `n|<A-7>`: `BufferLineGoToBuffer 7` (Goto buffer 7)
  - `n|<A-8>`: `BufferLineGoToBuffer 8` (Goto buffer 8)
  - `n|<A-9>`: `BufferLineGoToBuffer 9` (Goto buffer 9)

- **Smart Splits (mrjones2014/smart-splits.nvim):**

  - `n|<A-h>`: `SmartResizeLeft` (Resize window left)
  - `n|<A-j>`: `SmartResizeDown` (Resize window down)
  - `n|<A-k>`: `SmartResizeUp` (Resize window up)
  - `n|<A-l>`: `SmartResizeRight` (Resize window right)
  - `n|<C-h>`: `SmartCursorMoveLeft` (Focus left window)
  - `n|<C-j>`: `SmartCursorMoveDown` (Focus down window)
  - `n|<C-k>`: `SmartCursorMoveUp` (Focus up window)
  - `n|<C-l>`: `SmartCursorMoveRight` (Focus right window)
  - `n|<leader>Wh`: `SmartSwapLeft` (Move window leftward)
  - `n|<leader>Wj`: `SmartSwapDown` (Move window downward)
  - `n|<leader>Wk`: `SmartSwapUp` (Move window upward)
  - `n|<leader>Wl`: `SmartSwapRight` (Move window rightward)

- **Gitsigns (lewis6991/gitsigns.nvim):**
  - `n|]g`: Goto next hunk
  - `n|[g`: Goto prev hunk
  - `n|<leader>gs`: Toggle staging/unstaging of hunk
  - `v|<leader>gs`: Toggle staging/unstaging of selected hunk
  - `n|<leader>gr`: Reset hunk
  - `v|<leader>gr`: Reset hunk
  - `n|<leader>gR`: Reset buffer
  - `n|<leader>gp`: Preview hunk
  - `n|<leader>gb`: Blame line
  - `ox|ih`: Select hunk
