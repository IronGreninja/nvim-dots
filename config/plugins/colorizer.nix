{
  plugins.colorizer = {
    enable = true;
    lazyLoad.settings.event = "DeferredUIEnter";

    settings = {
      user_default_options = {
        mode = "virtualtext";
        virtualtext = "■";
        names = false;
        css_fn = true;
      };
    };
  };
}
