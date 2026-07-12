return {
  'sindrets/diffview.nvim',
  config = function()
    require('diffview').setup {
      use_icons = true,
    }
  end,
}
