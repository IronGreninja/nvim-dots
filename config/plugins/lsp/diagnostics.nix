{
  diagnostics = {
    signs.text.__raw = let
      S = "vim.diagnostic.severity";
    in ''
      {
        [${S}.ERROR] = "󰅚 ";
        [${S}.WARN] = "󰀪 ";
        [${S}.HINT] = "󰌶 ";
        [${S}.INFO] = " ";
      }
    '';
    float = {
      source = true;
      border = "rounded";
    };
    # virtual_text = {
    #   source = "if_many";
    #   prefix = "●";
    # };
    virtual_text = false;
  };
}
