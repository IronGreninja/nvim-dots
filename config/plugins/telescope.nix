{utils, ...}: let
  inherit (utils) wk;
in {
  plugins.telescope = {
    enable = true;
    lazyLoad.settings = {
      event = "DeferredUIEnter";
      keys = ["<leader>f"];
    };

    extensions = {
      fzf-native.enable = true;
    };

    settings.defaults = {
      prompt_prefix = "   ";
      mappings = {
        i = {
          "<C-j>" = "preview_scrolling_down";
          "<C-k>" = "preview_scrolling_up";
        };
      };
      layout_config = {prompt_position = "top";};
      sorting_strategy = "ascending";
      file_ignore_patterns = [".git/" "result/" "dist/" "build/" "target/"];
    };

    keymaps = let
      map = action: desc: {
        inherit action;
        mode = "n";
        options.desc = desc;
      };
    in {
      "<leader>ff" = map "find_files" "Find files in cwd";
      "<leader>fs" = map "live_grep" "Find(grep) string in cwd";
      "<leader>fw" = map "grep_string" "Find(grep) word under cursor in cwd";
      "<leader>fb" = map "buffers" "Find open buffers";
      "<leader>fh" = map "help_tags" "Find help";
      "<leader>fk" = map "keymaps" "Find keymaps";
      "<leader>ft" = map "" "Open [Telescope]";
    };
  };

  plugins.which-key.settings.spec = [
    (wk "<leader>f" "+Telescope" {icon = " ";})
  ];
}
