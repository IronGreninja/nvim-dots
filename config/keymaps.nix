{utils, ...}: let
  inherit (utils) map wk;
in {
  keymaps = [
    (map "n" "<leader>N" ":nohl<CR>" {desc = "Clear search highlights";})

    # Increment/Decrement numbers
    (map "n" "<leader>+" "<C-a>" {desc = "Increment number";})
    (map "n" "<leader>-" "<C-x>" {desc = "Decrement number";})

    # Window management
    (map "n" "<leader>wsv" "<C-w>v" {desc = "Split window vertically";})
    (map "n" "<leader>wsh" "<C-w>s" {desc = "Split window horizontally";})
    (map "n" "<leader>wss" "<C-w>r" {desc = "Swap splits";})
    (map "n" "<leader>wsx" ":close<CR>" {desc = "Close current split";})

    # Tabs
    (map "n" "<leader>to" "<cmd>tabnew<CR>" {desc = "Open new tab";})
    (map "n" "<leader>tx" "<cmd>tabclose<CR>" {desc = "Close current tab";})
    (map "n" "<leader>tn" "<cmd>tabn<CR>" {desc = "Go to next tab";})
    (map "n" "<leader>tn" "<cmd>tabp<CR>" {desc = "Go to previous tab";})
    (map "n" "<leader>tf" "<cmd>tabnew %<CR>" {desc = "Open current buffer in new tab";})

    # Move b/w windows
    (map "n" "<C-h>" "<C-w>h" {})
    (map "n" "<C-j>" "<C-w>j" {})
    (map "n" "<C-k>" "<C-w>k" {})
    (map "n" "<C-l>" "<C-w>l" {})
    # Terminal
    (map "t" "<C-h>" "<cmd>wincmd h<CR>" {})
    (map "t" "<C-j>" "<cmd>wincmd j<CR>" {})
    (map "t" "<C-k>" "<cmd>wincmd k<CR>" {})
    (map "t" "<C-l>" "<cmd>wincmd l<CR>" {})

    # Resize windows
    (map ["n" "t"] "<C-Up>" ":resize -2<CR>" {})
    (map ["n" "t"] "<C-Down>" ":resize +2<CR>" {})
    (map ["n" "t"] "<C-Left>" ":vertical resize -2<CR>" {})
    (map ["n" "t"] "<C-Down>" ":vertical resize +2<CR>" {})

    # Move b/w buffers
    (map "n" "<BS>" ":bnext<CR>" {desc = "Next buffer";})
    (map "n" "<S-BS>" ":bprev<CR>" {desc = "Prev buffer";})
  ];

  plugins.which-key.settings.spec = [
    (wk "<leader>w" "+Window" {icon = " ";})
    (wk "<leader>ws" "+Split" {icon = " ";})
    (wk "<leader>t" "+Tab" {icon = "󰓩 ";})
  ];
}
