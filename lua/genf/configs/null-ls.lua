local function null_ls_setup()
  local null_ls = require('null-ls')
  null_ls.setup {
    sources = {
      null_ls.builtins.formatting.stylua,
      null_ls.builtins.formatting.perltidy,
      null_ls.builtins.formatting.shfmt,
      null_ls.builtins.formatting.black,
      null_ls.builtins.formatting.isort,
      -- null_ls.builtins.formatting.markdownlint,
      -- null_ls.builtins.diagnostics.markdownlint,
      null_ls.builtins.formatting.cmake_format,
      -- null_ls.builtins.diagnostics.cspell,
      -- null_ls.builtins.code_actions.cspell,
      null_ls.builtins.formatting.latexindent,
    },
  }
end

return {
  setup = null_ls_setup,
}
