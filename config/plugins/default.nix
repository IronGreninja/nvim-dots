{
  imports = [
    # ./oil.nix
    ./blink-cmp.nix
    ./bufferline.nix
    ./colorizer.nix
    ./colorscheme.nix
    ./conform.nix
    ./git.nix
    ./indent-blankline.nix
    ./lint.nix
    ./lsp
    ./lualine.nix
    ./mini.nix
    ./telescope.nix
    ./treesitter.nix
    ./which-key.nix
  ];

  plugins = {
    lz-n.enable = true;

    sleuth.enable = true;
    dressing = {
      enable = true;
      # lazyLoad.settings.event = "DeferredUIEnter";
    };
  };
}
