{utils, ...}: let
  inherit (utils) wk map raw;
in {
  plugins.gitsigns = {
    enable = true;
  };

  # plugins.fugitive.enable = true;

  plugins.which-key.settings.spec = [
    (wk "<leader>g" "+Git" {icon = " ";})
  ];

  keymaps = let
    G = "package.loaded.gitsigns";
  in [
    (map "n" "<leader>gs" (raw "${G}.stage_hunk") {desc = "Stage hunk";})

    (map "v" "<leader>gs" (raw ''
      function()
        ${G}.stage_hunk({ vim.fn.line('.'), vim.fn.line('v') })
      end
    '') {desc = "Stage hunk";})

    (map "n" "<leader>gr" (raw "${G}.reset_hunk") {desc = "Reset hunk";})

    (map "v" "<leader>gr" (raw ''
      function()
        ${G}.reset_hunk({ vim.fn.line('.'), vim.fn.line('v') })
      end
    '') {desc = "Reset hunk";})

    (map "n" "<leader>gS" (raw "${G}.stage_buffer") {desc = "Stage buffer";})
    (map "n" "<leader>gR" (raw "${G}.reset_buffer") {desc = "Reset buffer";})
    (map "n" "<leader>gp" (raw "${G}.preview_hunk") {desc = "Preview hunk";})
    (map "n" "<leader>gi" (raw "${G}.preview_hunk_inline") {desc = "Preview hunk inline";})
  ];
}
