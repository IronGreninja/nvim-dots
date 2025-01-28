{pkgs, ...}: {
  extraPlugins = [pkgs.vimPlugins.gruvbox-material];
  extraConfigLua = ''
    vim.g.gruvbox_material_background = "hard";
    vim.g.gruvbox_material_enable_bold = 1;
    vim.cmd.colorscheme 'gruvbox-material'
  '';
}
