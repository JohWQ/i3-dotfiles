-- Customize Treesitter

---@type LazySpec
return {
  "nvim-treesitter/nvim-treesitter",
  opts = {
    filesystem = {
      filtered_items = {
        visible = false,
        hide_gitignored = true,
        hide_dotfiles = false,
        hide_by_name = {
          ".github",
          ".gitignore",
          "package-lock.json",
          ".changeset",
          ".prettierrc.json"
        },
        never_show = { ".git" },
      },
    },
    ensure_installed = {
      "lua",
      "vim",
      -- add more arguments for adding more treesitter parsers
    },
  },
}
