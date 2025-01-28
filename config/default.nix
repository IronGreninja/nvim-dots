{pkgs, ...}: {
  imports = [
    ./options.nix
    ./keymaps.nix
    ./plugins
  ];

  globals = {
    autoformat = true;

    mapleader = " ";
    maplocalleader = " ";
  };

  viAlias = true;
  vimAlias = true;

  extraPackages = with pkgs; [ripgrep fd];

  clipboard.providers.wl-copy.enable = true;
}
