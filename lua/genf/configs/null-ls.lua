local function null_ls_setup()
  local null_ls = require('null-ls')
  null_ls.setup {
    sources = {
      null_ls.builtins.formatting.stylua,

      null_ls.builtins.formatting.isort,
      null_ls.builtins.formatting.black,
      null_ls.builtins.diagnostics.flake8,

      null_ls.builtins.formatting.cmake_format,
      null_ls.builtins.formatting.latexindent,
    },
  }
end

return {
  setup = null_ls_setup,
}
