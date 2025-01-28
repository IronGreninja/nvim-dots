{
  plugins.indent-blankline = {
    enable = true;
    lazyLoad.settings = {
      event = ["BufReadPost"];
    };

    settings = {
      scope.enabled = true;
      indent.char = "│";
    };
  };
}
