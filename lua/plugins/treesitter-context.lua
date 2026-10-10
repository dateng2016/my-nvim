-- Sticky scroll: keep the enclosing function/class/if/for header pinned
-- at the top of the window as you scroll through its body (like VSCode/IDEA).
return {
  "nvim-treesitter/nvim-treesitter-context",
  event = "LazyFile",
  opts = {
    enable = true,
    max_lines = 3, -- how many context lines to show (0 = unlimited)
    min_window_height = 0,
    multiline_threshold = 1, -- collapse multi-line signatures to 1 line
    trim_scope = "outer", -- discard outermost context when over max_lines
    mode = "cursor", -- "cursor" tracks the cursor; "topline" tracks scroll
    separator = nil,
  },
  keys = {
    {
      "<leader>ut",
      function()
        require("treesitter-context").toggle()
      end,
      desc = "Toggle Treesitter Context",
    },
    {
      "[c",
      function()
        require("treesitter-context").go_to_context(vim.v.count1)
      end,
      desc = "Jump to context (upwards)",
    },
  },
}
