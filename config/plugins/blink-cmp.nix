{
  lib,
  config,
  ...
}: {
  plugins = {
    blink-cmp = {
      enable = true;
      lazyLoad.settings = {
        event = "DeferredUIEnter";
      };

      settings = {
        keymap.preset = "default";
        appearance = {
          use_nvim_cmp_as_default = true;
          nerd_font_variant = "mono";
        };

        completion = {
          # ghost_text.enabled = true;
          menu.border = "rounded";

          menu.draw.columns = [
            {
              __unkeyed-1 = "kind_icon";
              __unkeyed-2 = "label";
              __unkeyed-3 = "label_description";
              gap = 1;
            }
            ["source_name"]
          ];

          menu.draw.components.source_name.text.__raw = ''
            function(ctx)
              return string.format("[%s]", ctx.source_name)
            end
          '';

          documentation = {
            auto_show = true;
            auto_show_delay_ms = 200;
            window = {
              border = "rounded";
            };
          };
        };

        sources.default = ["lsp" "path" "snippets" "buffer"];
      };
    };

    friendly-snippets.enable = true;

    lsp.capabilities = ''
      capabilities = require("blink.cmp").get_lsp_capabilities(capabilities)
    '';
  };
}
