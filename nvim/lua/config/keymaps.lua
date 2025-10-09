vim.keymap.set("n", "gp", function()
  require("telescope.builtin").lsp_type_definitions()
end, { desc = "Peek type definition" })
