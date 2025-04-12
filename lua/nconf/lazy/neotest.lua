return {
  "nvim-neotest/neotest",
  dependencies = {
    "nvim-lua/plenary.nvim",
    "nvim-treesitter/nvim-treesitter",
    "haydenmeade/neotest-jest",
    "nvim-neotest/nvim-nio"
  },
  config = function()
    require('neotest').setup({
      adapters = {
        require('neotest-jest')({
          jestCommand = "npm test --",
          jestConfigFile = "jest.config.js",
          env = { NODE_ENVIRONMENT = "test" },
          cwd = function(path)
            print("cwd: ", vim.fn.getcwd())
            return vim.fn.getcwd()
          end,
        }),
      }
    })
  end
}
