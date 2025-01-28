{utils, ...}: let
  inherit (utils) map raw wk;
in {
  imports = [./diagnostics.nix];

  plugins.lsp = {
    enable = true;
    inlayHints = false;
    lazyLoad.settings = {
      cmd = "LspInfo";
      event = [
        "BufNewFile"
        "BufReadPost"
        "BufWritePost"
      ];
      before.__raw = ''
        function()
          require('lz.n').trigger_load('blink.cmp')
        end
      '';
    };
    servers = let
      opts = {
        enable = true;
        # package = null; FIXME: not installing lsp shows annoying warning when opening ft
        # HACK?: rounded borders on lsp hover
        extraOptions.handlers.__raw = ''
          {
            ["textDocument/hover"] =  vim.lsp.with(vim.lsp.handlers.hover, {border = "rounded"}),
            ["textDocument/signatureHelp"] =  vim.lsp.with(vim.lsp.handlers.signature_help, {border = "rounded"}),
          }
        '';
      };
    in {
      lua_ls = opts;
      clangd = opts;
      pyright = opts;
      nixd = opts; # extend nixvim derivation and configure this!!
    };
  };

  plugins.which-key.settings.spec = [
    (wk "<leader>l" "+LSP" {})
    (wk "<leader>lg" "+Go to" {})
  ];

  keymaps = [
    (map "n" "<leader>lgD" (raw "vim.lsp.buf.declaration") {desc = "Go to declaration";})
    (map "n" "<leader>lgd" (raw "vim.lsp.buf.definition") {desc = "Go to definition";})
    (map "n" "<leader>lgt" (raw "vim.lsp.buf.type_definition") {desc = "Go to type";})
    (map "n" "<leader>lgi" (raw "vim.lsp.buf.implementation") {desc = "List implementations";})
    (map "n" "<leader>lgr" (raw "vim.lsp.buf.references") {desc = "List references";})

    (map "n" "<leader>lgp" (raw "vim.diagnostic.goto_prev") {desc = "Go to previous diagnostic";})
    (map "n" "<leader>lgn" (raw "vim.diagnostic.goto_next") {desc = "Go to next diagnostic";})

    (map "n" "<leader>lh" (raw "vim.lsp.buf.hover") {desc = "Trigger hover";})
    (map "n" "<leader>lr" (raw "vim.lsp.buf.rename") {desc = "Rename symbol";})
    (map "n" "<leader>la" (raw "vim.lsp.buf.code_action") {desc = "Code action";})
  ];
}
