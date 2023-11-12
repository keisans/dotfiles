local wk = require('which-key')
wk.setup {}

wk.register {
  ["<Leader>"] = {
    d = { "[LSP] Go to definition" },
    j = { "[LSP] Hover" },
    r = { "[LSP] References" },
    k = { "[LSP] Code actions" },
    f = { "Live grep" },
    y = { "Clipboard yank y" },
    Y = { "Clipboard yank Y" }
  },
  ["<Leader>t"] = {
    name = "Telescope finders",
    c = { "Color schemes" },
    t = { "Treesitter" },
    b = { "Buffers" },
    f = { "Find files" },
    h = { "Help" },
  }
}
