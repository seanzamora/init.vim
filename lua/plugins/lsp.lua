local lsp = require('lsp-zero')

local augroup = vim.api.nvim_create_augroup('LspFormatting', {})

local lsp_format_on_save = function(bufnr)
    vim.api.nvim_clear_autocmds({ group = augroup, buffer = bufnr })
    vim.api.nvim_create_autocmd('BufWritePre', {
        group = augroup,
        buffer = bufnr,
        callback = function()
            vim.lsp.buf.format()
        end,
    })
end

lsp.on_attach(function(_, bufnr)
    lsp_format_on_save(bufnr)

    local opts = { buffer = bufnr, remap = false }

    -- Keymap Reassign
    vim.keymap.set({ 'n', 'v' }, "<C-f>", function() vim.lsp.buf.format() end)
    vim.keymap.set({ 'n', 'v' }, "<A-CR>", function() vim.lsp.buf.code_action() end)
    vim.keymap.set("n", "gd", function() vim.lsp.buf.definition() end, opts)
    vim.keymap.set("n", "K", function() vim.lsp.buf.hover() end, opts)
    vim.keymap.set("n", "<leader>vws", function() vim.lsp.buf.workspace_symbol() end, opts)
    vim.keymap.set("n", "<leader>vd", function() vim.diagnostic.open_float() end, opts)
    vim.keymap.set("n", "[d", function() vim.diagnostic.goto_next() end, opts)
    vim.keymap.set("n", "]d", function() vim.diagnostic.goto_prev() end, opts)
    vim.keymap.set("n", "<leader>vrr", function() vim.lsp.buf.references() end, opts)
    vim.keymap.set("n", "<leader>vrn", function() vim.lsp.buf.rename() end, opts)
    vim.keymap.set("i", "<C-h>", function() vim.lsp.buf.signature_help() end, opts)
end)

lsp.setup()

local lspconfig = require('lspconfig')
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
        experimentalWorkspaceModule = true,
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

lspconfig.tailwindcss.setup({
    on_attach = function(client, bufnr)
        if client.server_capabilities.inlayHintProvider then
            vim.g.inlay_hint_visible = true
            vim.lsp.inlay_hint(bufnr, true)
            vim.api.nvim_set_hl(bufnr, 'LspInlayHint', { fg = 'red' })
        end
    end,
    settings = {
        classAttributes = { "class", "className", "class:list", "classList", "ngClass" },
        lint = {
            cssConflict = "warning",
            invalidApply = "error",
            invalidConfigPath = "error",
            invalidScreen = "error",
            invalidTailwindDirective = "error",
            invalidVariant = "error",
            recommendedVariantOrder = "warning"
        },
        validate = true
    },
    capabilities = lsp_capabilities
})

lspconfig.angularls.setup({
    on_attach = function(client, bufnr)
        if client.server_capabilities.inlayHintProvider then
            vim.g.inlay_hint_visible = true
            vim.lsp.inlay_hint(bufnr, true)
            vim.api.nvim_set_hl(bufnr, 'LspInlayHint', { fg = 'red' })
        end
    end,
    capabilities = lsp_capabilities
})

lspconfig.csharp_ls.setup({
    on_attach = function(client, bufnr)
        if client.server_capabilities.inlayHintProvider then
            vim.g.inlay_hint_visible = true
            vim.lsp.inlay_hint(bufnr, true)
            vim.api.nvim_set_hl(bufnr, 'LspInlayHint', { fg = 'red' })
        end
    end,
    capabilities = lsp_capabilities
})

require("mason").setup()
