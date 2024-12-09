-- load defaults i.e lua_lsp
require("nvchad.configs.lspconfig").defaults()

local lspconfig = require "lspconfig"

-- EXAMPLE
local servers = { "html", "cssls", "marksman", "clangd", "pyright", "ts_ls", "java_language_server", "dockerls", "docker_compose_language_service", "jsonls", "kotlin_language_server", "bashls", "yamlls", "sqls", "nil_ls", "rust_analyzer" }
local nvlsp = require "nvchad.configs.lspconfig"

-- lsps with default config
for _, lsp in ipairs(servers) do
  lspconfig[lsp].setup {
    on_attach = nvlsp.on_attach,
    on_init = nvlsp.on_init,
    capabilities = nvlsp.capabilities,
  }
end
lspconfig.gdscript.setup {
  cmd = { "ncat", "localhost", "6005"}
}
lspconfig.rust_analyzer.setup {
  cmd = { "/home/simon/.nix-profile/bin/rust-analyzer" }
}

-- configuring single server, example: typescript
-- lspconfig.ts_ls.setup {
--   on_attach = nvlsp.on_attach,
--   on_init = nvlsp.on_init,
--   capabilities = nvlsp.capabilities,
-- }
