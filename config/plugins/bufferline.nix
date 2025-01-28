{
  plugins.bufferline = {
    enable = true;
    lazyLoad.settings.event = "BufAdd";
    settings = {
      options = {
        numbers.__raw = ''
          function(opts)
              return string.format('%s|%s', opts.id, opts.raise(opts.ordinal))
          end
        '';
        indicator = {
          style = "icon";
          icon = "▎";
        };
      };
    };
  };
}
