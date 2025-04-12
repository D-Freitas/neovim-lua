vim.g.mapleader = " "

vim.o.foldenable = true
vim.o.foldmethod = 'expr'
vim.o.foldexpr = 'nvim_treesitter#foldexpr()'

vim.o.foldlevel = 99

vim.opt.termguicolors = true

local music_job_id = nil
local visual_job_id = nil

vim.cmd [[
  hi Normal guibg=NONE ctermbg=NONE
  hi NormalNC guibg=NONE ctermbg=NONE
  hi EndOfBuffer guibg=NONE ctermbg=NONE
  hi VertSplit guibg=NONE ctermbg=NONE
]]

vim.api.nvim_create_user_command("PlayWithWaves", function(opts)
  -- Para o som anterior se tiver tocando
  if music_job_id then vim.fn.jobstop(music_job_id) end
  if visual_job_id then vim.fn.jobstop(visual_job_id) end

  -- Abre cava em um split
  vim.cmd("belowright 10split | terminal cava")
  visual_job_id = vim.b.terminal_job_id

  -- Toca o som com mpv
  music_job_id = vim.fn.jobstart({ "mpv", "--no-video", "--quiet", opts.args }, {
    detach = false,
  })

  print("🎵 Tocando com ondas: " .. opts.args)
end, {
  nargs = 1,
  complete = "file"
})

vim.api.nvim_create_user_command("StopWaves", function()
  if music_job_id then vim.fn.jobstop(music_job_id) end
  if visual_job_id then vim.fn.jobstop(visual_job_id) end
  print("⏹️ Som e ondas parados")
end, {})

require("nconf.lazy_init")
require("nconf.set")
require("nconf.remap")
