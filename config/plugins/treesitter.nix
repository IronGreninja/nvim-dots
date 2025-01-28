{
  plugins.treesitter = {
    enable = true;
    lazyLoad.settings = {
      event = [
        "BufNewFile"
        "BufReadPost"
        "BufWritePost"
        "DeferredUIEnter"
      ];
    };
    settings = {
      auto_install = false;
      indent = {
        enable = true;
      };
      highlight = {
        enable = true;
      };
    };
  };
}
