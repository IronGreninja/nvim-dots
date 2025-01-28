{
  imports = [
    ./blink-cmp.nix
    ./bufferline.nix
    ./colorizer.nix
    ./colorscheme.nix
    ./conform.nix
    ./indent-blankline.nix
    ./lint.nix
    ./lsp
    ./lualine.nix
    ./mini.nix
    # ./oil.nix
    ./telescope.nix
    ./treesitter.nix
    ./which-key.nix
  ];

  plugins = {
    lz-n.enable = true;

    fugitive.enable = true;
    dressing = {
      enable = true;
      # lazyLoad.settings.event = "DeferredUIEnter";
    };
  };
}
