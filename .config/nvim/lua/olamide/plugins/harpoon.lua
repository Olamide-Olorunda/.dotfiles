return {
  "ThePrimeagen/harpoon",
  dependencies = {
    "nvim-lua/plenary.nvim", -- Plenary is already installed via Telescope, but it's good practice to list it
  },
  config = function()
    local mark = require("harpoon.mark")
    local ui = require("harpoon.ui")

    settings = {
      save_on_toggle = true,
      sync_on_ui_close = true,
    }

    vim.keymap.set("n", "<leader>a", mark.add_file)

    -- Ctrl + e: View all your currently Harpooned files
    vim.keymap.set("n", "<C-e>", ui.toggle_quick_menu)

    -- Ctrl + h/t/n/s: Jump directly to file 1, 2, 3, or 4 on the Harpoon list
    vim.keymap.set("n", "<C-h>", function() ui.nav_file(1) end)
    vim.keymap.set("n", "<C-t>", function() ui.nav_file(2) end)
    vim.keymap.set("n", "<C-n>", function() ui.nav_file(3) end)
    vim.keymap.set("n", "<C-s>", function() ui.nav_file(4) end)
  end
}
