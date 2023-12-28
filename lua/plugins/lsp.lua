local lspconfig = require('lspconfig')
local lsp = require('lsp-zero')
local lsp_capabilities = require('cmp_nvim_lsp').default_capabilities()

lspconfig.lua_ls.setup({
    on_attach = function(client, bufnr)
        if client.server_capabilities.inlayHintProvider then
            vim.g.inlay_hint_visible = true
            vim.lsp.buf.inlay_hint(bufnr, true)
            vim.api.nvim_set_hl(bufnr, 'LspInlayHint', { fg = 'red' })
        end
    end,
    settings = {
        Lua = {
            diagnostics = {
                globals = { 'vim' }
            },
            hint = {
                enable = true,
            }
        }
    },
    capabilities = lsp_capabilities
})

lspconfig.tsserver.setup({
    on_attach = function(client, bufnr)
        if client.server_capabilities.inlayHintProvider then
            vim.g.inlay_hint_visible = true
            vim.lsp.buf.inlay_hint(bufnr, true)
            vim.api.nvim_set_hl(bufnr, 'LspInlayHint', { fg = 'red' })
        end
    end,
    settings = {
        javascript = {
            inlayHints = {
                includeInlayEnumMemberValueHints = true,
                includeInlayFunctionLikeReturnTypeHints = true,
                includeInlayFunctionParameterTypeHints = true,
                includeInlayParameterNameHints = "all", -- 'none' | 'literals' | 'all';
                includeInlayParameterNameHintsWhenArgumentMatchesName = true,
                includeInlayPropertyDeclarationTypeHints = true,
                includeInlayVariableTypeHints = true,
            },
        },
        typescript = {
            inlayHints = {
                includeInlayEnumMemberValueHints = true,
                includeInlayFunctionLikeReturnTypeHints = true,
                includeInlayFunctionParameterTypeHints = true,
                includeInlayParameterNameHints = "all", -- 'none' | 'literals' | 'all';
                includeInlayParameterNameHintsWhenArgumentMatchesName = true,
                includeInlayPropertyDeclarationTypeHints = true,
                includeInlayVariableTypeHints = true,
            },
        },
    },
    capabilities = lsp_capabilities
})

lspconfig.gopls.setup({
    on_attach = function(client, bufnr)
        if client.server_capabilities.inlayHintProvider then
            vim.g.inlay_hint_visible = true
            vim.lsp.inlay_hint(bufnr, true)
            vim.api.nvim_set_hl(bufnr, 'LspInlayHint', { fg = 'red' })
        end
    end,
    settings = {
        hints = {
            assignVariableTypes = true,
            compositeLiteralFields = true,
            compositeLiteralTypes = true,
            constantValues = true,
            functionTypeParameters = true,
            parameterNames = true,
            rangeVariableTypes = true,
        },
    },
})

lsp.setup()

-- Keymap Reassign
vim.keymap.set({ 'n', 'v' }, "<C-f>", function()
    vim.lsp.buf.format()
end)

vim.keymap.set({ 'n', 'v' }, "<A-CR>", function()
    vim.lsp.buf.code_action()
end)
