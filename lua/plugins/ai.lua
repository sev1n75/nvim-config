return {
  "olimorris/codecompanion.nvim",
  dependencies = {
    "nvim-lua/plenary.nvim"
  },
  opts = {
    adapters = {
      http = {
        qwen = require "adapters.qwen",
      },
    },
    strategies = {
      chat = {
        adapter = "qwen",
        tools = {
          search_web = {
            enable = false
          },
        },
      },
      inline = {
        adapter = "qwen",
        search_web = {
          enable = false
        },
      },
    },
    -- NOTE: The log_level is in `opts.opts`
    opts = {
      log_level = "DEBUG",
    },
  },
}
