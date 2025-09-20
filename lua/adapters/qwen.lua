
--[[
--]]
---@class CodeCompanion.HTTPAdapter.Qwen: CodeCompanion.HTTPAdapter
return {
  -- adapter 标识名
  name = "qwen",
  -- 在 UI 中显示的名称
  formatted_name = "Qwen",

  -- 定义角色映射，与 OpenAI 兼容
  roles = {
    llm = "assistant",
    user = "user",
  },

  -- 启用/禁用插件功能
  opts = {
    stream = true,  -- 启用流式响应
    tools = true,   -- 启用工具使用 (Function Calling)
    -- vision = false, -- Qwen 的这个端点不支持视觉，设为 false
  },

  -- 声明此 adapter 支持的特性
  features = {
    text = true,
    tokens = true,
  },

  -- 使用变量动态构建请求 URL
  url = "${url}${chat_url}",

  -- 定义 API 连接所需的关键信息
  env = {
    api_key = "DASHSCOPE_API_KEY",
    url = "https://dashscope.aliyuncs.com/compatible-mode",
    -- 聊天 API 的具体路径
    chat_url = "/v1/chat/completions",
    -- 获取模型列表的 API 路径 (可选，但推荐)
    -- models_endpoint = "/v1/models",
  },

  headers = {
    ["Content-Type"] = "application/json",
    Authorization = "Bearer ${api_key}", -- 动态注入 API Key
  },

  handlers = {
    setup = function(self)
      local openai = require("codecompanion.adapters.http.openai")
      return openai.handlers.setup(self)
    end,
    tokens = function(self, data)
      local openai = require("codecompanion.adapters.http.openai")
      return openai.handlers.tokens(self, data)
    end,
    form_parameters = function(self, params, messages)
      local openai = require("codecompanion.adapters.http.openai")
      return openai.handlers.form_parameters(self, params, messages)
    end,
    form_messages = function(self, messages)
      local openai = require("codecompanion.adapters.http.openai")
      return openai.handlers.form_messages(self, messages)
    end,
    form_tools = function(self, tools)
      local openai = require("codecompanion.adapters.http.openai")
      return openai.handlers.form_tools(self, tools)
    end,
    chat_output = function(self, data, tools)
      local openai = require("codecompanion.adapters.http.openai")
      return openai.handlers.chat_output(self, data, tools)
    end,
    inline_output = function(self, data, context)
      local openai = require("codecompanion.adapters.http.openai")
      return openai.handlers.inline_output(self, data, context)
    end,
    tools = {
      format_tool_calls = function(self, tools)
        local openai = require("codecompanion.adapters.http.openai")
        return openai.handlers.tools.format_tool_calls(self, tools)
      end,
      output_response = function(self, tool_call, output)
        local openai = require("codecompanion.adapters.http.openai")
        return openai.handlers.tools.output_response(self, tool_call, output)
      end,
    },
    on_exit = function(self, data)
      local openai = require("codecompanion.adapters.http.openai")
      return openai.handlers.on_exit(self, data)
    end,
  },

  schema = {
    ---@type CodeCompanion.Schema
    model = {
      order = 1,
      mapping = "parameters",
      type = "enum",
      desc = "The Qwen model to use for the chat.",
      -- default = "qwen3-coder-flash",
      default = "qwen3-max-preview",
      choices = {
        "qwen3-max-preview",
        "qwen3-coder-plus",
        "qwen3-coder-flash",
        "qwen-plus",
      },
    },
    -- temperature = {
    --   order = 2,
    --   mapping = "parameters",
    --   type = "number",
    --   default = 0.8,
    --   desc = "What sampling temperature to use, between 0 and 2.",
    -- },
  },
}
