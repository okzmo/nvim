return {
  "neovim/nvim-lspconfig",
  opts = {
    setup = {
      svelte = function(_)
        LazyVim.lsp.on_attach(function(client)
          if client.name == "svelte" then
            vim.api.nvim_create_autocmd("BufWritePost", {
              pattern = { "*.js", "*.ts" },
              callback = function(ctx)
                client.notify("$/onDidChangeTsOrJsFile", { uri = ctx.match })
              end,
            })
          end
        end)
      end,
    },
  },
}
