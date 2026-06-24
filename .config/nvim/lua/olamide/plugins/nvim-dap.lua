return {
  "mfussenegger/nvim-dap",
  dependencies = {
    { "rcarriga/nvim-dap-ui", dependencies = { "nvim-neotest/nvim-nio" } },
    "theHamsta/nvim-dap-virtual-text",
  },
  config = function()
    local dap = require("dap")
    local dapui = require("dapui")

    -- 1. Setup the UI and Virtual Text
    require("nvim-dap-virtual-text").setup({})
    dapui.setup()

    dap.listeners.after.event_initialized["dapui_config"] = function()
      dapui.open()
    end
    dap.listeners.before.event_terminated["dapui_config"] = function()
      dapui.close()
    end
    dap.listeners.before.event_exited["dapui_config"] = function()
      dapui.close()
    end

    -- 2. Configure LLDB via Mason for macOS
    local mason_registry = require("mason-registry")
    local codelldb = mason_registry.get_package("codelldb")
    local extension_path = codelldb:get_install_path() .. "/extension/"
    local codelldb_path = extension_path .. "adapter/codelldb"

    dap.adapters.codelldb = {
      type = "server",
      port = "${port}",
      executable = {
        command = codelldb_path,
        args = { "--port", "${port}" },
      },
    }

    local c_cpp_config = {
      {
        name = "Launch LLDB",
        type = "codelldb",
        request = "launch",
        program = function()
          return vim.fn.input('Path to executable: ', vim.fn.getcwd() .. '/', 'file')
        end,
        cwd = "${workspaceFolder}",
        stopOnEntry = false,
      },
    }

    dap.configurations.c = c_cpp_config
    dap.configurations.cpp = c_cpp_config
    dap.configurations.rust = c_cpp_config

    local keymap = vim.keymap
    keymap.set("n", "<F5>", dap.continue, { desc = "Debug: Start/Continue" })
    keymap.set("n", "<F10>", dap.step_over, { desc = "Debug: Step Over" })
    keymap.set("n", "<F11>", dap.step_into, { desc = "Debug: Step Into" })
    keymap.set("n", "<F12>", dap.step_out, { desc = "Debug: Step Out" })
    keymap.set("n", "<leader>b", dap.toggle_breakpoint, { desc = "Debug: Toggle Breakpoint" })
    keymap.set("n", "<leader>B", function()
      dap.set_breakpoint(vim.fn.input("Breakpoint condition: "))
    end, { desc = "Debug: Set Conditional Breakpoint" })
  end,
}
