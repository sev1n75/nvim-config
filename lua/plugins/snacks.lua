return {
  "folke/snacks.nvim",
  priority = 1000,
  lazy = false,
  ---@type snacks.Config
  opts = {
    bigfile = { enabled = true },
    dashboard = {
      preset = {
        header =[[
██╗   ██╗███████╗ ██████╗ ██████╗ ██████╗ ███████╗
██║   ██║██╔════╝██╔════╝██╔═══██╗██╔══██╗██╔════╝
██║   ██║███████╗██║     ██║   ██║██║  ██║█████╗  
╚██╗ ██╔╝╚════██║██║     ██║   ██║██║  ██║██╔══╝  
 ╚████╔╝ ███████║╚██████╗╚██████╔╝██████╔╝███████╗
  ╚═══╝  ╚══════╝ ╚═════╝ ╚═════╝ ╚═════╝ ╚══════╝]],
      }
    },
    --explorer = { enabled = true },
    indent = { enabled = true },
    input = { enabled = true },
    notifier = {
      enabled = true,
      timeout = 3000,
    },
    picker = {
      win = {
        -- input window
        input = {
          keys = {
            ["J"] = { "preview_scroll_down", mode = { "n" } },
            ["K"] = { "preview_scroll_up", mode = { "n" } },
          },
        },
      }
    },
    quickfile = { enabled = true },
    scope = { enabled = true },
    scroll = { enabled = true },
    statuscolumn = { enabled = true },
    words = { enabled = true },
    styles = {
      notification = {
        -- wo = { wrap = true } -- Wrap notifications
      }
    },
    image = {},
    zen = {
      -- You can add any `Snacks.toggle` id here.
      -- Toggle state is restored when the window is closed.
      -- Toggle config options are NOT merged.
      ---@type table<string, boolean>
      toggles = {
        dim = false,
        diagnostics = false,
      },
    }
  },
  keys = {
    -- Top Pickers
    { "<leader>:",  function() Snacks.picker.command_history() end,                         desc = "Command History" },
    { "<leader>nH", function() Snacks.picker.notifications() end,                           desc = "Notification History" },
    -- find
    { "<leader>fb", function() Snacks.picker.buffers() end,                                 desc = "Buffers" },
    { "<leader>fc", function() Snacks.picker.files({ cwd = vim.fn.stdpath("config") }) end, desc = "Find Config File" },
    { "<leader>ff", function() Snacks.picker.files() end,                                   desc = "Find Files" },
    { "<leader>fg", function() Snacks.picker.grep() end,                                    desc = "Grep" },
    { "<leader>fh", function() Snacks.picker.help() end,                                    desc = "Help Pages" },
    { "<leader>fw", function() Snacks.picker.grep_word() end,                               desc = "Visual selection or word", mode = { "n", "x" } },
    -- { "<leader>fp",      function() Snacks.picker.projects() end,                                desc = "Projects" },
    -- search
    { "<leader>sb", function() Snacks.picker.grep_buffers() end,                            desc = "Grep Open Buffers" },
    { "<leader>sc", function() Snacks.picker.command_history() end,                         desc = "Command History" },
    { "<leader>sd", function() Snacks.picker.diagnostics() end,                             desc = "Diagnostics" },
    { "<leader>sH", function() Snacks.picker.highlights() end,                              desc = "Highlights" },
    { "<leader>si", function() Snacks.picker.icons() end,                                   desc = "Icons" },
    { "<leader>sk", function() Snacks.picker.keymaps() end,                                 desc = "Keymaps" },
    { "<leader>sl", function() Snacks.picker.loclist() end,                                 desc = "Location List" },
    { "<leader>sm", function() Snacks.picker.marks() end,                                   desc = "Marks" },
    { "<leader>sM", function() Snacks.picker.man() end,                                     desc = "Man Pages" },
    -- LSP
    { "gd",         function() Snacks.picker.lsp_definitions() end,                         desc = "Goto Definition" },
    { "gD",         function() Snacks.picker.lsp_declarations() end,                        desc = "Goto Declaration" },
    { "gr",         function() Snacks.picker.lsp_references() end,                          nowait = true,                     desc = "References" },
    { "gI",         function() Snacks.picker.lsp_implementations() end,                     desc = "Goto Implementation" },
    { "gy",         function() Snacks.picker.lsp_type_definitions() end,                    desc = "Goto T[y]pe Definition" },
    { "<leader>ss", function() Snacks.picker.lsp_symbols() end,                             desc = "LSP Symbols" },
    { "<leader>sS", function() Snacks.picker.lsp_workspace_symbols() end,                   desc = "LSP Workspace Symbols" },
    -- git
    { "<leader>gg", function() Snacks.lazygit() end,                                        desc = "Lazygit" },
    { "<leader>gl", function() Snacks.lazygit.log_file() end,                               desc = "Lazygit" },
    { "<leader>gL", function() Snacks.picker.git_log_line() end,                            desc = "Lazygit" },
    -- Other
    { "<leader>z",  function() Snacks.zen() end,                                            desc = "Toggle Zen Mode" },
    { "<leader>x",  function() Snacks.bufdelete() end,                                      desc = "Delete Buffer" },
    { "<leader>cR", function() Snacks.rename.rename_file() end,                             desc = "Rename File" },
    { "<leader>gB", function() Snacks.gitbrowse() end,                                      desc = "Git Browse",               mode = { "n", "v" } },
    { "<leader>un", function() Snacks.notifier.hide() end,                                  desc = "Dismiss All Notifications" },
    { "]]",         function() Snacks.words.jump(vim.v.count1) end,                         desc = "Next Reference",           mode = { "n", "t" } },
    { "[[",         function() Snacks.words.jump(-vim.v.count1) end,                        desc = "Prev Reference",           mode = { "n", "t" } },
  },
  init = function()
    vim.api.nvim_create_autocmd("User", {
      pattern = "VeryLazy",
      callback = function()
        -- Setup some globals for debugging (lazy-loaded)
        _G.dd = function(...)
          Snacks.debug.inspect(...)
        end
        _G.bt = function()
          Snacks.debug.backtrace()
        end
        vim.print = _G.dd -- Override print to use snacks for `:=` command

        -- Create some toggle mappings
        Snacks.toggle.option("spell", { name = "Spelling" }):map("<leader>us")
        Snacks.toggle.option("wrap", { name = "Wrap" }):map("<leader>uw")
        Snacks.toggle.option("relativenumber", { name = "Relative Number" }):map("<leader>uL")
        Snacks.toggle.diagnostics():map("<leader>ud")
        Snacks.toggle.line_number():map("<leader>ul")
        Snacks.toggle.option("conceallevel", { off = 0, on = vim.o.conceallevel > 0 and vim.o.conceallevel or 2 }):map(
          "<leader>uc")
        Snacks.toggle.treesitter():map("<leader>uT")
        Snacks.toggle.option("background", { off = "light", on = "dark", name = "Dark Background" }):map("<leader>ub")
        Snacks.toggle.inlay_hints():map("<leader>uh")
        Snacks.toggle.indent():map("<leader>ug")
        Snacks.toggle.dim():map("<leader>uD")
      end,
    })
  end,
}
