return {
  "nvim-neo-tree/neo-tree.nvim",
  branch = "v3.x",
  dependencies = {
    "nvim-lua/plenary.nvim",
    "nvim-tree/nvim-web-devicons",
    "MunifTanjim/nui.nvim",
  },
  opts = {
    filesystem = {
      filtered_items = {
        visible = true,
        hide_dotfiles = false, 
        hide_gitignored = false,
      },
      window = {
        mappings = {
          ["o"] = "open",
          ["oo"] = "open_split",
          ["ov"] = "open_vsplit",
          ["cr"] = {
            "show_help",
            nowait = false,
            config = { title = "Order by", prefix_key = "cr" },
          },
        },
      },
    },
  },
}
