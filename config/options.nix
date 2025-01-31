{
  opts = let
    indentSize = 2;
  in {
    cursorline = true; # highlight current line
    cursorlineopt = "line"; # highlight only line number of current line

    termguicolors = true; # required for colorschemes and other plugins
    background = "dark"; # set dark as default for colorschemes with both light & dark variants

    # line numbers
    relativenumber = true; # show relative numbers
    number = true; # show absolute line number on cursor line (when relative number is on)

    # hlsearch = false  # set highlight on search
    mouse = "a"; # mouse support for noobs
    breakindent = true; # enable break indent

    # tabs and indentation
    tabstop = indentSize; # 2 spaces for tabs
    shiftwidth = indentSize; # 2 spaces for indent width when using '>>' or '<<' on existing line
    softtabstop = indentSize;
    expandtab = true; # expand tab to spaces
    autoindent = true; # copy indent from current line when starting new one
    smartindent = false;

    # Case-insensitive searching UNLESS \C or capital in search
    ignorecase = true;
    smartcase = true;

    signcolumn = "yes"; # keep signcolumn on by default

    # Decrease update time
    updatetime = 250;
    timeoutlen = 300;

    undofile = true; # save undo history

    # clipboard = "unnamedplus" # sync clipboard b/w os and neovim
    # Syncing clutters the system clipboard with every yank and delete.
    # Instead; selectively copy/paste to/from system clipboard with the '+' register
    # Ex: "+yy   -> yank the line and send to '+' register (system clipboard)
    # Ex: "+p    -> paste from '+' register (system clipboard)

    # Minimal number of screen lines to keep above and below the cursor.
    scrolloff = 10;

    list = true;
    listchars = {
      tab = "» ";
      trail = "·";
      nbsp = "␣";
    };

    # Preview substitutions live; as you type!
    inccommand = "split";

    # Folds
    fillchars = {
      eob = " ";
      fold = " ";
      foldclose = "";
      foldopen = "";
      foldsep = "▕";
    };
    foldcolumn = "0";
    foldenable = true;
    foldlevel = 99;
    foldlevelstart = 99;
  };
}
