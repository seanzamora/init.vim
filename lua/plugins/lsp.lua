local lsp = require('lsp-zero')

lsp.preset('recommended')

lsp.nvim_workspace()

lsp.configure('lua_ls', {
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
    }
})

lsp.configure('gopls', {
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

lsp.configure('tsserver', {
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
    }
})

lsp.setup()

-- Keymap Reassign
vim.keymap.set({ 'n', 'v' }, "<C-f>", function()
    vim.lsp.buf.format()
end)

vim.keymap.set({ 'n', 'v' }, "<A-CR>", function()
    vim.lsp.buf.code_action()
end)
