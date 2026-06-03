return {
  "epwalsh/obsidian.nvim",
  version = "*",
  lazy = true,
  ft = "markdown",
  dependencies = {
    "nvim-lua/plenary.nvim",
  },
  opts = {
    workspaces = {
      {
        name = "main",
        path = "~/Library/Mobile Documents/iCloud~md~obsidian/Documents/daini do nō",
      },
      -- Where to put new notes created from Neovim
      new_notes_location = "current_dir",

      completion = {
        nvim_cmp = true,
        min_chars = 2,
      },
      -- Customize how frontmatter is generated for new notes
      note_frontmatter_func = function(note)
        local out = { id = note.id, aliases = note.aliases, tags = note.tags }
        -- `note.metadata` contains any manually added fields in the frontmatter.
        if note.metadata ~= nil and not vim.tbl_isempty(note.metadata) then
          for k, v in pairs(note.metadata) do
            out[k] = v
          end
        end
        return out
      end,
    },
  }

}
