-- ┼─────────────────────────────────────────────────────────────────────────────────────┼
-- │ {{{                              « Treesitter »                                     │
-- ┼─────────────────────────────────────────────────────────────────────────────────────┼

local treesitter_init = function()
  require'nvim-treesitter.configs'.setup {
    ensure_installed = "maintained", -- one of "all", "maintained" (parsers with maintainers), or a list of languages
    highlight = {
      enable = true              -- false will disable the whole extension
    },
    indent = {
      enable = true,              -- false will disable the whole extension
    },
  }
end

-- }}}
-- ┼─────────────────────────────────────────────────────────────────────────────────────┼
-- │ {{{                           « LSP Configurations »                                │
-- ┼─────────────────────────────────────────────────────────────────────────────────────┼

local nvim_lsp_init = function()
  local nvim_lsp = require('lspconfig')
  local runtime_path = vim.split(package.path, ';')
  table.insert(runtime_path, "lua/?.lua")
  table.insert(runtime_path, "lua/?/init.lua")
  -- Keymaps
  local on_attach = function(client, bufnr)
    local border = { '╭', '─' ,'╮', '│', '╯', '─', '╰', '│' }
    local signs = { Error = " ", Warning = " ", Hint = " ", Information = " " }
    for type, icon in pairs(signs) do
      local hl = "LspDiagnosticsSign" .. type
      vim.fn.sign_define(hl, { text = icon, texthl = hl, numhl = "" })
    end
    vim.lsp.handlers["textDocument/hover"] =  vim.lsp.with(vim.lsp.handlers.hover, {border = border})
    vim.lsp.handlers["textDocument/signatureHelp"] =  vim.lsp.with(vim.lsp.handlers.signature_help, {border = border})
    local function buf_set_keymap(...) vim.api.nvim_buf_set_keymap(bufnr, ...) end
    local function buf_set_option(...) vim.api.nvim_buf_set_option(bufnr, ...) end
    buf_set_option('omnifunc', 'v:lua.vim.lsp.omnifunc')
    local opts = { noremap=true, silent=true }
    buf_set_keymap('n', 'gD', '<Cmd>lua vim.lsp.buf.declaration()<CR>', opts)
    buf_set_keymap('n', 'gd', '<Cmd>lua vim.lsp.buf.definition()<CR>', opts)
    buf_set_keymap('n', 'K', '<Cmd>lua vim.lsp.buf.hover()<CR>', opts)
    buf_set_keymap('n', 'gi', '<cmd>lua vim.lsp.buf.implementation()<CR>', opts)
    buf_set_keymap('n', '<C-k>', '<cmd>lua vim.lsp.buf.signature_help()<CR>', opts)
    buf_set_keymap('n', '<space>wa', '<cmd>lua vim.lsp.buf.add_workspace_folder()<CR>', opts)
    buf_set_keymap('n', '<space>wr', '<cmd>lua vim.lsp.buf.remove_workspace_folder()<CR>', opts)
    buf_set_keymap('n', '<space>wl', '<cmd>lua print(vim.inspect(vim.lsp.buf.list_workspace_folders()))<CR>', opts)
    buf_set_keymap('n', '<space>td', '<cmd>lua vim.lsp.buf.type_definition()<CR>', opts)
    buf_set_keymap('n', '<space>rn', '<cmd>lua vim.lsp.buf.rename()<CR>', opts)
    buf_set_keymap('n', '<space>ca', '<cmd>lua vim.lsp.buf.code_action()<CR>', opts)
    buf_set_keymap('n', 'gr', '<cmd>lua vim.lsp.buf.references()<CR>', opts)
    buf_set_keymap('n', '<space>e', '<cmd>lua vim.lsp.diagnostic.show_line_diagnostics()<CR>', opts)
    buf_set_keymap('n', '[d', '<cmd>lua vim.lsp.diagnostic.goto_prev()<CR>', opts)
    buf_set_keymap('n', ']d', '<cmd>lua vim.lsp.diagnostic.goto_next()<CR>', opts)
    buf_set_keymap('n', '<space>q', '<cmd>lua vim.lsp.diagnostic.set_loclist()<CR>', opts)
    buf_set_keymap("n", "<space>f", "<cmd>lua vim.lsp.buf.formatting()<CR>", opts)
  end
  local flags = {
    debounce_text_changes = 100,
  }
  local servers = {'vimls',
                   'pyright',
                   'dockerls',
                   'tsserver',
                   'html',
                   'cssls',
                   -- 'flow',
                   'rust_analyzer',
                   -- 'denols',
                   -- 'sourcekit',
                   'clangd',
                   'taplo', -- cargo install taplo-lsp
                   'jsonls',
                   'texlab',
                   'bashls',
                   'cmake',}
  for _, lsp in ipairs(servers) do
    nvim_lsp[lsp].setup {
      on_attach = on_attach,
      flags = flags
    }
  end
end

--}}}
-- ┼─────────────────────────────────────────────────────────────────────────────────────┼
-- │ {{{                       « nivm compe Configurations »                             │
-- ┼─────────────────────────────────────────────────────────────────────────────────────┼

local nvim_compe_init = function()
  require'compe'.setup {
      enabled = true;
      autocomplete = true;
      debug = false;
      min_length = 1;
      preselect = 'enable';
      throttle_time = 80;
      source_timeout = 200;
      resolve_timeout = 800;
      incomplete_delay = 400;
      max_abbr_width = 100;
      max_kind_width = 100;
      max_menu_width = 100;
      documentation = {
          border = { '╭', '─' ,'╮', '│', '╯', '─', '╰', '│' },
          max_width = 120,
          min_width = 60,
          max_height = math.floor(vim.o.lines * 0.3),
          min_height = 1,
      };
      source = {
          -- ultisnips = true;
          path = true;
          buffer = true;
          calc = true;
          nvim_lsp = true;
          -- nvim_lua = true;
          -- vsnip = true;
      };
  }
end


local nvim_cmp_init = function()
  local cmp = require 'cmp'
  local WIDE_HEIGHT = 40
  cmp.setup {
    completion = {
      autocomplete = true,
      completeopt = 'menu,menuone,noinsert',
    },
    snippet = {
      expand = function(args)
        vim.fn["UltiSnips#Anon"](args.body)
      end,
    },
    mapping = {
      ['<C-p>'] = cmp.mapping.select_prev_item(),
      ['<C-n>'] = cmp.mapping.select_next_item(),
      ['<C-d>'] = cmp.mapping.scroll_docs(-4),
      ['<C-f>'] = cmp.mapping.scroll_docs(4),
      ['<C-Space>'] = cmp.mapping.complete(),
      ['<C-e>'] = cmp.mapping.close(),
      ['<CR>'] = cmp.mapping.confirm {},
    },
    documentation = {
      border = { '╭', '─' ,'╮', '│', '╯', '─', '╰', '│' },
      winhighlight = 'NormalFloat:CmpDocumentation,FloatBorder:CmpDocumentationBorder',
      maxwidth = math.floor((WIDE_HEIGHT * 2) * (vim.o.columns / (WIDE_HEIGHT * 2 * 16 / 9))),
      maxheight = math.floor(WIDE_HEIGHT * (WIDE_HEIGHT / vim.o.lines)),
    },
    sources = {
      { name = 'nvim_lsp' },
      { name = 'buffer' },
      { name = 'path' },
      { name = 'treesitter' },
      { name = 'ultisnips' },
      { name = 'calc' },
    },
  }
end

--}}}
-- ┼─────────────────────────────────────────────────────────────────────────────────────┼
-- │ {{{                             « Nvim LSP Kind »                                   │
-- ┼─────────────────────────────────────────────────────────────────────────────────────┼

local nvim_lspkind_init = function()
  require('lspkind').init({
    with_text = true,
    -- default: 'default'
    preset = 'codicons',
  })
end

--}}}
-- ┼─────────────────────────────────────────────────────────────────────────────────────┼
-- │ {{{                          « Status and Tab line »                                │
-- ┼─────────────────────────────────────────────────────────────────────────────────────┼

return {
  treesitter = treesitter_init,
  nvim_compe = nvim_compe_init,
  nvim_lsp = nvim_lsp_init,
  nvim_cmp = nvim_cmp_init,
  nvim_lspkind = nvim_lspkind_init,
}

-- vim:set foldmethod=marker:
