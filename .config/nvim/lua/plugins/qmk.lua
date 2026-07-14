return {
  "arnmar/qmk.nvim",
  config = function()
    require("qmk").setup({
      qmk_path = vim.fn.expand("~/src/qmk/qmk_firmware/"),
    })
  end,
}
