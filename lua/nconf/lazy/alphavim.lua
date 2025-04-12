return {
  "goolord/alpha-nvim",
  dependencies = { "nvim-tree/nvim-web-devicons" },
  config = function()
    local alpha = require("alpha")
    local dashboard = require("alpha.themes.dashboard")

    dashboard.section.header.val = {
      "01                 01     01              10  00",
      "    01           10   01    01          10    00",
      "        01     10       01    01      10      00",
      "    10       10           01    01  10        00",
      "10         10               01    11          00",
    }

    dashboard.section.buttons.val = {
      dashboard.button("e", "📄  New File", ":ene <BAR> startinsert <CR>"),
      dashboard.button("d", "📁  New Folder", ":!mkdir "),
      dashboard.button("f", "🔍  Find File", ":Telescope find_files<CR>"),
      dashboard.button("r", "🕘  Recent Files", ":Telescope oldfiles<CR>"),
      dashboard.button("c", "⚙️  Config", ":e $MYVIMRC<CR>"),
      dashboard.button("q", "🚪  Quit", ":qa<CR>"),
    }

    dashboard.section.footer.val = "🧠 Seja produtivo com Neovim!"

    alpha.setup(dashboard.config)
  end
}
