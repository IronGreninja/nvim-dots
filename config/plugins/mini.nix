{utils, ...}: let
  inherit (utils) map wk;
in {
  plugins.mini = {
    enable = true;
    # lazyLoad.settings.event = "DeferredUIEnter"; # No lazy-loading to work with directory in arglist for mini.files
    mockDevIcons = true;
    modules = {
      icons = {};
      surround = {};
      comment = {};
      pairs = {};

      files = {
        content.filter.__raw = ''
          function(fs_entry)
            local hidden = {[".git"] = 1, [".direnv"] = 1}
            return not hidden[fs_entry.name]
          end
        '';

        options = {
          use_as_default_explorer = true;
          permanent_delete = false;
        };
        windows.preview = true;
      };

      # indentscope = {
      #   symbol = "│";
      # };
    };
  };

  plugins.which-key.settings.spec = [
    (wk "<leader>e" "+Explorer" {icon = "󰙅 ";})
  ];

  keymaps = [
    (map "n" "<leader>eo" ":lua MiniFiles.open()<CR>" {desc = "Open file explorer";})
    (map "n" "<leader>eF" ":lua MiniFiles.open(nil, false)<CR>" {desc = "Open fresh explorer in cwd";})
    (map "n" "<leader>eC" ":lua MiniFiles.open(vim.api.nvim_buf_get_name(0))<CR>" {desc = "Open fresh explorer in directory of current file";})
  ];
}
